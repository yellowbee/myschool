package com.aidu.myschool.solr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import com.aidu.myschool.domain.College;
import com.aidu.myschool.domain.CollegeSearchCriteria;
import com.aidu.myschool.util.PropertiesUtil;

public class SolrUtil {
	private static String url = "http://localhost:8983/solr/collection1";
	private static SolrClient solr = new HttpSolrClient(url);
	private static PropertiesUtil propUtil = new PropertiesUtil();
	
	public static List<College> getCollegeListBySearchCriteria(CollegeSearchCriteria criteria)
		throws IOException {

		Properties prop = propUtil.getProperties("/config/state-mapping.properties");
		String queryString = null;
		
		if (criteria.getStates() != null) {
			queryString = "(a1_state_s:DUMMY";
			for (String state : criteria.getStates()) {
				queryString += " OR a1_state_s:" + prop.getProperty(state.replace(" ", ""));
			}
			queryString += ")";
		}
		
		if (criteria.getSrcInstCtrl() != null) {
			queryString += "AND (a2_src_instl_ctrl_s:" + criteria.getSrcInstCtrl() + ")";
		}
		
		if (queryString == null) {
			queryString = "*:*";
		}
		
		SolrQuery query = new SolrQuery();
		query.set("q", queryString);
		query.set("fl", "a1_nm_cllg_s, a1_city_s, a1_state_s");
		ArrayList<College> collegeList = new ArrayList<College>();
		
		try {
			QueryResponse response = solr.query(query);
			SolrDocumentList results = response.getResults();
			for (SolrDocument sdoc : results) {
				collegeList.add(new College((String)sdoc.get("a1_nm_cllg_s"), (String)sdoc.get("a1_city_s"), (String)sdoc.get("a1_state_s")));
			}
			/*for (int i = 0; i < results.size(); ++i) {
			      System.out.println(results.get(i));
			}*/
		} catch (SolrServerException e) {
			e.printStackTrace();
		}

		return collegeList; 
	}
}
