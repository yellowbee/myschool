package com.aidu.myschool.web.domain.ajaxresponse;

import com.aidu.myschool.domain.AjaxResponse;

public class Contact implements AjaxResponse {
	private String address;
	private String url;
	private String email;
	
	public Contact(String address, String url, String email) {
		this.address = address;
		this.url = url;
		this.email = email;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
