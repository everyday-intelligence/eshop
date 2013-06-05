package com.jiren.eshop.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiren.eshop.dao.ProductRepository;
import com.jiren.eshop.dao.UserRepository;
import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	private PasswordEncoder encoder = new ShaPasswordEncoder(256);
	@Autowired
	UserRepository userRepository;
	@Autowired
	MongoTemplate mongoTemplate;
	@Override
	public float countAllAccounts() {
		 return userRepository.count();
	}
	@Override
	public List<User> findAllUsers() {
		return  (List<User>) userRepository.findAll();
	}
	@Override
	public List<User> findUsersEntries(int firstResult, int maxResults) {
        return userRepository.findAll(new PageRequest(firstResult / maxResults, maxResults)).getContent();
	}
	@Override
	public void save(User u) {
		   userRepository.save(u);
		  
		   String originalPsw = u.getPassword();
		   String confirm=u.getConfirmpassword();
	       String newPsw = encoder.encodePassword(originalPsw,null);
	       String newPsw2 = encoder.encodePassword(confirm,null);
	       u.setPassword(newPsw);
	       u.setConfirmpassword(newPsw2);
	   //  u.setActive(false);
	  //   u.setIsEnabled(true);
	       userRepository.save(u);
	}

	@Override
	public User findById(String userId) {
		return userRepository.findOne(userId);
	}
	@Override
	public List<User> findByName(String userName) {
		return userRepository.findByNameContaining(userName);
	}
	/*
	 * TODO changer avec une requete et like
	 * @see com.jiren.eshop.service.ProductService#findByCategory(java.lang.String)
	 */
	@Override 
	public List<User> findBypassword(String password) {
		
		return userRepository.findBypassword(password);

	}
	@Override
	public void delete(User user) {
		userRepository.delete(user);
	}
	@Override
	public void deleteById(String userId) {
		//mongoTemplate.remove(userId);
		//Query query1 = Query.query(Criteria.where("_id").is(userId));
		// mongoTemplate.find(query1, User.class);
		// Query query = new Query(Criteria.where("id").is(userId));
		 //mongoTemplate.find(query, User.class);
		 mongoTemplate.remove(new Query(Criteria.where("id").is("userId")), User.class);
			
//		User u= findById(userId);
//	
//		if(u!=null){
//			delete(u);
		//}
	}
	public User updateUser(User user) {
        return userRepository.save(user);
    }
	@Override
	public List<User> findBymail(String mail) {
		return userRepository.findBymail(mail);
	}
	@Override
	public User getCurrentlyAuthenticatedUser() {
	    User currentUser=new User();

	    Authentication a = SecurityContextHolder.getContext().getAuthentication();
	    UserDetails currentUserDetails = (UserDetails) a.getPrincipal();
	    if(currentUserDetails==null) {
	    	
	        return currentUser;
	    }

	    currentUser.setName(currentUserDetails.getUsername());
	    System.out.println(currentUser);
		return currentUser;
		
}
	@Override
	public User findBymail2(String mail) {
		return userRepository.findByMail(mail);
	}
}