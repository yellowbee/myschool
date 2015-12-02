package com.aidu.myschool.domain;

import java.util.ArrayList;
import java.util.List;

public class Enrollment implements AjaxResponse {
	private List<Pair> enrollment = null;

	public List<Pair> getEnrollment() {
		if (enrollment == null) {
			enrollment = new ArrayList<Pair>();
		}
		return enrollment;
	}

	public void setEnrollment(List<Pair> enrollment) {
		this.enrollment = enrollment;
	}
	
}
