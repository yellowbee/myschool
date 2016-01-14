package com.aidu.myschool.web.domain.ajaxresponse;

import java.util.ArrayList;
import java.util.List;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.PairNum;

public class Faculty implements AjaxResponse {
	private List<PairNum> faculty = null;

	public List<PairNum> getFaculty() {
		if (faculty == null) {
			faculty = new ArrayList<PairNum>();
		}
		return faculty;
	}

	public void setFaculty(List<PairNum> faculty) {
		this.faculty = faculty;
	}
	
}
