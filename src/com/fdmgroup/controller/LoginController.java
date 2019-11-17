package com.fdmgroup.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdmgroup.dao.UserDao;
import com.fdmgroup.model.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDao uDao;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(Model model, HttpServletRequest req, Principal principal) {
		
		System.out.println("Inside login method");
		
		return "login";
	}
	
	@RequestMapping(value="/loginFailed", method=RequestMethod.GET)
	public String loginFailed(Model model) {
		
		System.out.println("Inside login failed method");
		
		model.addAttribute("error", "true");
		
		return "login";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Model model) {
		
		System.out.println("Inside logout method");
		
		return "logout";
	}
	
	@RequestMapping(value="/403", method=RequestMethod.GET)
	public String error403Page(Model model){
		
		return "403";
	}
	
	@RequestMapping(value="/showHome", method=RequestMethod.GET)
	public String showHome() {
		
		return "home";
	} 
	
	@RequestMapping(value="/showFbLogin", method=RequestMethod.GET)
	public String showFbLogin() {
		
		return "FbLoginTest";
	} 
}
