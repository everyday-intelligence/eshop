package com.jiren.eshop.controller;

import java.util.ArrayList;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.web.PageableDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;
import com.jiren.eshop.service.UserService;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends SimpleFormController {
	private static final String USERSNAMES = "user";
		//private static final String CATSNAMES = "category";
	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	MongoTemplate mongoTemplate;
	@RequestMapping(value = "/randomUsers/{number}", method = RequestMethod.GET)
	public String createRandom(@PathVariable("number") int number,
			ModelMap model) {
		for (int i = 0; i < number; i++) {
			User u = new User();
			u.setName(USERSNAMES + "_" + i);
			//u.setsetPrice((float) (Math.random() * 1000));
			u.setPrenom(USERSNAMES + "_" + i);
			u.setLogin(USERSNAMES + "_" + i);
			u.setPassword(USERSNAMES + "_" + i);
			
			//u.setRole(USERSNAMES + "_" + i);
			//u.setTel(USERSNAMES + "_" + i);
			
//			Category c = new Category();
//			int cn = (int) Math.round(Math.random() * 30);
//			c.setName(CATSNAMES + "_" + cn);
//			p.setCategory(c);
			userService.save(u);
		}
		return "redirect:/user/all";
	}

	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String create(ModelMap model) {
		User u = new User();
	
		//p.setCategory(new Category());
		model.addAttribute("command", u);
		return "user/new";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String create(@ModelAttribute User u, BindingResult result) {
		userService.save(u);
		return "redirect:/user/all";
	}

	@RequestMapping(value = "/showU", method = RequestMethod.GET)
	public String showU( ModelMap model){
		
		Authentication a = SecurityContextHolder.getContext().getAuthentication();
	    String name = a.getName();
	    System.out.println(name);
	    List<User> us=userService.findBymail(name);
		User u = userService.findById(us.get(0).get_id());
		
			model.addAttribute("user", u);
			
			return "user/detail";
		}
		
		
		
		
	
	
	
	
	@RequestMapping(value = "/update/{userId}", method = RequestMethod.GET)
	public String update(@PathVariable("userId") String userId, ModelMap model){
		User u = userService.findById(userId);
		if(u!=null){
			model.addAttribute("command", u);
			return "user/update";
		}else{//normalement erreur
			return "redirect:/user/all";
		}
	}
	// erreur au niv de void ou de type user
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute User u, BindingResult result) {
		String idAvant = u.get_id();
		u = userService.updateUser(u);
		String idapres = u.get_id();
		logger.info("updated before "+(idAvant));
		logger.info("updated after ? "+(idapres));
		logger.info("updated ok ? "+(idapres==idAvant));
		return "redirect:/user/show/"+u.get_id();
	}

	
	@RequestMapping(value = "/all")
	public String findAll(ModelMap model,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size) {
		int sizeNo = 10;
		int firstResult = 0;
		if (size != null) {
			sizeNo = size.intValue();
		}
		if (sizeNo > 25) {
			sizeNo = 25;
		}
		if (page == null) {
			page = 1;
		}
		firstResult  = (page.intValue() - 1) * sizeNo;

		
		model.addAttribute("users",
				userService.findUsersEntries(firstResult, sizeNo));
		float nrOfPages = (float) userService.countAllAccounts() / sizeNo;
		model.addAttribute(
				"maxPages",
				(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1
						: nrOfPages));

		return "user/all";
	}

	/*
	 * pageable
	 */
	@RequestMapping(value = "/findByName/{userName}", method = RequestMethod.GET)
	public String findById(@PathVariable("userName") String userName,
			ModelMap model) {
		List<User> ps = userService.findByName(userName);
		logger.info("found = "+((ps!=null)&&(!ps.isEmpty())));
		model.addAttribute("users", ps);
		return "user/userssSearchResults";
	}
	/*
	 * pageable
	 */
	@RequestMapping(value = "/findBypassword/{password}", method = RequestMethod.GET)
	public String findBypassword(@PathVariable("password") String password,
			ModelMap model) {
		List<User> ps = userService.findBypassword(password);
		logger.info("found");
		model.addAttribute("users", ps);
		return "user/usersSearchResults";
	}
	
	@RequestMapping(value = "/findBymail/{mail}", method = RequestMethod.GET)
	public String findBymail(@PathVariable("mail") String mail,
			ModelMap model) {
		List<User> ps = userService.findBymail(mail);
		logger.info("found");
		model.addAttribute("users", ps);
		return "user/usersSearchResults";
	}
	
	@RequestMapping(value = "/show/{userId}", method = RequestMethod.GET)
	public String show(@PathVariable("userId") String userId,
			ModelMap model) {
		User u = userService.findById(userId);
		logger.info("found");
		model.addAttribute("user", u);
		return "user/detail";
	}
	@RequestMapping(value = "/delete/{userId}", method = RequestMethod.GET)
	public String delete( @PathVariable("userId") String userId, ModelMap model)
			 {
	//	User user= userService.findById(userId);
		logger.info(userId);
		 mongoTemplate.remove(new Query(Criteria.where("_id").is(userId)), User.class);
		//userService.deleteById(userId);
		
		return "redirect:/user/all";
	}
	@RequestMapping(value="/remove/{userId}",method=RequestMethod.GET)
	public String remove(@PathVariable("userId") String userId, ModelMap model) {
//		
		User user= userService.findById(userId);
		
		userService.delete(user);
		
		return "redirect:/user/all";
	}
	//liste role 
	@ModelAttribute("roleList")
	public Map<String,String> populateJavaSkillList() {
		
		//Data referencing for java skills list box
		Map<String,String> role = new LinkedHashMap<String,String>();
		role.put("ROLE_VENDEUR", "ROLE_VENDEUR");
		role.put("ROLE_USER", "ROLE_USER");
		role.put("ROLE_ADMIN", "ROLE_ADMIN");
		
		
		return role;
	}
}
