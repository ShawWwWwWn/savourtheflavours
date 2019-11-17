package com.fdmgroup.dao;

import java.util.List;

import com.fdmgroup.model.Review;

public interface IReviewDao extends  IStorage<Review>, IEditable<Review>, IRemovable<Review>{
	public List<Review> findReviewByRecipeId (int recipeId);
	public void delete (int reviewId);
}
