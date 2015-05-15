package com.aidu.myschool.domain;

public class College {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public College(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "name: " + name + ";";
	}
}
