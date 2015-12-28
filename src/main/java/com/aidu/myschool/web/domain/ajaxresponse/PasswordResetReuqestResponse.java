package com.aidu.myschool.web.domain.ajaxresponse;

public class PasswordResetReuqestResponse {
	private String status;
	private String desc;
	private String uuid;

	public PasswordResetReuqestResponse(String status, String desc, String uuid) {
		this.status = status;
		this.desc = desc;
		this.uuid = uuid;
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
	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
}
