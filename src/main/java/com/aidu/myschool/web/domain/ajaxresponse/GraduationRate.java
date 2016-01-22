package com.aidu.myschool.web.domain.ajaxresponse;

import java.util.ArrayList;
import java.util.List;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.Pair;

public class GraduationRate implements AjaxResponse {
	private List<Pair> gradRate = null;

	public List<Pair> getGradRate() {
		if (gradRate == null) {
			gradRate = new ArrayList<Pair>();
		}
		return gradRate;
	}

	public void setGradRate(List<Pair> gradRate) {
		this.gradRate = gradRate;
	}

	
}
