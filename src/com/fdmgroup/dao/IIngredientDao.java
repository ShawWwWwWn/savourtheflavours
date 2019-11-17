package com.fdmgroup.dao;

import java.util.List;

import com.fdmgroup.model.Ingredient;

public interface IIngredientDao extends IStorage<Ingredient>, IEditable<Ingredient>, IRemovable<Ingredient>{

	public List<Ingredient> findByName(String name);
	
}
