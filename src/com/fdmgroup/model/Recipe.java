package com.fdmgroup.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "RECIPE")
@NamedQueries ({
	@NamedQuery(name = "Recipe.findAllRecipes", query = "select r from Recipe r"),
	@NamedQuery(name = "Recipe.findTopRatedRecipes", query = "select r from Recipe r order by r.currentRating"),
	@NamedQuery(name = "Recipe.findMostViewedRecipes", query = "select r from Recipe r order by r.viewCount"),
	@NamedQuery(name = "Recipe.findTrendingRecipes", query = "select r from Recipe r order by r.creationDate"),
	
})
public class Recipe implements IStorable {
	@Id
	@GeneratedValue (strategy = GenerationType.SEQUENCE , generator = "RECIPE_SEQUENCE")
	@SequenceGenerator (name = "RECIPE_SEQUENCE", sequenceName = "RECIPE_SEQ", allocationSize = 1)
	@Column (nullable = false, updatable = false, length = 5, unique = true)
	private int recipeId;
	
	@ManyToMany(mappedBy = "favRecipeList")
	private List<User> userList= new ArrayList<>();
	
	public void setUserToFavourites(User user) {
		userList.add(user);
	}
	public void removeUserFromFavourites(int index) {
		userList.remove(index);
	}
	
	@ManyToOne (cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name = "FK_USER")
	private User user;
	
	@OneToMany (mappedBy = "recipe", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Ingredient> ingredients = new ArrayList<>();
	
	@OneToMany (mappedBy = "recipe",  cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Review> reviews = new ArrayList<>();
	
	public void addToReviews(Review review) {
		reviews.add(review);
	}
	public void removeFromReviews(int index) {
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH");
		reviews.remove(index);
	}
	
	private double currentRating;
	
	private String title;
	private String description;
	@ElementCollection
	@CollectionTable(name = "RECIPE_STEPS", joinColumns = @JoinColumn(name = "RECIPE_ID"))
	private List<String> steps = new ArrayList<>();
	@OneToMany (mappedBy = "recipe", cascade = CascadeType.ALL)
	private List<ImageFile> images = new ArrayList<>();
	private int prepTimeInMins;
	private int servingSize;
	private String placeOfOrigin;
	private String specialInstructions;
	private int viewCount;
	private LocalDate creationDate;
	private LocalDate lastUpdatedDate; 
	private String videoLink;
	@Enumerated (EnumType.STRING)
	private MealType mealType;
	private boolean isVegetarian = false;
	private boolean isGlutenFree = false;
	private boolean isPeanutFree = false;
	private boolean isVegan = false;
	private boolean isLactoseFree = false;
	
	public Recipe() {
		super();
	}
	
	public Recipe(User user, List<Ingredient> ingredients, List<Review> reviews, double currentRating, String title, String description,
			List<String> steps, List<ImageFile> images, int prepTimeInMins, int servingSize, String placeOfOrigin,
			String specialInstructions, LocalDate creationDate, String videoLink, MealType mealType, boolean isVegetarian, 
			boolean isGlutenFree, boolean isPeanutFree, boolean isVegan, boolean isLactoseFree) {
		super();
		this.user = user;
		this.ingredients = ingredients;
		this.reviews = reviews;
		this.currentRating = currentRating;
		this.title = title;
		this.description = description;
		this.steps = steps;
		this.images = images;
		this.prepTimeInMins = prepTimeInMins;
		this.servingSize = servingSize;
		this.placeOfOrigin = placeOfOrigin;
		this.specialInstructions = specialInstructions;
		this.creationDate = LocalDate.now();
		this.videoLink = videoLink;
		this.mealType = mealType;
		this.isVegetarian = isVegetarian;
		this.isGlutenFree = isGlutenFree;
		this.isPeanutFree = isPeanutFree;
		this.isVegan = isVegan;
		this.isLactoseFree = isLactoseFree;
	}

	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int id) {
		this.recipeId = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Ingredient> getIngredients() {
		return ingredients;
	}
	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public double getCurrentRating() {
		return currentRating;
	}
	public void setCurrentRating(double currentRating) {
		this.currentRating = currentRating;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<String> getSteps() {
		return steps;
	}
	public void setSteps(List<String> steps) {
		this.steps = steps;
	}
	public List<ImageFile> getImages() {
		return images;
	}

	public void setImages(List<ImageFile> images) {
		this.images = images;
	}

	public int getPrepTimeInMins() {
		return prepTimeInMins;
	}
	public void setPrepTimeInMins(int prepTimeInMins) {
		this.prepTimeInMins = prepTimeInMins;
	}
	public int getServingSize() {
		return servingSize;
	}
	public void setServingSize(int servingSize) {
		this.servingSize = servingSize;
	}
	public String getPlaceOfOrigin() {
		return placeOfOrigin;
	}
	public void setPlaceOfOrigin(String placeOfOrigin) {
		this.placeOfOrigin = placeOfOrigin;
	}
	public String getSpecialInstructions() {
		return specialInstructions;
	}
	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public LocalDate getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(LocalDate creationDate) {
		this.creationDate = creationDate;
	}
	public LocalDate getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(LocalDate lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public MealType getMealType() {
		return mealType;
	}
	public void setMealType(MealType mealType) {
		this.mealType = mealType;
	}
	public boolean getIsVegetarian() {
		return isVegetarian;
	}
	public void setIsVegetarian(boolean isVegetarian) {
		this.isVegetarian = isVegetarian;
	}

	public boolean getIsGlutenFree() {
		return isGlutenFree;
	}

	public void setIsGlutenFree(boolean isGlutenFree) {
		this.isGlutenFree = isGlutenFree;
	}

	public boolean getIsPeanutFree() {
		return isPeanutFree;
	}

	public void setIsPeanutFree(boolean isPeanutFree) {
		this.isPeanutFree = isPeanutFree;
	}

	public boolean getIsVegan() {
		return isVegan;
	}

	public void setIsVegan(boolean isVegan) {
		this.isVegan = isVegan;
	}

	public boolean getIsLactoseFree() {
		return isLactoseFree;
	}

	public void setIsLactoseFree(boolean isLactoseFree) {
		this.isLactoseFree = isLactoseFree;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	@Override
	public String toString() {
		return "Recipe [id=" + recipeId + ", ingredients=" + ingredients + ", title=" + title + ", description=" + description
				+ ", steps=" + steps + ", images=" + /*images +*/ ", prepTimeInMins=" + prepTimeInMins + ", servingSize="
				+ servingSize + ", placeOfOrigin=" + placeOfOrigin + ", specialInstructions=" + specialInstructions
				+ ", viewCount=" + viewCount + ", creationDate=" + creationDate + ", lastUpdatedDate=" + lastUpdatedDate
				+ ", videoLink=" + videoLink + ", isVegetarian=" + isVegetarian + ", isGlutenFree=" + isGlutenFree
				+ ", isPeanutFree=" + isPeanutFree + ", isVegan=" + isVegan + ", isLactoseFree=" + isLactoseFree + "]";
	}
	
}
