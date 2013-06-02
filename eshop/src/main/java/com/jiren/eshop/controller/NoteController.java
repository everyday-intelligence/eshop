package com.jiren.eshop.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Note;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.service.NoteService;
import com.jiren.eshop.service.ProductService;
import com.jiren.eshop.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/note")
public class NoteController {

	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);

	
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	private NoteService noteService;
	
	@RequestMapping(value="/add/{productId}",method=RequestMethod.GET)
	public String add(@PathVariable("productId") String productId, ModelMap model) {
	
		Product p = productService.findById(productId);
		
		//model.addAttribute("shoppingCart", shoppingCart);
		return "redirect:/product/all";

	}
	
	
	 
}
