package com.fdmgroup.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fdmgroup.dao.RetriveDao;
import com.fdmgroup.dao.UserDao;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.User;

@Controller
public class HomeController {
	
	@Autowired
	private RetriveDao retriveDao;
	
	@RequestMapping(value="home")
	public String showTopRatedRecipes(Model model, HttpServletRequest req,Principal principal ) {
		model.addAttribute("topRatedList", req.getAttribute("topRatedList"));
		model.addAttribute("topRatedImages", req.getAttribute("topRatedImages"));
		model.addAttribute("recipeRatings", req.getAttribute("recipeRatings"));
		
		model.addAttribute("mostViewedList", req.getAttribute("mostViewedList"));
		model.addAttribute("mostViewedImages", req.getAttribute("mostViewedImages"));
		
		model.addAttribute("trendingList", req.getAttribute("trendingList"));
		model.addAttribute("trendingImages", req.getAttribute("trendingImages"));
		
		UserDao tempUserDao= new UserDao();
//      String username = principal.getName();
//        User user = tempUserDao.findUserByUsername(username);
//        model.addAttribute("userId", user.getId());
		
        return "home";
	}
}
