package com.aidu.myschool.domain;

import java.util.List;

public class CollegeSearchCriteria {
	private List<String> states;
	private String srcInstCtrl;
	private String classUndergrad;
	
	public List<String> getStates() {
		return states;
	}

	public void setStates(List<String> states) {
		this.states = states;
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
