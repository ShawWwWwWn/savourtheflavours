package com.fdmgroup.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "INGREDIENT")
@NamedQuery(name = "Ingredient.findAllIngredients", query = "select i from Ingredient i")
public class Ingredient implements IStorable {
	
	@Id
	@GeneratedValue (strategy = GenerationType.SEQUENCE , generator = "INGREDIENT_SEQUENCE")
	@SequenceGenerator (name = "INGREDIENT_SEQUENCE", sequenceName = "INGREDIENT_SEQ", allocationSize = 1)
	private int ingredientId;
	private String name;
	private double quantity;
	@Enumerated (EnumType.STRING)
	private Unit unit;
	
	@ManyToOne
	@JoinColumn(name = "FK_RECIPE")
	private Recipe recipe;
	
	public Ingredient(String name, double d, Unit unit) {
		super();
		this.name = name;
		this.quantity = d;
		this.unit = unit;
	}
	public Ingredient() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getIngredientId() {
		return ingredientId;
	}
	public void setIngredientId(int ingredientId) {
		this.ingredientId = ingredientId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public Unit getUnit() {
		return unit;
	}
	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	public Recipe getRecipe() {
		return recipe;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	
}
