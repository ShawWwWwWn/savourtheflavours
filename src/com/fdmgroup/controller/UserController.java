
package com.fdmgroup.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fdmgroup.dao.RecipeDao;
import com.fdmgroup.dao.UserDao;
import com.fdmgroup.model.Authority;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.User;
import com.fdmgroup.model.UserSession;

@Controller
public class UserController {
	@Autowired
	@Qualifier(value = "userDao")
	private UserDao userDao;
	@Autowired
	@Qualifier(value = "recipeDao")
	private RecipeDao recipeDao;

	@RequestMapping(value = "/showLogin")
	public String showLogin() {
		return "login";
	}
	@RequestMapping(value = "/showLogin1")
	public String showLogin1() {
		return "login";
	}
	
	@RequestMapping(value = "/fPFindUser")
	public String fPFindUser() {
		return "fPFindUser";
	}
	
	@RequestMapping(value = "/findUserByUsername")
	public String fPFindUserByUsername(@RequestParam("username") String username, Model model) {
		
		List<User> users = userDao.findAllUsers();
		List<User> displayN = userDao.findAllUsers();
		List<String> displayNames= new ArrayList<>();
		for (int i=0;i<users.size();i++) {
			displayNames.add(users.get(i).getusername());
		}
		
		if(users != null && !displayNames.contains(username)){
			model.addAttribute("error", "User name doesn't exist!");
			return "fPFindUser";
		}
		
		User foundUser = userDao.findUserByUsername(username);
		
		model.addAttribute("existingUser", foundUser);
	
		return "fPResetPassword";
	}
	
	@RequestMapping(value = "/validateSecurity")
	public String validateSecurityQuestions(Model model, @RequestParam("username") String username, @RequestParam("answer1") String answer1, 
			@RequestParam("answer2") String answer2, @RequestParam("answer3") String answer3, HttpServletRequest request) {
		
		
		User foundUser = userDao.findUserByUsername(username);
	
		request.getSession().setAttribute("existingUser", foundUser);
		
		if(foundUser.getAnswer1().equals(answer1) && foundUser.getAnswer2().equals(answer2) && foundUser.getAnswer3().equals(answer3)) {
	
		return "fPChangePassword";
		
		}
		
		model.addAttribute("error", "Incorrect Answer(s)");
		
		return "fPResetPassword";
	}
	
	@RequestMapping(value = "/resetUserPassword")
	public String resetUserPassword(Model model, @RequestParam("newPassword") String pw1, @RequestParam("newPasswordRepeat") String pw2, HttpServletRequest request) {
		
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		
		if (!pw1.equals(pw2)) {
			
			model.addAttribute("error", "Confirmed password doesn't match");
			
			return "fPChangePassword";
		}
		
		model.addAttribute("success", "Password Successfully Reset");
		
		User user = (User) request.getSession().getAttribute("existingUser");
		
		user.setPassword(pwEncoder.encode(pw1));
		
		userDao.updatePassword(user);
		
		return "login";
	}
	
