package com.jiren.eshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;

public interface UserService {
 

	public List<User> findAllUsers();
	public List<User> findUsersEntries(int firstResult, int maxResults);
	public void save(User u);
	public User findById(String userId);
	public User updateUser(User user);
	public float countAllAccounts();
	public List<User> findByName(String userName);
	public List<User> findBymail(String mail);
	public User findBymail2(String mail);
	//public User findmail(User currentUser);
	public List<User> findBypassword(String password);
	public void delete(User user);
	public void deleteById(String userId);
	
	public User getCurrentlyAuthenticatedUser();
	

}
