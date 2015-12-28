package com.aidu.myschool.dao;

import java.util.List;

import com.aidu.myschool.domain.User;

public interface UserDao {
	public void insert(User user);
	public List<User> getUserByEmail(String email);
	public User update(User updatedUser);
}
