package com.fdmgroup.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtility {
	private static JpaUtility jpaUtility;
	private EntityManagerFactory emf;

	private JpaUtility() {
		init();
	}

	private void init() {
		emf = Persistence.createEntityManagerFactory("SavourTheFlavours");
	}

	public static JpaUtility getInstance() {
		if (jpaUtility == null) {
			jpaUtility = new JpaUtility();
		}
		return jpaUtility;
	}

	public EntityManager getEntityManager() {
		return emf.createEntityManager();
	}

	public void close() {
		emf.close();
	}

}
