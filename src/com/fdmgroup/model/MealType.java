package com.fdmgroup.model;

public enum MealType {

	Breakfast("Breakfast", "Breakfast"),
	Lunch("Lunch", "Lunch"),
	Dinner("Dinner", "Dinner"),
	Snacks("Snacks", "Snacks"),
	Drinks("Drinks", "Drinks");
	
	private final String fullName;
	private final String shortName;
	
	private MealType(String fullName, String shortName) {
		this.fullName = fullName;
		this.shortName = shortName;
	}

	public String getFullName() {
		return fullName;
	}

	public String getShortName() {
		return shortName;
	}
}
