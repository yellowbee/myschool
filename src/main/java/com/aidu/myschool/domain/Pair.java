package com.aidu.myschool.domain;

public class Pair {
	private String label;
	private String count;
	
	public Pair(String label, String count) {
		this.label = label;
		this.count = count;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
}
