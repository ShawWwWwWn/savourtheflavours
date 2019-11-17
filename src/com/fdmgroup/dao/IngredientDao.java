package com.fdmgroup.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.fdmgroup.model.Ingredient;
import com.fdmgroup.util.JpaUtility;

public class IngredientDao implements IIngredientDao {

	@Override
	public Ingredient create(Ingredient t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		em.persist(t);
		em.getTransaction().commit();
		em.close();
		return t;
	}

	@Override
	public Ingredient findById(int id) {
		return null;
	}

	@Override
	public List<Ingredient> findAll() {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Ingredient> ingredientList = em.createNamedQuery("Ingredient.findAllIngredients").getResultList();
		em.close();
		return ingredientList;
	}

	@Override
	public Ingredient update(Ingredient t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Ingredient t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		em.remove(t);
		em.getTransaction().commit();
		em.close();
		return true;
	}

	@Override
	public List<Ingredient> findByName(String name) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Ingredient> ingredientList = em.createQuery("select i from Ingredient i where lower(i.name) like lower(:iName)")
				.setParameter("iName", name).getResultList();
		em.close();
		return ingredientList;
	}

}
