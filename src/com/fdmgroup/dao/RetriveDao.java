package com.fdmgroup.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.fdmgroup.model.Recipe;
import com.fdmgroup.util.JpaUtility;

public class RetriveDao implements IRetrive {

	@SuppressWarnings("unchecked")
	@Override
	public List<Recipe> getMostViewed(int maxResults) {
		System.out.println("In mostViewdDAO");
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> recipeList = em.createNamedQuery("Recipe.findMostViewedRecipes").setMaxResults(maxResults).getResultList();
		em.close();
		return recipeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Recipe> getTopRated(int maxResults) {
		System.out.println("In topRatedDAO");
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> recipeList = em.createNamedQuery("Recipe.findTopRatedRecipes").setMaxResults(maxResults).getResultList();
		em.close();
		System.out.println(recipeList);
		return recipeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Recipe> getTrending(int maxResults) {
		System.out.println("In trendingDAO");
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> recipeList = em.createNamedQuery("Recipe.findTrendingRecipes").setMaxResults(maxResults).getResultList();
		em.close();
		return recipeList;
	}

	
}