	@RequestMapping(value = "/showRegistration")
	public String showRegistration(Model model) {
		model.addAttribute("user", new User());
		
		return "registration"; // here registration is the view name

	}
	@RequestMapping(value = "/showRegistration1")
	public String showRegisteration1(Model model) {
		model.addAttribute("user", new User());
		
		return "registration"; // here registration is the view name

	}
	@RequestMapping(value = "/showTables")
	public String showLogin2() {
		return "tables";
	}
	

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String userRegistration(@ModelAttribute(value = "user") User newUser, Model model) {
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		
		List<User> users = userDao.findAllUsers();
		List<User> displayN = userDao.findAllUsers();
		List<String> displayNames= new ArrayList<>();
		for (int i=0;i<users.size();i++) {
			displayNames.add(users.get(i).getusername());
		}
		
		
		List<String> usersEmail = new ArrayList<>();
		for (int i=0;i<users.size();i++) {
			usersEmail.add(users.get(i).getEmail());
		}
		if(users != null && usersEmail.contains(newUser.getEmail())){			
			model.addAttribute("error1", "Email already registered!");
			return "registration";
		}
		
		else if(users != null && displayNames.contains(newUser.getusername())){
			model.addAttribute("error1", "User name already exists!");
			return "registration";
		}
		
		else {
			
			newUser.setPassword(pwEncoder.encode(newUser.getPassword()));
			userDao.saveUsr(newUser);
			userDao.saveAuth(new Authority(newUser.getusername(),"ROLE_USER"));			
			return "login";
		}
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/viewUserProfile")
	public String viewUserProfile(Model model, Principal principal) {
		
		try{
			
			UserSession userSession = new UserSession();
			User user= userSession.getCurrentUser(principal);
			model.addAttribute("user",user);
			model.addAttribute("ifSuccess", null);
			
		}
		catch(Exception e){
			System.out.println("exception");
			model.addAttribute("ifSuccess", null);
		}
		return "updateProfile";

	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/updateUserProfile", method = RequestMethod.POST)
	public String updateUserProfile(@ModelAttribute(value = "user") User newUser,Principal principal, Model model) {
		
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		newUser.setPassword(pwEncoder.encode(newUser.getPassword()));
		
		userDao.updateUser(newUser,principal);
		model.addAttribute("ifSuccess", "1");
		return "updateProfile";


	}

	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/unfavourited/{recipeId}", method = RequestMethod.GET)
	public String unFavourite(Model model, Principal principal, @PathVariable int recipeId, RedirectAttributes redir) {
		Recipe recipe = recipeDao.findById(recipeId);
		
		int recipeListIndex;
		int userListIndex;
		
		User user = userDao.findUserByUsername(principal.getName());
		
		for(int i = 0; i < user.getFavRecipeList().size(); i++) {
			Recipe userRecipe = user.getFavRecipeList().get(i);
			
			if(userRecipe.getRecipeId() == recipe.getRecipeId()) {
				
				recipeListIndex = i;
				
				for(int j = 0; j < recipe.getUserList().size(); j++) {
					User recipeUser = recipe.getUserList().get(j);
					if(recipeUser.getId() == user.getId()) {
						userListIndex = j;
						
						userDao.removeFavouriteRecipe(user, userRecipe, recipeListIndex, userListIndex);
						redir.addFlashAttribute("FavouriteMsg", "Recipe no longer in favourites");
						redir.addFlashAttribute("recipe", recipe);
						redir.addFlashAttribute("rswitch", "0");
						return "redirect:../viewRecipe/"+recipeId;
					}
				}
			}
		}
		redir.addFlashAttribute("recipe", recipe);
		return "redirect:../viewRecipe/"+recipeId;
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/favourited/{recipeId}", method = RequestMethod.GET)
	public String addFavourite(Model model, Principal principal, @PathVariable int recipeId, RedirectAttributes redir) {
		
		Recipe recipe = recipeDao.findById(recipeId);
		
		int recipeListIndex;
		int userListIndex;
		
		if(principal == null) {
			redir.addFlashAttribute("FavouriteMsg", "You are not signed in!");
			return "redirect:../viewRecipe/"+recipeId;
		} else {
			User user = userDao.findUserByUsername(principal.getName());
			
			for(int i = 0; i < user.getFavRecipeList().size(); i++) {
				Recipe userRecipe = user.getFavRecipeList().get(i);
				
				if(userRecipe.getRecipeId() == recipe.getRecipeId()) {
					
					recipeListIndex = i;
					
					for(int j = 0; j < recipe.getUserList().size(); j++) {
						User recipeUser = recipe.getUserList().get(j);
						if(recipeUser.getId() == user.getId()) {
							userListIndex = j;
							
							userDao.removeFavouriteRecipe(user, userRecipe, recipeListIndex, userListIndex);
							redir.addFlashAttribute("FavouriteMsg", "Recipe no longer in favourites");
							redir.addFlashAttribute("recipe", recipe);
							redir.addFlashAttribute("rswitch", "1");
							
							return "redirect:../viewRecipe/"+recipeId;
						}
					}
				}
			}
			userDao.addFavouriteRecipe(user, recipe);
			redir.addFlashAttribute("recipe", recipe);
		}
		redir.addFlashAttribute("FavouriteMsg", "Recipe added to favourites");
		redir.addFlashAttribute("rswitch", "0");
		return "redirect:../viewRecipe/"+recipeId;
	}

}