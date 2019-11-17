package com.fdmgroup.dao;

import java.util.List;

import com.fdmgroup.model.MealType;
import com.fdmgroup.model.Recipe;

public interface IRecipeDao extends IStorage<Recipe>, IEditable<Recipe>, IRemovable<Recipe>{
	
	public List<Recipe> findByPlacOfOrigin(String placeOfOrigin);
	
	public List<Recipe> findByMealType(MealType mealType);
	
	public Recipe findRecipeById (int recipeId);
	
	
	
}
