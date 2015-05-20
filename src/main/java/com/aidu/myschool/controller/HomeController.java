package com.aidu.myschool.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aidu.myschool.domain.College;
import com.aidu.myschool.domain.CollegeSearchCriteria;

@Controller
public class HomeController {

	@RequestMapping(value="/authentication", method = RequestMethod.POST)
	public ModelAndView authenticate(HttpServletResponse response) throws IOException{
		return new ModelAndView("dashboard");
	}
	
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("dashboard");
	}
	
	@RequestMapping(value="/college_search", method = RequestMethod.GET)
	public ModelAndView test_one(HttpServletResponse response) throws IOException{
		return new ModelAndView("college_search");
	}
	
	@RequestMapping(value="/search_colleges", method = RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<College> search_colleges(@RequestBody CollegeSearchCriteria criteria) throws IOException{
		ArrayList<College> collegeList = new ArrayList<College>();
		collegeList.add(new College(criteria.getName(), "Athens", "OH"));
		collegeList.add(new College("AKRON SCHOOL", "Akron", "OH"));
		collegeList.add(new College("BOWLING GREEN UNIVERSITY", "Bowling Green", "OH"));
		
		return collegeList;
	}
	
	@RequestMapping(value="/my_app", method = RequestMethod.GET)
	public ModelAndView my_app(HttpServletResponse response) throws IOException{
		return new ModelAndView("my_app");
	}
}
