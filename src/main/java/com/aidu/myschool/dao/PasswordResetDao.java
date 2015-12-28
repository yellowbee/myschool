package com.aidu.myschool.dao;

import java.util.List;

import com.aidu.myschool.domain.PasswordReset;

public interface PasswordResetDao {
	public void insert(PasswordReset passwordReset);
	public List<PasswordReset> getResetRequestByUuid(String uuid);
}
