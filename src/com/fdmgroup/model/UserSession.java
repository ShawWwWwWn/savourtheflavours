package com.fdmgroup.model;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.fdmgroup.dao.UserDao;

@Component
@Scope("session")
public class UserSession {

	private static User user = null;
	
	@Autowired
	private static UserDao userDao;
	
	public static User getCurrentUser(Principal principal) {
    	UserDao tempUserDao= new UserDao();
        String username = principal.getName();
        User user = tempUserDao.findUserByUsername(username);
        return user;
    }
	
	public static Boolean hasUser(){
		
		if(user == null){
			return false;
		} else {
			return true;
		}
	}

	public static void setLoggedInUser(User editedUser) {
		UserSession.user = editedUser;
	}
}
