package com.aidu.myschool.domain;

public class SignUpResponse {
	private String status;
	private String desc;
	
	public SignUpResponse(String status, String desc) {
		this.status = status;
		this.desc = desc;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
