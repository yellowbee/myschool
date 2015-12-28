package com.aidu.myschool.web.domain.ajaxresponse;

import java.util.ArrayList;
import java.util.List;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.PairNum;

public class Enrollment implements AjaxResponse {
	private List<PairNum> enrollment = null;

	public List<PairNum> getEnrollment() {
		if (enrollment == null) {
			enrollment = new ArrayList<PairNum>();
		}
		return enrollment;
	}

	public void setEnrollment(List<PairNum> enrollment) {
		this.enrollment = enrollment;
	}
	
}
