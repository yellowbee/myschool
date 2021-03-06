package com.aidu.myschool.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.College;
import com.aidu.myschool.solr.SolrUtil;
import com.aidu.myschool.web.domain.ajaxrequest.CollegeSearchCriteria;
import com.aidu.myschool.web.domain.ajaxresponse.ResponseStatus;

@Controller
public class HomeController {
	
	/*
	 * @RequestMapping(value="/authentication", method = RequestMethod.POST)
	 * public ModelAndView authenticate(HttpServletResponse response) throws
	 * IOException{ return new ModelAndView("dashboard"); }
	 */
	@RequestMapping(value = "/college_list", method = RequestMethod.GET)
	public ModelAndView collegeList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		
		// if user has not loggin in yet or already logged out
		if (session == null || session.getAttribute("user") == null) {
			return new ModelAndView("redirect:login");
		}
		return new ModelAndView("college_list");
	}
	
	@RequestMapping(value = "/find_my_college", method = RequestMethod.GET)
	public ModelAndView findMyCollege(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//HttpSession session = request.getSession(false);
		
		// if user has not loggin in yet or already logged out
		/*if (session == null || session.getAttribute("user") == null) {
			return new ModelAndView("redirect:login");
		}*/
		HttpSession session = request.getSession(false);
		
		ModelAndView mav = new ModelAndView("find_my_college");
		//if user has not loggin in yet or already logged out
		if (session == null || session.getAttribute("user") == null) {
			mav.addObject("logged", "display-none");
			mav.addObject("unlogged", "display-inline");
		}
		else {
			mav.addObject("unlogged", "display-none");
			mav.addObject("logged", "display-inline");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/my_app", method = RequestMethod.GET)
	public ModelAndView myApp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		
		// if user has not loggin in yet or already logged out
		if (session == null || session.getAttribute("user") == null) {
			return new ModelAndView("redirect:login");
		}
		return new ModelAndView("my_app");
	}
	
	@RequestMapping(value = "/college_report", method = RequestMethod.GET)
	public ModelAndView collegeReport(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		
		// if user has not loggin in yet or already logged out
		if (session == null || session.getAttribute("user") == null) {
			return new ModelAndView("redirect:login");
		}
		return new ModelAndView("college_report");
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		
		// if user has not loggin in yet or already logged out
		if (session == null || session.getAttribute("user") == null) {
			return new ModelAndView("redirect:login");
		}
		return new ModelAndView("dashboard");
	}

	@RequestMapping(value = "/college_search", method = RequestMethod.GET)
	public ModelAndView collegeSearch(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			return new ModelAndView("redirect:login");
		}
		
		return new ModelAndView("college_search");
	}

	@RequestMapping(value = "/search_colleges", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<College> search_colleges(
			@RequestBody CollegeSearchCriteria criteria) throws IOException {
		ArrayList<College> collegeList = new ArrayList<College>();
		collegeList.add(new College("OHIO UNIVERSITY", "Athens", "OH"));
		collegeList.add(new College("AKRON SCHOOL", "Akron", "OH"));
		collegeList.add(new College("BOWLING GREEN UNIVERSITY",
				"Bowling Green", "OH"));
		collegeList.add(new College("DAYTON UNIVERSITY", "Dayton", "OH"));
		collegeList.add(new College("OHIO STATE UNIVERSITY", "Columbus", "OH"));
		collegeList.add(new College("MIAMI UNIVERSITY", "Miami", "OH"));

		return collegeList;
	}

	@RequestMapping(value = "/find_my_college", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<College> findMyCollege(
			@RequestBody CollegeSearchCriteria criteria) throws IOException {

		return SolrUtil.getCollegeListBySearchCriteria(criteria);
	}
	
	@RequestMapping(value = "/get-school-stats", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<AjaxResponse> getSchoolStats(HttpServletRequest request, HttpServletResponse response,
			@RequestBody CollegeSearchCriteria criteria) throws IOException {

		HttpSession session = request.getSession(false);
		
		//if user has not loggin in yet or already logged out
		if (session == null || session.getAttribute("user") == null) {
			List<AjaxResponse> result = new ArrayList<AjaxResponse>();
			result.add(new ResponseStatus("UNAUTHENTICATED"));
			return result;
		}
		
		return SolrUtil.getMajorsPerDegreeBySchoolName(criteria);
	}
}
