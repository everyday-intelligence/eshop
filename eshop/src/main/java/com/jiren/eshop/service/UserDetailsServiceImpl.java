package com.jiren.eshop.service;

import java.util.ArrayList;






import java.util.Collection;
import java.util.List;

import org.apache.catalina.Session;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jiren.eshop.dao.UserRepository;



@Service("userDetailsService")
	public class UserDetailsServiceImpl implements UserDetailsService {
		//private User user;
		@Autowired
		UserRepository userRepository;
		@Autowired
		 UserServiceImpl userService;
		@SuppressWarnings("deprecation")
		@Override
		public UserDetails loadUserByUsername(String mail) throws UsernameNotFoundException,DataAccessException {
			List<com.jiren.eshop.domain.User> users =userRepository.findBymail(mail);
			if(users!=null && !users.isEmpty()){
				com.jiren.eshop.domain.User user = users.get(0);
				Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				authorities.add(new GrantedAuthorityImpl(user.getRole()));
				 System.out.println( authorities);
				
				 //System.out.println( SecurityContextHolder.getContext().getAuthentication().getName());
				
//			    for (String role : user.getAuthorities()) {
//			    	authorities = new ArrayList<GrantedAuthority>();
//			       authorities.add(new GrantedAuthorityImpl(role));
//			      System.out.println( SecurityContextHolder.getContext().getAuthentication());
//			     
//			      //System.out.println(session.setAttribute("userObject", myUserObject););
//			       
//			    }
//				 if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
//					  System.out.println("LOGGED IN");
//					  } else {
//					  System.out.println("NOT LOGGED IN");
//					}
				org.springframework.security.core.userdetails.User springUser = new User(user.getMail(), user.getPassword(), user.isEnabled(),
				      true, true, true, authorities);
			
				
				return springUser;
			}
			return null;
			
			
		}

		
}

