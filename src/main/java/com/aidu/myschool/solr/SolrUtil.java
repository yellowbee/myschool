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
import com.aidu.myschool.domain.Pair;
import com.aidu.myschool.domain.PairNum;
import com.aidu.myschool.util.PropertiesUtil;
import com.aidu.myschool.web.domain.ajaxrequest.CollegeSearchCriteria;
import com.aidu.myschool.web.domain.ajaxresponse.Contact;
import com.aidu.myschool.web.domain.ajaxresponse.Enrollment;
import com.aidu.myschool.web.domain.ajaxresponse.Faculty;
import com.aidu.myschool.web.domain.ajaxresponse.GraduationRate;
import com.aidu.myschool.web.domain.ajaxresponse.MajorsPerDegreeList;
import com.aidu.myschool.web.domain.ajaxresponse.Tuition;

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
	final private static String NUM_PROF = "num_prof";
	final private static String NUM_ASSOC_PROF = "num_assoc_prof";
	final private static String NUM_ASSST_PROF = "num_assst_prof";
	final private static String ROOM_FEE = "room_fee";
	final private static String BOARD_FEE = "board_fee";
	final private static String IN_STATE_TUITION_FEES_UNDER = "in-state-tuition-fees-under";
	final private static String GRAD_RATE_BA_IN_4YEARS = "grad_rate_ba_in_4years";
	final private static String GRAD_RATE_BA_IN_5YEARS = "grad_rate_ba_in_5years";
	final private static String GRAD_RATE_BA_IN_6YEARS = "grad_rate_ba_in_6years";
	final private static String ADDRESS = "address";
	final private static String URL = "url";
	final private static String EMAIL = "e-mail";
	
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
		
		if (!criteria.getSrcInstCtrl().equals("dontcare")) {
			if (!queryString.equals("")) queryString += "AND ";
			queryString += "(control:" + "\"" + criteria.getSrcInstCtrl() + "\"" + ")";
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

		// constructs the query string for solr
		SolrQuery query = new SolrQuery();
		query.set("q", queryString);
		query.set("fl", SOLR_FIELD_MAJORS_PER_DEGREE + "," +
						RECEIVED_UNDERGRAD + "," + ACCEPTED_UNDERGRAD + "," + ENROLLED_UNDERGRAD + "," +
						NUM_PROF + "," + NUM_ASSOC_PROF + "," + NUM_ASSST_PROF + "," +
						ROOM_FEE + "," + BOARD_FEE + "," + IN_STATE_TUITION_FEES_UNDER + "," +
						GRAD_RATE_BA_IN_4YEARS + "," + GRAD_RATE_BA_IN_5YEARS + "," + GRAD_RATE_BA_IN_6YEARS + "," +
						ADDRESS + "," + URL + "," + EMAIL);
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
			enrollment.getEnrollment().add(new PairNum("申请人数", Integer.valueOf(rcvd_undergrad).intValue()));
			enrollment.getEnrollment().add(new PairNum("录取人数", Integer.valueOf(axptd_undergrad).intValue()));
			enrollment.getEnrollment().add(new PairNum("入学人数", Integer.valueOf(enrld_undergrad).intValue()));
			degreeCountList.add(enrollment);
			
			String num_prof = (String)results.get(0).get(NUM_PROF);
			String num_assoc_prof = (String)results.get(0).get(NUM_ASSOC_PROF);
			String num_assst_prof = (String)results.get(0).get(NUM_ASSST_PROF);
			Faculty faculty = new Faculty();
			faculty.getFaculty().add(new PairNum("教授", Integer.valueOf(num_prof).intValue()));
			faculty.getFaculty().add(new PairNum("副教授", Integer.valueOf(num_assoc_prof).intValue()));
			faculty.getFaculty().add(new PairNum("助理教授", Integer.valueOf(num_assst_prof).intValue()));
			degreeCountList.add(faculty);
			
			String room_fee = (String)results.get(0).get(ROOM_FEE);
			String board_fee = (String)results.get(0).get(BOARD_FEE);
			String in_state_tuition_fees_under = (String)results.get(0).get(IN_STATE_TUITION_FEES_UNDER);
			Tuition tuition = new Tuition();
			tuition.getTuition().add(new Pair("住宿费", room_fee));
			tuition.getTuition().add(new Pair("伙食费", board_fee));
			tuition.getTuition().add(new Pair("州内学费", in_state_tuition_fees_under));
			degreeCountList.add(tuition);
			
			String grad_rate_in_4 = ((String)results.get(0).get(GRAD_RATE_BA_IN_4YEARS)).replace("%", "");
			String grad_rate_in_5 = ((String)results.get(0).get(GRAD_RATE_BA_IN_5YEARS)).replace("%", "");
			String grad_rate_in_6 = ((String)results.get(0).get(GRAD_RATE_BA_IN_6YEARS)).replace("%", "");
			GraduationRate gradRate = new GraduationRate();
			gradRate.getGradRate().add(new Pair("", grad_rate_in_4));
			gradRate.getGradRate().add(new Pair("", grad_rate_in_5));
			gradRate.getGradRate().add(new Pair("", grad_rate_in_6));
			degreeCountList.add(gradRate);
			
			String address = (String)results.get(0).get(ADDRESS);
			String url = (String)results.get(0).get(URL);
			String email = (String)results.get(0).get(EMAIL);
			Contact contact = new Contact(address, url, email);
			degreeCountList.add(contact);
			
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		
		return degreeCountList;
	}
}
