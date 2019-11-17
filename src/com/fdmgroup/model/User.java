package com.fdmgroup.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAllUsers", query = "select u from User u")
@NamedQuery(name = "findUserByUserName", query = "SELECT u FROM User u WHERE u.username = ?1")

@NamedQuery(name = "findUserByUserNameForUpdateProfile", query = "SELECT u FROM User u WHERE u.username = :uName")


public class User implements IStorable {

	@Id
	/* @OneToMany (mappedBy="user") */
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String username;
	private String fName;
	private String lName;
	
	private String password;	
	private boolean enabled;
	private String email;
	private String securityQ1;
	private String securityQ2;
	private String securityQ3;
	private String answer1;
	private String answer2;
	private String answer3;

	@OneToMany (mappedBy="user")
	private List<Recipe> recipe = new ArrayList<>();
	
	@ManyToMany 
	@JoinTable(name="FAV_RECIPE_USER",
			joinColumns=@JoinColumn(name="FK_RECIPE_ID"),
			inverseJoinColumns=@JoinColumn(name="FK_USER_FAV_ID"))
	private List<Recipe> favRecipeList = new ArrayList<>();
	
	

	public void setRecipeToFavourites(Recipe recipe) {
		favRecipeList.add(recipe);
	}
	public void removeRecipeFromFavourites(int index) {
		favRecipeList.remove(index);
	}

	public User() {
		super();
	}

	

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getusername() {
		return username;
	}

	public void setusername(String uName) {
		this.username = uName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecurityQ1() {
		return securityQ1;
	}

	public void setSecurityQ1(String securityQ1) {
		this.securityQ1 = securityQ1;
	}

	public String getSecurityQ2() {
		return securityQ2;
	}

	public void setSecurityQ2(String securityQ2) {
		this.securityQ2 = securityQ2;
	}

	public String getSecurityQ3() {
		return securityQ3;
	}

	public void setSecurityQ3(String securityQ3) {
		this.securityQ3 = securityQ3;
	}
     
	public String getAnswer1() {
		return answer1;
	}

	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}

	public String getAnswer2() {
		return answer2;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getAnswer3() {
		return answer3;
	}

	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}

	public int getId() {
		return id;
	}


	public List<Recipe> getFavRecipeList() {
		return favRecipeList;
	}

	public List<Recipe> getRecipe() {
		return recipe;
	}

	public void setRecipe(List<Recipe> recipe) {
		this.recipe = recipe;
	}

	public void setFavRecipeList(List<Recipe> favRecipeList) {
		this.favRecipeList = favRecipeList;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", fName=" + fName + ", lName=" + lName + ", enabled=" + enabled + ", email=" + email + ", securityQ1=" + securityQ1
				+ ", securityQ2=" + securityQ2 + ", securityQ3=" + securityQ3 + ", answer1=" + answer1 + ", answer2="
				+ answer2 + ", answer3=" + answer3 + "]";
	}

	

}
