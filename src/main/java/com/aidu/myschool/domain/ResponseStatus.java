package com.aidu.myschool.domain;

public class ResponseStatus implements AjaxResponse {
	private String status;

	public ResponseStatus(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
