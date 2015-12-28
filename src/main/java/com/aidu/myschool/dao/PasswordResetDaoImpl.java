package com.aidu.myschool.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aidu.myschool.domain.PasswordReset;
import com.aidu.myschool.domain.User;

@Repository("passwordResetDao")
@Transactional(propagation=Propagation.REQUIRED)
public class PasswordResetDaoImpl implements PasswordResetDao {
	@PersistenceContext
	private EntityManager entityManager;
	
	public void insert(PasswordReset passwordReset) {
		entityManager.persist(passwordReset);
	}
	
	@SuppressWarnings("unchecked")
	public List<PasswordReset> getResetRequestByUuid(String uuid) {
		Query query = entityManager.createNamedQuery("passwd_reset.find.resetreq.by.uuid", PasswordReset.class);
		query.setParameter("uuid", uuid);
		return  (List<PasswordReset>)query.getResultList();
	}
}
