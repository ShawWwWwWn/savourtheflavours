package com.fdmgroup.model;

public enum Unit {

	lb("Pounds (lbs)", "lb"),
	g("Grams (g)", "g"),
	kg("Kilograms (kg)", "kg"),
	oz("Ounces (oz)", "oz"),
	pcs("Pieces (pcs)", "pcs");
	
	private final String fullName;
	private final String shortName;
	
	private Unit(String fullName, String shortName) {
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
