package com.fdmgroup.model;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "REVIEWS")
@NamedQuery(name = "Review.findCount", query="SELECT COUNT(r) FROM Review r")
public class Review implements IStorable {

	@Id
	@GeneratedValue (strategy = GenerationType.SEQUENCE , generator = "REVIEW_SEQUENCE")
	@SequenceGenerator (name = "REVIEW_SEQUENCE", sequenceName = "REVIEW_SEQ", allocationSize = 1)
	private int reviewId;
	private String comments;
	private int starRating;
	
	private LocalDate creationDate;
	private LocalDate lastUpdatable;
	
	@ManyToOne (cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn (name = "FK_RECIPE")
	private Recipe recipe;
	
	@ManyToOne (cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn (name = "FK_USER")
	private User user;
	
	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Review() {
		super();
	}

	public Review(String comment, int starRating) {
		super();
		this.comments = comment;
		this.starRating = starRating;
		this.creationDate = LocalDate.now();
		this.lastUpdatable = LocalDate.now();
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comment) {
		this.comments = comment;
	}

	public int getStarRating() {
		return starRating;
	}

	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}

	public LocalDate getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(LocalDate creationDate) {
		this.creationDate = creationDate;
	}

	public LocalDate getLastUpdatable() {
		return lastUpdatable;
	}

	public void setLastUpdatable(LocalDate lastUpdatable) {
		this.lastUpdatable = lastUpdatable;
	}

	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", comment=" + comments + ", starRating=" + starRating
				+ ", creationDate=" + creationDate + ", lastUpdatable=" + lastUpdatable + "]";
	}
	
	
}