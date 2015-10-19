package com.aidu.myschool.domain;

import java.util.List;

public class CollegeSearchCriteria {
	private List<String> states;
	private List<String> majors;
	private String srcInstCtrl;
	private String classUndergrad;
	
	public List<String> getStates() {
		return states;
	}

	public void setStates(List<String> states) {
		this.states = states;
	}

	public List<String> getMajors() {
		return majors;
	}

	public void setMajors(List<String> majors) {
		this.majors = majors;
	}

	public String getSrcInstCtrl() {
		return srcInstCtrl;
	}

	public void setSrcInstCtrl(String srcInstCtrl) {
		this.srcInstCtrl = srcInstCtrl;
	}

	public String getClassUndergrad() {
		return classUndergrad;
	}

	public void setClassUndergrad(String classUndergrad) {
		this.classUndergrad = classUndergrad;
	}
}
