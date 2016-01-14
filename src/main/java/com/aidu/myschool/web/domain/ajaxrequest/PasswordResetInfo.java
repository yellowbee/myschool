package com.aidu.myschool.web.domain.ajaxrequest;

public class PasswordResetInfo {
	private String newPassword;
	private String email;

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
