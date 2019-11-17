package com.fdmgroup.controller;


import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.security.Principal;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fdmgroup.dao.RecipeDao;
import com.fdmgroup.dao.ReviewDao;
import com.fdmgroup.dao.UserDao;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.Review;
import com.fdmgroup.model.User;
import com.fdmgroup.model.UserSession;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private RecipeDao recipeDao;
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value="/postReview/{recipeId}", method = RequestMethod.POST)
	public String parseReview(Model model, @RequestParam("starRating") String starStringRating, @RequestParam("comment") String comment, @PathVariable("recipeId") int recipeId, Principal principal, RedirectAttributes redir){
		
		int starRating = 0;
		if (starStringRating.isEmpty()) {
			
		} else {
			starRating = Integer.parseInt(starStringRating);
		}
		
		Recipe foundRecipe = recipeDao.findById(recipeId);
		System.out.println("The value of comment is " +comment);
		/*if(comment.isEmpty()) {
			redir.addFlashAttribute("commentErrorMessage", "Please enter a comment");
		}*/
		System.out.println("The star value is " + starRating);
		if(starRating==0) {
			redir.addFlashAttribute("starErrorMessage", "*Please select a star rating");
			return "redirect:../viewRecipe/"+foundRecipe.getRecipeId();
		}

		Boolean hasReview = false;
		Review foundReview = null;
		List<Review> existingReviews = reviewDao.findReviewByRecipeId(recipeId);
		User loggedInUser = UserSession.getCurrentUser(principal);
		System.out.println("Recipe Id is: " + recipeId);
		System.out.println(existingReviews);
		
		if (!existingReviews.isEmpty()) {
			for (Review review : existingReviews) {
				int Id = review.getUser().getId();
				if (Id == loggedInUser.getId()) {
					hasReview = true;
					foundReview = review;
				}
			}
		}
		
		if(hasReview){
			foundReview.setComments(comment);
			foundReview.setStarRating(starRating);
			reviewDao.update(foundReview);
			model.addAttribute("review", foundReview);	
			return "redirect:../viewRecipe/"+foundRecipe.getRecipeId();
			
		} else {
			
		Review tempReview = new Review(comment, starRating);
		String username = principal.getName();
		UserDao userDao = new UserDao();
		RecipeDao recipeDao = new RecipeDao();
		User foundUser = userDao.findUserByUsername(username);
		System.out.println(foundUser); 
		tempReview.setUser(foundUser);
		tempReview.setRecipe(foundRecipe);
		System.out.println(foundRecipe);
		reviewDao.create(tempReview);
		model.addAttribute("review", tempReview);
		return "redirect:../viewRecipe/"+foundRecipe.getRecipeId();

		}
	}
	
	@RequestMapping(value = "viewUserReviews" ,method = RequestMethod.GET)
	public String viewUserReviews(Model model, Principal principal) {
		String encode=null;
		List<Recipe> recipeList=recipeDao.viewUserReview(principal);
		Map<Integer, String> images = new HashMap<Integer, String>();
		
		for (Recipe recipe : recipeList) {
			if (recipe.getImages().get(0).getData()!=null) {
				 encode = Base64.getEncoder().encodeToString(recipe.getImages().get(0).getData());
	        	images.put(recipe.getRecipeId(), encode);
	        	System.out.println("added an image *");
	        	System.out.println(images.get(recipe.getRecipeId()));
			} else {
				images.put(recipe.getRecipeId(), null);
				System.out.println("added null image ***");
	        	System.out.println(images.get(recipe.getRecipeId()));
			}
		}
		
		
		
		
	model.addAttribute("images", images);
	model.addAttribute("userRecipeList", recipeList);
	
	return "viewUserReviews";
	}

	
	@RequestMapping(value="/deleteReview/{recipeId}/{reviewId}", method = RequestMethod.GET)
	public String deleteReview(Model model, @PathVariable("recipeId") int recipeId, @PathVariable("reviewId") int reviewId, Principal principal){
			System.out.println("****"+ reviewId);
		Review review = reviewDao.findById(reviewId);
		System.out.println(review);
		reviewDao.delete(reviewId);
		
		model.addAttribute("review", null);
		return "redirect:../../viewRecipe/"+recipeId;
		
	
	}
		
	
}