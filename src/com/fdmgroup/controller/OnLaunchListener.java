package com.fdmgroup.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;

import com.fdmgroup.dao.RetriveDao;
import com.fdmgroup.dao.ReviewDao;
import com.fdmgroup.model.Recipe;

@Controller
public class OnLaunchListener implements ApplicationListener {

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		
		if (!(event instanceof ContextRefreshedEvent)) return;
	    ContextRefreshedEvent e = (ContextRefreshedEvent) event;
	    ApplicationContext appContext = e.getApplicationContext();
	    if (!(appContext instanceof WebApplicationContext)) return;
	    WebApplicationContext ctx = (WebApplicationContext) e.getApplicationContext();
	    ServletContext req = ctx.getServletContext();
 
		System.out.println("STF Context *** 0");
    	
    	RetriveDao retriveDao = new RetriveDao();
    	ReviewDao reviewDao = new ReviewDao();
    	
    	List<Recipe> topRatedList = retriveDao.getTopRated(25);
		Map<Integer, String> topRatedImages = new HashMap<Integer, String>();
		Map<Integer, Double> recipeRatings = new HashMap<Integer, Double>();
		
        int size_top = topRatedList.size();
        for (int i = 0; i < size_top / 2; i++) {
            final Recipe food = topRatedList.get(i);
            topRatedList.set(i, topRatedList.get(size_top - i - 1)); // swap
            topRatedList.set(size_top - i - 1, food); // swap
        }
		
		for (Recipe recipe : topRatedList) {
			if (recipe.getImages().get(0).getData()!=null) {
				String encode = Base64.getEncoder().encodeToString(recipe.getImages().get(0).getData());
				topRatedImages.put(recipe.getRecipeId(), encode);
				recipeRatings.put(recipe.getRecipeId(), reviewDao.findAverageRating(recipe));
			} else {
				topRatedImages.put(recipe.getRecipeId(), null);
				recipeRatings.put(recipe.getRecipeId(), reviewDao.findAverageRating(recipe));
			}
		}
		
		System.out.println("STF Context *** 1");
		
		req.setAttribute("recipeRatings", recipeRatings);
		req.setAttribute("topRatedList", topRatedList);
		req.setAttribute("topRatedImages", topRatedImages);
		
		List<Recipe> mostViewedList = retriveDao.getMostViewed(25);
		Map<Integer, String> mostViewedImages = new HashMap<Integer, String>();
		
        int size_mv = mostViewedList.size();
        for (int i = 0; i < size_top / 2; i++) {
            final Recipe food = mostViewedList.get(i);
            mostViewedList.set(i, mostViewedList.get(size_mv - i - 1)); // swap
            mostViewedList.set(size_mv - i - 1, food); // swap
        }
		
		for (Recipe recipe : topRatedList) {
			if (recipe.getImages().get(0).getData()!=null) {
				String encode = Base64.getEncoder().encodeToString(recipe.getImages().get(0).getData());
				mostViewedImages.put(recipe.getRecipeId(), encode);
			} else {
				mostViewedImages.put(recipe.getRecipeId(), null);
			}
		}
		
		System.out.println("STF Context *** 2");
		
		req.setAttribute("mostViewedList", mostViewedList);
		req.setAttribute("mostViewedImages", mostViewedImages);
		
		
		List<Recipe> trendingList = retriveDao.getTrending(25);
		Map<Integer, String> trendingImages = new HashMap<Integer, String>();
				
		for (Recipe recipe : topRatedList) {
			if (recipe.getImages().get(0).getData()!=null) {
				String encode = Base64.getEncoder().encodeToString(recipe.getImages().get(0).getData());
				trendingImages.put(recipe.getRecipeId(), encode);
			} else {
				trendingImages.put(recipe.getRecipeId(), null);
			}
		}
		
		System.out.println("STF Context *** 3");
		
		req.setAttribute("trendingList", trendingList);
		req.setAttribute("trendingImages", trendingImages);
	}
}