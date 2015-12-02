package com.aidu.myschool.solr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.College;
import com.aidu.myschool.domain.CollegeSearchCriteria;
import com.aidu.myschool.domain.Enrollment;
import com.aidu.myschool.domain.MajorsPerDegreeList;
import com.aidu.myschool.domain.Pair;
import com.aidu.myschool.util.PropertiesUtil;

public class SolrUtil {
	final private static String SOLR_FIELD_STATE = "state";
	final private static String SOLR_FIELD_MAJOR = "major";
	final private static String SOLR_FIELD_SHCOOL_NAME = "school-name";
	final private static String SOLR_FIELD_CITY = "city";
	final private static String SOLR_FIELD_MAJORS_PER_DEGREE = "majors-by-degrees-ratio";
	final private static String RECEIVED_UNDERGRAD = "rcvd_undergrad";
	final private static String ACCEPTED_UNDERGRAD = "axptd_undergrad";
	final private static String ENROLLED_UNDERGRAD = "enrld_undergrad";
	final private static int SOLR_MAX_RETURNED_DOCS = 100000;
	
	final private static String url = "http://localhost:8983/solr/collection1";
	private static SolrClient solr = new HttpSolrClient(url);
	private static PropertiesUtil propUtil = new PropertiesUtil();
	
	public static List<College> getCollegeListBySearchCriteria(CollegeSearchCriteria criteria)
		throws IOException {

		//Properties prop = propUtil.getProperties("/config/state-mapping.properties");
		String queryString = "";
		
		if (criteria.getStates() != null) {
			queryString = "(a1_state_s:DUMMY";
			for (String state : criteria.getStates()) {
				queryString += " OR " + SOLR_FIELD_STATE + ":" + "\"" + state + "\"";
			}
			queryString += ")";
		}
		
		if (criteria.getMajors() != null) {
			if (!queryString.equals("")) queryString += "AND ";
			queryString += "(major:DUMMY";
			for (String major : criteria.getMajors()) {
				queryString += " OR " + SOLR_FIELD_MAJOR + ":" + "\"" + major + " BA" + "\"";
			}
			queryString += ")";
		}
		
		if (criteria.getSrcInstCtrl() != null) {
			if (queryString.equals("")) queryString += "AND ";
			queryString += "(a2_src_instl_ctrl_s:" + criteria.getSrcInstCtrl() + ")";
		}
		
		if (queryString.equals("")) {
			queryString = "*:*";
		}
		
		SolrQuery query = new SolrQuery();
		query.set("q", queryString);
		query.set("fl", "school-name, city, state");
		query.set("rows", SOLR_MAX_RETURNED_DOCS);
		ArrayList<College> collegeList = new ArrayList<College>();
		
		try {
			QueryResponse response = solr.query(query);
			SolrDocumentList results = response.getResults();
			for (SolrDocument sdoc : results) {
				collegeList.add(new College((String)sdoc.get(SOLR_FIELD_SHCOOL_NAME), (String)sdoc.get(SOLR_FIELD_CITY), (String)sdoc.get(SOLR_FIELD_STATE)));
			}
			/*for (int i = 0; i < results.size(); ++i) {
			      System.out.println(results.get(i));
			}*/
		} catch (SolrServerException e) {
			e.printStackTrace();
		}

		return collegeList; 
	}
	
	public static List<AjaxResponse> getMajorsPerDegreeBySchoolName(CollegeSearchCriteria criteria)
			throws IOException {
		String queryString = "";
		if (criteria.getSchoolName() != null) {
			queryString = "school-name:" + "\"" + criteria.getSchoolName() + "\"";
		}

		SolrQuery query = new SolrQuery();
		query.set("q", queryString);
		query.set("fl", SOLR_FIELD_MAJORS_PER_DEGREE + "," + RECEIVED_UNDERGRAD + "," + ACCEPTED_UNDERGRAD + "," + ENROLLED_UNDERGRAD);
		query.set("rows", SOLR_MAX_RETURNED_DOCS);
		List<AjaxResponse> degreeCountList = new ArrayList<AjaxResponse>();
		
		try {
			QueryResponse response = solr.query(query);
			SolrDocumentList results = response.getResults();
			String countStr = (String)results.get(0).get(SOLR_FIELD_MAJORS_PER_DEGREE);
			/*for (int i = 0; i < results.size(); ++i) {
			      System.out.println(results.get(i));
			}*/
			MajorsPerDegreeList majorsPerDegreeList = new MajorsPerDegreeList();
			String[] countStrArray = countStr.split(",");
			if (countStrArray.length == 5) {
				if (!"0".equals(countStrArray[0])) {
					majorsPerDegreeList.getMajorsPerDegreeList().add(new Pair("证书", countStrArray[0]));
				}
				if (!"0".equals(countStrArray[1])) {
					majorsPerDegreeList.getMajorsPerDegreeList().add(new Pair("大专", countStrArray[1]));
				}
				if (!"0".equals(countStrArray[2])) {
					majorsPerDegreeList.getMajorsPerDegreeList().add(new Pair("本科", countStrArray[2]));
				}
				if (!"0".equals(countStrArray[3])) {
					majorsPerDegreeList.getMajorsPerDegreeList().add(new Pair("硕士", countStrArray[3]));
				}
				if (!"0".equals(countStrArray[4])) {
					majorsPerDegreeList.getMajorsPerDegreeList().add(new Pair("博士", countStrArray[4]));
				}
				degreeCountList.add(majorsPerDegreeList);
			}
			
			String rcvd_undergrad = ((String)results.get(0).get(RECEIVED_UNDERGRAD)).replace(",", "");
			String axptd_undergrad = ((String)results.get(0).get(ACCEPTED_UNDERGRAD)).replace(",", "");
			String enrld_undergrad = ((String)results.get(0).get(ENROLLED_UNDERGRAD)).replace(",", "");
			Enrollment enrollment = new Enrollment();
			enrollment.getEnrollment().add(new Pair("申请人数", rcvd_undergrad));
			enrollment.getEnrollment().add(new Pair("录取人数", axptd_undergrad));
			enrollment.getEnrollment().add(new Pair("入学人数", enrld_undergrad));
			degreeCountList.add(enrollment);
			
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		
		return degreeCountList;
	}
}
