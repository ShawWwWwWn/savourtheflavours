//package com.fdmgroup.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.restfb.DefaultFacebookClient;
//import com.restfb.FacebookClient;
//import com.restfb.Parameter;
//import com.restfb.Version;
//import com.restfb.types.FacebookType;
//
//@Controller
//public class FacebookController {
//
//	@RequestMapping(value="share", method = RequestMethod.GET)
//	public String shareOnFacebook(Model model){
//		
//		String access_token = "fg";
//		
//		FacebookClient fbClient = new DefaultFacebookClient(access_token);
//		
//		FacebookType respone = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", "Facebook API Test"), Parameter.with("link", "https://google.ca"));
//		
//		return "home";
//	}
//}
