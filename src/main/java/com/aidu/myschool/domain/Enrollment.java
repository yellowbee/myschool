package com.aidu.myschool.domain;

import java.util.ArrayList;
import java.util.List;

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
