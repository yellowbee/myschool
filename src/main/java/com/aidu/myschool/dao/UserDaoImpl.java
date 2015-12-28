package com.aidu.myschool.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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

	@SuppressWarnings("unchecked")
	public List<User> getUserByEmail(String email) {
		Query query = entityManager.createNamedQuery("user.find.password.by.email", User.class);
		query.setParameter("email", email);
		return  (List<User>)query.getResultList();
	}
	
	public User update(User updatedUser) {
		return entityManager.merge(updatedUser);
	}
}
