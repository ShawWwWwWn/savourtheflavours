package com.fdmgroup.dao;

import java.security.Principal;
import java.util.ArrayList;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.EntityManager;

import javax.persistence.Query;


import com.fdmgroup.model.MealType;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.Review;
import com.fdmgroup.model.UserSession;
import com.fdmgroup.model.User;
import com.fdmgroup.util.JpaUtility;

public class RecipeDao implements IRecipeDao {

	@Override
	public Recipe create(Recipe t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		User foundUser = t.getUser();
		foundUser = em.merge(foundUser);
		t.setUser(foundUser);
		em.persist(t);
		em.getTransaction().commit();
		em.close();
		return t;
	}

	@Override
	public Recipe findById(int id) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Recipe foundRecipe = em.find(Recipe.class, id);
		em.close();
		return foundRecipe;
	}

	@Override
	public List<Recipe> findAll() {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> recipeList = em.createNamedQuery("Recipe.findAllRecipes").getResultList();
		em.close();
		return recipeList;
	}

	@Override
	public Recipe update(Recipe t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Recipe foundRecipe = em.find(Recipe.class, t.getRecipeId());
		em.getTransaction().begin();
		foundRecipe.setDescription(t.getDescription());
		foundRecipe.setImages(t.getImages());
		foundRecipe.setIngredients(t.getIngredients());
		foundRecipe.setIsGlutenFree(t.getIsGlutenFree());
		foundRecipe.setIsLactoseFree(t.getIsLactoseFree());
		foundRecipe.setIsPeanutFree(t.getIsPeanutFree());
		foundRecipe.setIsVegan(t.getIsVegan());
		foundRecipe.setIsVegetarian(t.getIsVegetarian());
		foundRecipe.setLastUpdatedDate(LocalDate.now());
		foundRecipe.setMealType(t.getMealType());
		foundRecipe.setPlaceOfOrigin(t.getPlaceOfOrigin());
		foundRecipe.setPrepTimeInMins(t.getPrepTimeInMins());
		foundRecipe.setReviews(t.getReviews());
		foundRecipe.setServingSize(t.getServingSize());
		foundRecipe.setSteps(t.getSteps());
		foundRecipe.setTitle(t.getTitle());
		foundRecipe.setVideoLink(t.getVideoLink());
		em.getTransaction().commit();
		em.close();
		return t;
	}

	@Override
	public boolean remove(Recipe t) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		em.remove(t);
		em.getTransaction().commit();
		em.close();
		return true;
	}

	public void delete(int recipeId) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		Recipe foundRecipe = em.find(Recipe.class, recipeId);
		em.getTransaction().begin();
		em.remove(foundRecipe);
		em.getTransaction().commit();
		em.close();
	}

	@Override
	public List<Recipe> findByPlacOfOrigin(String placeOfOrigin) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		
		List<Recipe> foundRecipes = em.createQuery("select r from Recipe r where r.placeOfOrigin = :rPlace")
				.setParameter("rPlace", placeOfOrigin).getResultList();
		em.getTransaction().commit();
		em.close();
		return foundRecipes;
	}

	@Override
	public List<Recipe> findByMealType(MealType mealType) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> foundRecipes = em.createQuery("select r from Recipe r where r.mealType = :rMealType")
				.setParameter("rMealType", mealType).getResultList();
		em.getTransaction().commit();
		em.close();
		return foundRecipes;
	}

	public List<Recipe> findByTitle(String title) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> foundRecipes = em.createQuery("select r from Recipe r where lower(r.title) like lower(:rTitle)")
				.setParameter("rTitle", title).getResultList();
		em.getTransaction().commit();
		em.close();
		return foundRecipes;
	}

	@Override
	public Recipe findRecipeById(int recipeId) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();;
		Recipe foundRecipe = em.find(Recipe.class, recipeId);
		em.close();
		return foundRecipe;
	}
	

	
	public List<Recipe> viewUserRecipe(Principal principal){
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> recipeList= new ArrayList<>();
		
		UserSession userSession = new UserSession();
		User user=userSession.getCurrentUser(principal);
		
		
		User findUser=em.find(User.class, user.getId());
		
		recipeList= findUser.getRecipe();
		em.getTransaction().commit();
		em.close();
		return recipeList;
	}
	
	
	public List<Recipe> viewFavouriteRecipe(Principal principal){
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<Recipe> recipeList= new ArrayList<>();
		
		UserSession userSession = new UserSession();
		User user=userSession.getCurrentUser(principal);
		
		User findUser=em.find(User.class, user.getId());
		
		recipeList=findUser.getFavRecipeList();
		
		em.getTransaction().commit();
		em.close();
		return recipeList;
	}
	
	
	public List<Recipe> viewUserReview(Principal principal){
		List<Recipe> recipeList= new ArrayList<>();
		
		UserSession userSession = new UserSession();
		User user=userSession.getCurrentUser(principal);
		
		ReviewDao reviewDao = new ReviewDao();
		List<Review> reviewList = reviewDao.findAll();
		
		String username = principal.getName();
		UserDao userDao = new UserDao();
		User foundUser = userDao.findUserByUsername(username);
		
		List<Recipe> myReviewList = new ArrayList<>();
		
		for (int i=0;i<reviewList.size();i++) {
			if (reviewList.get(i).getUser().getId() == foundUser.getId()) {            // all the reviews given by current user
				myReviewList.add(reviewList.get(i).getRecipe());
			}
		}
	
		return myReviewList;
	}
	
	public Recipe updateViewCount(int id) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		Recipe foundRecipe = em.find(Recipe.class, id);
		em.getTransaction().begin();
		// Test
//		foundRecipe.setViewCount(1);
		foundRecipe.setViewCount(foundRecipe.getViewCount()+1);
		em.getTransaction().commit();
		em.close();
		return foundRecipe;
	}
	
	public void addFavouriteUser(Recipe recipe) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		Recipe foundRecipe = em.find(Recipe.class, recipe.getRecipeId());
		foundRecipe.setUserList(recipe.getUserList());
		em.merge(foundRecipe);
		em.getTransaction().commit();
		em.close();
	}
}