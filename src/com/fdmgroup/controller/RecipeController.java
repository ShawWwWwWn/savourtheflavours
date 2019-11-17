package com.fdmgroup.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fdmgroup.dao.IngredientDao;
import com.fdmgroup.dao.RecipeDao;
import com.fdmgroup.dao.ReviewDao;
import com.fdmgroup.dao.UserDao;
import com.fdmgroup.model.ImageFile;
import com.fdmgroup.model.Ingredient;
import com.fdmgroup.model.MealType;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.Review;
import com.fdmgroup.model.Unit;
import java.security.Principal;
import com.fdmgroup.model.User;
import com.fdmgroup.model.UserSession;
import com.fdmgroup.util.JpaUtility;

@Controller
public class RecipeController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RecipeDao recipeDao;
	@Autowired
	private IngredientDao ingredientDao;
	@Autowired
	private ReviewDao reviewDao;

	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/showRecipeCreation", method = RequestMethod.GET)
	public String showRecipeCreation(Model model) {
		Recipe createRecipe = new Recipe();
		model.addAttribute("recipe", createRecipe);
		model.addAttribute("mealTypes", MealType.values());
		model.addAttribute("unit", Unit.values());
		return "createRecipe";
	}

	// @PreAuthorize("hasRole('ROLE_USER')")
	// @RequestMapping(value = "/create", method = RequestMethod.POST)
	// public String recipeCreation(@ModelAttribute(value = "recipe") Recipe
	// recipe,
	// @ModelAttribute(value = "ingredients") String ingredients) {
	// /*
	// * IIngredientDao ingredientDao = new IngredientDao(); List<Ingredient>
	// * ingredientsList = new ArrayList<>(); String[] ingredientsArray =
	// * ingredients.split(", "); for (String string : ingredientsArray) {
	// Ingredient
	// * currentIngredient = (Ingredient) ingredientDao.findByName(string);
	// * ingredientsList.add(currentIngredient); }
	// * recipe.setIngredients(ingredientsList);
	// */
	// recipeDao.create(recipe);
	// // Current return page is going back to the user's home page
	// }

	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String recipeCreation(@ModelAttribute(value = "recipe") Recipe recipe,
			@RequestParam("ingredient-name") String[] ingredientNames,
			@RequestParam("ingredient-quantity") String[] ingredientQuantities,
			@RequestParam("ingredient-unit") String[] ingredientUnits,
			@RequestParam("file") CommonsMultipartFile[] files, Model model,
			@RequestParam(name = "isVegetarian") String isVegetarian,
			@RequestParam(name = "isGlutenFree") String isGlutenFree,
			@RequestParam(name = "isPeanutFree") String isPeanutFree, @RequestParam(name = "isVegan") String isVegan,
			@RequestParam(name = "isLactoseFree") String isLactoseFree, Principal principal) {

		model.addAttribute("images", files);

		List<Ingredient> ingredientsList = new ArrayList<>();

		for (int i = 0; i < ingredientNames.length; i++) {
			Ingredient ingredient = new Ingredient(ingredientNames[i], Double.parseDouble(ingredientQuantities[i]),
					Unit.valueOf(ingredientUnits[i]));
			ingredientsList.add(ingredient);
			ingredientsList.get(i).setRecipe(recipe);
			
		}

		recipe.setIngredients(ingredientsList);

		System.out.println("inside save..");
		List<ImageFile> images = new ArrayList<>();
		if (files != null && files.length > 0) {
			for (CommonsMultipartFile aFile : files) {
				System.out.println("Saving file: " + aFile.getOriginalFilename());
				ImageFile uploadFile = new ImageFile();
				uploadFile.setFileName(aFile.getOriginalFilename());
				uploadFile.setData(aFile.getBytes());
				uploadFile.setRecipe(recipe);
				images.add(uploadFile);
			}
		}
		if (isVegetarian.contains("true")) {
			isVegetarian = "true";
		}
		if (isGlutenFree.contains("true")) {
			isGlutenFree = "true";
		}
		if (isPeanutFree.contains("true")) {
			isPeanutFree = "true";
		}
		if (isVegan.contains("true")) {
			isVegan = "true";
		}
		if (isLactoseFree.contains("true")) {
			isLactoseFree = "true";
		}
		System.out.println(isVegetarian);
		recipe.setIsVegetarian(Boolean.parseBoolean(isVegetarian));
		recipe.setIsGlutenFree(Boolean.parseBoolean(isGlutenFree));
		recipe.setIsPeanutFree(Boolean.parseBoolean(isPeanutFree));
		recipe.setIsVegan(Boolean.parseBoolean(isVegan));
		recipe.setIsLactoseFree(Boolean.parseBoolean(isLactoseFree));

		EntityManager em = JpaUtility.getInstance().getEntityManager();
		String username = principal.getName();
		User foundUser = userDao.findUserByUsername(username);
		foundUser = em.find(User.class, foundUser.getId());
		recipe.setUser(foundUser);

		recipe.setImages(images);
		LocalDate date = LocalDate.now();
		recipe.setCreationDate(date);
		recipe.setLastUpdatedDate(date);
		System.out.println(recipe);
		recipeDao.create(recipe);

		System.out.println(foundUser);
		// recipe.setUser(foundUser);

		/*
		 * em.getTransaction().begin(); // recipe = em.merge(recipe); foundUser
		 * = em.merge(foundUser); recipe.setUser(foundUser);
		 * em.getTransaction().commit();
		 */
		em.close();

		// Current return page should go back to the user's home page
		return "redirect:viewRecipe/" + recipe.getRecipeId();
	}

	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/showAllRecipes", method = RequestMethod.GET)
	public String showAllRecipes(Model model) {
		List<Recipe> recipeList = recipeDao.findAll();
		model.addAttribute("recipeList", recipeList);
		return "userview";
	}

	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/delete/{recipeId}")
	public String deleteRecipe(@PathVariable int recipeId) {
		recipeDao.delete(recipeId);
		return "redirect:/userview";
	}

	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/update/${recipeId}")
	public String updateRecipe(@PathVariable int recipeId) {
		// TODO add update functionality
		return "index";
	}

	@RequestMapping(value = "/viewRecipe/{recipeId}")
	public String viewRecipe(Model model, @PathVariable int recipeId, Principal principal) {
		Recipe recipe = recipeDao.updateViewCount(recipeId);
		model.addAttribute("recipe", recipe);
		
		//count of each star rating
		int five = reviewDao.findStarRatingCount(recipe, 5);
		int four = reviewDao.findStarRatingCount(recipe, 4);
		int three = reviewDao.findStarRatingCount(recipe, 3);
		int two = reviewDao.findStarRatingCount(recipe, 2);
		int one = reviewDao.findStarRatingCount(recipe, 1);
		model.addAttribute("one", one);
		model.addAttribute("two", two);
		model.addAttribute("three", three);
		model.addAttribute("four", four);
		model.addAttribute("five", five);
		
		//Find reviews for a recipe
		List<Review> recipeReviews = reviewDao.findReviewByRecipeId(recipeId);
		model.addAttribute("recipeReviews", recipeReviews);
		
		//rating count
		int ratingCount = reviewDao.findRatingCount(recipe);
		model.addAttribute("rating", ratingCount);
		System.out.println(ratingCount);
		//percentage values for changing the stars bars
		if (ratingCount > 0) {
			int fivePercent = (five*100)/ratingCount;
			int fourPercent = (four*100)/ratingCount;
			int threePercent = (three*100)/ratingCount;
			int twoPercent = (two*100)/ratingCount;
			int onePercent = (one*100)/ratingCount;
			model.addAttribute("fivePercent", fivePercent);
			model.addAttribute("fourPercent", fourPercent);
			model.addAttribute("threePercent", threePercent);
			model.addAttribute("twoPercent", twoPercent);
			model.addAttribute("onePercent", onePercent);
		}
		
		
		//average
		double avg = reviewDao.findAverageRating(recipe);
		model.addAttribute("avg", avg);
		
		// Check for existing users and reviews
		Boolean hasReview = false;

		UserSession session = new UserSession();
		
		// me get recipe images :)
		Map<Integer, String> images = new HashMap<Integer, String>();
		if (/*recipe.getImages().size() > 0 && */recipe.getImages().get(0).getData()!=null) {
			for (ImageFile image : recipe.getImages()) {
				String encode = Base64.getEncoder().encodeToString(image.getData());
				images.put(image.getId(), encode);
			}
			System.out.println("got some images***");
		} else {
			System.out.println("did not get images***");
		}
		
		model.addAttribute("recipeImages", images);
		
		if(principal == null){
			
			System.out.println("Not logged in");
			return "viewRecipe";
		}
		
		System.out.println("logged in ");
		
		User loggedInUser = UserSession.getCurrentUser(principal);		
		
		List<Review> reviewList = recipe.getReviews();

		if (!reviewList.isEmpty()) {

			for (Review review : reviewList) {

				int Id = review.getUser().getId();

				if (Id == loggedInUser.getId()) {

					hasReview = true;
					model.addAttribute("user_review", review);
				}
			}
		}

		model.addAttribute("hasReview", hasReview);
		
		//adding the switch to check if the item is already favourited
		String rSwitch = "0";
		if(principal != null) {
			User user = userDao.findUserByUsername(principal.getName());
			
			List<Recipe> recipeList = user.getFavRecipeList();
			
			
			
			for (Recipe favRecipe : recipeList) {
				if(favRecipe.getRecipeId() == recipe.getRecipeId()) {
					rSwitch = "1";
				}
			}
			model.addAttribute("rswitch", rSwitch);
		}
		return "viewRecipe";
	}

	@RequestMapping(value = "viewTestDummy")
	public String viewTestDummy() {
		return "viewTestDummy";
	}

	// Search by recipe name
	@RequestMapping(value = "/searchRecipe", method = RequestMethod.GET)
	public String searchRecipe(Model model, @ModelAttribute(name = "recipe-search") String title) {

		List<Recipe> recipes = recipeDao.findByTitle(title);

		if (recipes.isEmpty()) {
			model.addAttribute("ListEmptyMsg", "Sorry! There are no recipes that match your search!");
			model.addAttribute("ReminderMsg", "Remember to look for typos or search under different criteria.");
			return "search";
		}
		model.addAttribute("images", fetchImages(recipes));
		model.addAttribute("recipes", recipes);
		return "search";
	}

	// search by ingredient name
	@RequestMapping(value = "/searchIngredient", method = RequestMethod.GET)
	public String searchIngredient(Model model, @ModelAttribute(name = "ingredient-search") String name) {

		List<Ingredient> ingredients = ingredientDao.findByName(name);
		List<Recipe> recipes = new ArrayList<Recipe>();
		for (Ingredient ingredient : ingredients) {
			recipes.add(ingredient.getRecipe());
		}

		if (recipes.isEmpty()) {
			model.addAttribute("ListEmptyMsg", "Sorry! There are no recipes that match your search!");
			model.addAttribute("ReminderMsg", "Remember to look for typos or search under different criteria.");
			return "search";
		}
		model.addAttribute("images", fetchImages(recipes));
		model.addAttribute("recipes", recipes);
		return "search";
	}

	// browse by meal type
	@RequestMapping(value = "/browseMealType/{mealType}", method = RequestMethod.GET)
	public String browseMealType(Model model, @PathVariable MealType mealType) {

		List<Recipe> recipes = recipeDao.findByMealType(mealType);

		if (recipes.isEmpty()) {
			model.addAttribute("ListEmptyMsg", "Sorry! There are no recipes that match your search!");
			model.addAttribute("ReminderMsg", "Remember to look for typos or search under different criteria.");
			return "search";
		}
		model.addAttribute("images", fetchImages(recipes));
		model.addAttribute("recipes", recipes);

		return "search";
	}

	// browse by Ingredient
	@RequestMapping(value = "/browseIngredient/{name}", method = RequestMethod.GET)
	public String browseIngredient(Model model, @PathVariable String name) {

		List<Ingredient> ingredients = ingredientDao.findByName(name);
		List<Recipe> recipes = new ArrayList<Recipe>();
		for (Ingredient ingredient : ingredients) {
			recipes.add(ingredient.getRecipe());
		}

		if (recipes.isEmpty()) {
			model.addAttribute("ListEmptyMsg", "Sorry! There are no recipes that match your search!");
			model.addAttribute("ReminderMsg", "Remember to look for typos or search under different criteria.");
			return "search";
		}
		model.addAttribute("images", fetchImages(recipes));
		model.addAttribute("recipes", recipes);
		return "search";
	}

	// browse by place of origin
	@RequestMapping(value = "/browsePlaceOfOrigin/{placeOfOrigin}", method = RequestMethod.GET)
	public String browsePlaceOfOrigin(Model model, @PathVariable String placeOfOrigin) {

		List<Recipe> recipes = recipeDao.findByPlacOfOrigin(placeOfOrigin);

		if (recipes.isEmpty()) {
			model.addAttribute("ListEmptyMsg", "Sorry! There are no recipes that match your search!");
			model.addAttribute("ReminderMsg", "Remember to look for typos or search under different criteria.");
			return "search";
		}
		model.addAttribute("images", fetchImages(recipes));
		model.addAttribute("recipes", recipes);
		return "search";

	}

	@RequestMapping(value = "viewUserRecipe", method = RequestMethod.GET)
	public String viewUserRecipe(Model model, Principal principal) {

		List<Recipe> recipeList = recipeDao.viewUserRecipe(principal);
		Map<Integer, String> images = new HashMap<Integer, String>();
		String encode = null;
		for (Recipe recipe : recipeList) {

			if (recipe.getImages().get(0).getData() != null) {
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
		return "viewUserRecipe";
	}

	@RequestMapping(value = "viewFavouriteRecipe", method = RequestMethod.GET)
	public String viewFavouriteRecipe(Model model, Principal principal) {

		List<Recipe> recipeList = recipeDao.viewFavouriteRecipe(principal);
		Map<Integer, String> images = new HashMap<Integer, String>();
		String encode = null;
		for (Recipe recipe : recipeList) {
			if (recipe.getImages().get(0).getData() != null) {
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
		return "viewFavouriteRecipes";
	}

	@RequestMapping(value = "/download/{recipeId}/{title}", method = RequestMethod.GET)
	public ModelAndView downloadExcel(Model model, @PathVariable int recipeId, @PathVariable String title) {
		return new ModelAndView("pdfView", "recipeId", recipeId);
	}

	public Map<Integer, String> fetchImages(List<Recipe> recipes) {

		Map<Integer, String> images = new HashMap<Integer, String>();

		for (Recipe recipe : recipes) {
			if (recipe.getImages().get(0).getData() != null) {

				String encode = Base64.getEncoder().encodeToString(recipe.getImages().get(0).getData());
				images.put(recipe.getRecipeId(), encode);
			} else {

				images.put(recipe.getRecipeId(), null);
			}
		}
		return images;
	}

}
