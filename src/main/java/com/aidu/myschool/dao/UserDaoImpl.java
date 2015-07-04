package com.aidu.myschool.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aidu.myschool.domain.User;

@Repository("userDao")
@Transactional(propagation=Propagation.REQUIRED)
public class UserDaoImpl implements UserDao {
	@PersistenceContext
	private EntityManager entityManager;

	public void insert(User user) {
		entityManager.persist(user);
	}
	
	
}
