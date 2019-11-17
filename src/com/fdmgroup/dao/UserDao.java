package com.fdmgroup.dao;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fdmgroup.model.Authority;
import com.fdmgroup.model.Recipe;
import com.fdmgroup.model.User;
import com.fdmgroup.model.UserSession;
import com.fdmgroup.util.JpaUtility;

public class UserDao {
	
	@Autowired
	@Qualifier(value = "recipeDao")
	private RecipeDao recipeDao;
	
	public void saveUsr(User user) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		em.close();
	}
	
	public void updatePassword(User user) {
		
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		
		User foundUser = em.find(User.class, user.getId());
		
		em.getTransaction().begin();
		
		foundUser.setPassword(user.getPassword());
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void updateUser(User user, Principal principal) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		String oldUserName=null;
		UserSession userSession = new UserSession();
		User tempUser=userSession.getCurrentUser(principal);
		
		User findUser=em.find(User.class, tempUser.getId());
		
		oldUserName= findUser.getusername();
		
		findUser.setEmail(user.getEmail());
		findUser.setfName(user.getfName());
		findUser.setlName(user.getlName());
		findUser.setusername(user.getusername());
		
		
		findUser.setPassword(user.getPassword());
		
		findUser.setAnswer1(user.getAnswer1());
		findUser.setAnswer2(user.getAnswer2());
		findUser.setAnswer3(user.getAnswer3());
		
		
		
		List<Authority> authorityList = (ArrayList<Authority>) em.createNamedQuery("findAuthorityId").setParameter("uName", oldUserName).getResultList();
		
		Query query = em.createNamedQuery("updateAuthority");
		query.setParameter("uName", user.getusername());
		query.setParameter("authId", authorityList.get(0).getAuthId());
		
		int outcome = query.executeUpdate();
		
		em.persist(findUser);
		
		em.getTransaction().commit();
		em.close();
	}
	

	public void saveAuth(Authority authority) {
		
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		em.persist(authority);
		em.getTransaction().commit();
		em.close();
	}
	
	public User findById(int id) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		User foundUser = em.find(User.class, id);
		em.close();
		return foundUser;
	}
	
	public List<User> findAllUsers() {
		EntityManager em =JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		List<User> users = em.createNamedQuery("User.findAllUsers").getResultList();
		em.getTransaction().commit();
		em.close();
		return users;			
			
		}
	
	

	public User findUserByUsername(String username) {
		
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();

		Query namedQuery = em.createNamedQuery("findUserByUserName");
		namedQuery.setParameter(1, username);
		User user = (User) namedQuery.getSingleResult();
		em.getTransaction().commit();
		em.close();
		return user;
	}
	
	public void addFavouriteRecipe(User user, Recipe recipe) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		
		user.setRecipeToFavourites(recipe);
		recipe.setUserToFavourites(user);
		
		em.merge(user);
		em.merge(recipe);	
		em.getTransaction().commit();
		em.close();
	}

	public User findUser(String username) {
		
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		Query namedQuery = em.createNamedQuery("findUserByUserNameForUpdateProfile");
		namedQuery.setParameter("uName", username);
		User user = (User) namedQuery.getSingleResult();
		em.getTransaction().commit();
		em.close();
		return user;
		
	}
	
	public void removeFavouriteRecipe(User user, Recipe recipe, int recipeListIndex, int userListIndex) {
		EntityManager em = JpaUtility.getInstance().getEntityManager();
		em.getTransaction().begin();
		
		user.removeRecipeFromFavourites(recipeListIndex);
		recipe.removeUserFromFavourites(userListIndex);
		
		em.merge(user);
		em.merge(recipe);	
		em.getTransaction().commit();
		em.close();
	}

}
