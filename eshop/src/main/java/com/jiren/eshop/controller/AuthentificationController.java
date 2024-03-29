package com.jiren.eshop.controller;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jiren.eshop.domain.User;
import com.jiren.eshop.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Scope("session")
@RequestMapping("/authentication")
public class AuthentificationController {

	private static final Logger logger = LoggerFactory.getLogger(AuthentificationController.class);
	private String sessionUser;
	private static final String AccountAttribut="user";
	
	@Autowired
	UserService userService;
//	@Autowired
//	private JavaMailSender mailSender;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "authentication/login";
 
	}

    @RequestMapping(value="/loginsuccess", method = RequestMethod.GET)
    public <LockoutData> String index (ModelMap model, HttpServletRequest request) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//     	ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    
//    	HttpSession session = attr.getRequest().getSession();
        String name = auth.getName(); //get logged in username
        String mail =request.getParameter("mail");
       // LockoutData data = getData(name);
      //  data.attempts = 0;
        model.addAttribute("username", name);
        return "authentication/loginsuccess";
    }
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "authentication/login";
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "authentication/login";
 
	}
	
	
	 
}
