package com.fdmgroup.dao;

import java.util.List;

import com.fdmgroup.model.Recipe;

public interface IRetrive {
	
	public List<Recipe> getMostViewed(int numberOfRecipes);
	public List<Recipe> getTopRated(int numberOfRecipes);
	public List<Recipe> getTrending(int numberOfRecipes);
	
}
