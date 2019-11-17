package com.fdmgroup.dao;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.Review;
import com.fdmgroup.model.User;
import com.fdmgroup.util.JpaUtility;

public class ReviewDao implements IReviewDao {

	@Override
	public Review create(Review t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		Recipe reviewRecipe = t.getRecipe();
		reviewRecipe = em.merge(reviewRecipe);
		User reviewUser = t.getUser();
		reviewUser = em.merge(reviewUser);
		t.setRecipe(reviewRecipe);
		t.setUser(reviewUser);
		
		em.merge(reviewRecipe);
		
		em.persist(t);
		
		reviewRecipe.addToReviews(t);
		em.getTransaction().commit();
		em.close();
		return t;
	}

	@Override
	public Review findById(int id) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Review foundReview= em.find(Review.class, id);
		em.close();
		return foundReview;
	}

	public int findStarRatingCount(Recipe recipe, int starRating) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Recipe managedRecipe = em.find(Recipe.class, recipe.getRecipeId());
		List<Review> reviewList = managedRecipe.getReviews();
		int counter = 0;
		for (Review review : reviewList) {
			int reviewStarRating = review.getStarRating();
			if (reviewStarRating == starRating) {
				counter++;
			}
		}
		em.close();
		return counter;
	}
	
	public int findRatingCount(Recipe recipe) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Recipe managedRecipe = em.find(Recipe.class, recipe.getRecipeId());
		List<Review> reviewList = managedRecipe.getReviews();
		int counter = 0;
		for (Review review : reviewList) {
			counter++;
		}
		em.close();
		return counter;
	}
	
	public double findAverageRating(Recipe recipe) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Recipe managedRecipe = em.find(Recipe.class, recipe.getRecipeId());
		List<Review> reviewList = managedRecipe.getReviews();
		int total = 0;
		int counter = 0;
		for (Review review : reviewList) {
			int reviewStarRating = review.getStarRating();
			total += reviewStarRating;
			counter++;
		}
		em.close();
		
		double avg = 0;
		
		if(total == 0) {
			return avg;
		}
		
		double dtotal = (double)total;
		double dcounter = (double)counter;
		
		avg = dtotal / dcounter;
		DecimalFormat df = new DecimalFormat("#.#");
		avg = Double.valueOf(df.format(avg));
		return avg;
	}
	
	@Override
	public List<Review> findAll() {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		List<Review> reviewList = (List<Review>) em.createQuery("SELECT r FROM Review r").getResultList();
		em.close();
		return reviewList;
	}

	@Override
	public Review update(Review t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Review foundReview = em.find(Review.class, t.getReviewId());
		em.getTransaction().begin();
		foundReview.setComments(t.getComments());
		foundReview.setLastUpdatable(LocalDate.now());
		foundReview.setStarRating(t.getStarRating());
		em.getTransaction().commit();
		em.close();
		return t;
	}

	@Override
	public boolean remove(Review t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		em.remove(t);
		em.getTransaction().commit();
		em.close();
		return true;

	}
	
	@Override
	public void delete(int reviewId) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Review foundReview = em.find(Review.class, reviewId);
		em.getTransaction().begin();
		em.remove(foundReview);
		em.getTransaction().commit();
		em.close();
	}

	@Override
	public List<Review> findReviewByRecipeId(int recipeId) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();

		em.getTransaction().begin();
		List<Review> foundReviews = (List<Review>) em.createQuery("SELECT r FROM Review r WHERE r.recipe.recipeId = :rId").setParameter("rId", recipeId).getResultList();
		em.getTransaction().commit();

		em.close();
		return foundReviews;
	}

	public void delete(int reviewId, int recipeId, int recipeIndex) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		Review foundReview = em.find(Review.class, reviewId);
		
		Recipe foundRecipe = em.find(Recipe.class, recipeIndex);
		
		System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"+recipeIndex);
		
		foundRecipe.removeFromReviews(recipeIndex);
		
		em.merge(foundRecipe);
		
		foundReview.setUser(null);
		
		em.remove(foundReview);
		
		em.getTransaction().commit();
		em.close();
	}

}