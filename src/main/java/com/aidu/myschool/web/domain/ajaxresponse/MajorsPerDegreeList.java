package com.aidu.myschool.web.domain.ajaxresponse;

import java.util.ArrayList;
import java.util.List;

import com.aidu.myschool.domain.AjaxResponse;
import com.aidu.myschool.domain.Pair;

public class MajorsPerDegreeList implements AjaxResponse {
	private List<Pair> majorsPerDegreeList = null;

	public List<Pair> getMajorsPerDegreeList() {
		if (majorsPerDegreeList == null) {
			majorsPerDegreeList = new ArrayList<Pair>();
		}
		return majorsPerDegreeList;
	}

	public void setMajorsPerDegreeList(List<Pair> majorsPerDegreeList) {
		this.majorsPerDegreeList = majorsPerDegreeList;
	}
	
}
