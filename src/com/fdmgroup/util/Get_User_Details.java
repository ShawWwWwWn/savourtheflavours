package com.fdmgroup.util;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;
public class Get_User_Details {
	
	public static void main(String[] args) {

		FacebookClient fbClient = new DefaultFacebookClient("EAAV5DSwqxEoBANuOpFN5lQnltfT1qK6o8ZCbU4b6DqJbpBQea…0l4hnsdRSOA8A4O7fiblEXoPHvSx95E6DDElemB4H8r1gZDZD", Version.VERSION_3_0);
	
		User user = fbClient.fetchObject("me", User.class);

		System.out.println(user.getName());
	}
	
	
//	public User_Profile Get_Profile_info(String accesstoken) {
//		
//		User_Profile obj_User_Profile=new User_Profile();
//		FacebookClient facebookClient = new DefaultFacebookClient(accesstoken, Version.VERSION_3_0);
//		User user = facebookClient.fetchObject("me", User.class);
//		System.out.println("User name: " + user.getName());
//		obj_User_Profile.setUser_name(user.getName());
//		return obj_User_Profile;
//	}
}
