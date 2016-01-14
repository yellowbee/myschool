package com.aidu.myschool.web.domain.ajaxresponse;

import java.util.ArrayList;
import java.util.List;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.Pair;

public class Tuition implements AjaxResponse {
	private List<Pair> tuition = null;

	public List<Pair> getTuition() {
		if (tuition == null) {
			tuition = new ArrayList<Pair>();
		}
		return tuition;
	}

	public void setTuition(List<Pair> tuition) {
		this.tuition = tuition;
	}
	
	
}
