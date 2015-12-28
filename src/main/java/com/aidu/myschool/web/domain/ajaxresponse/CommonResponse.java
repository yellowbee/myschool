package com.aidu.myschool.web.domain.ajaxresponse;

public class CommonResponse {
	private String status;
	private String desc;
	
	public CommonResponse(String status, String desc) {
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
