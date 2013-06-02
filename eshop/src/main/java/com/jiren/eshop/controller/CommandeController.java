package com.jiren.eshop.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.jiren.eshop.dao.CommandeRepository;
import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ShoppingCart;
import com.jiren.eshop.domain.User;
import com.jiren.eshop.service.CommandeService;
import com.jiren.eshop.service.ProductService;
import com.jiren.eshop.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("shoppingCart")
@RequestMapping(value = "/commande")
public class CommandeController {
	private static final String COMMSNAMES = "commande";
	private static final Logger logger = LoggerFactory.getLogger(CommandeController.class);
	
	@Autowired
	private CommandeService commandeService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "/randomProducts/{number}", method = RequestMethod.GET)
	public String createRandom(@PathVariable("number") int number,
			ModelMap model) {
		for (int i = 0; i < number; i++) {
			Commande c = new Commande();
			c.setEtat(COMMSNAMES + "_" + i);
			commandeService.save(c);
		}
		return "redirect:/commande/all";
	}

//	@RequestMapping(value = "/new", method = RequestMethod.GET)
//	public String create(ModelMap model) {
//		Commande c = new Commande();
//		model.addAttribute("command", c);
//		return "commande/all";
//	}
//	@RequestMapping(value = "/add/{shoppingCart}", method = RequestMethod.GET)
//	public String create(@ModelAttribute Commande c, BindingResult result) {
//		Authentication a = SecurityContextHolder.getContext().getAuthentication();
//	    String name = a.getName();
//		List<User> us=userService.findBymail(name);
//	     System.out.println(us);
//	     c.setUser(us);
//	     
//		commandeService.save(c);
//		return "redirect:/commande/all";
//	}
	
	
	@RequestMapping(value = "/allUser" ,method = RequestMethod.GET)
	public String findAll1(ModelMap model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size){
		
		Authentication a = SecurityContextHolder.getContext().getAuthentication();
	    String name = a.getName();
	    System.out.println(name);
	    List<User> us=userService.findBymail(name);
	   System.out.println(us.get(0));
	   List<Commande> cs=  commandeService.findOrdersByCustomer(us.get(0));
	    System.out.println(cs);
	   model.addAttribute("commandUser", cs);
	   model.put("page", page);
		model.put("size", size);
		return "commande/allUser";
	}
	
	
	@RequestMapping(value = "/allVen" ,method = RequestMethod.GET)
	public String findAllV(ModelMap model){
		List <Commande>  commandeVendeur = new ArrayList<Commande>();
		Authentication a = SecurityContextHolder.getContext().getAuthentication();
	    String name = a.getName();
	    System.out.println(name);
	    User us=(User) userService.findBymail2(name);
	
	    System.out.println(us);
	//   List<Commande> cs=  commandeService.findOrdersWithVendeur(us.get(0));
	// System.out.println(cs);
	    //List<Commande> commande = commandeService.findByEtat(etat);
	   // System.out.println(commande);
	  
	   // ArrayList<Commande>commandeVendeur;
	      String etat="Non envoyée";
		   List<Commande> commandeNONENVOYE = commandeService.findByEtat(etat);
		    System.out.println(commandeNONENVOYE); 
		    for( Commande com :commandeNONENVOYE){
		    	List<CommandeUnitaire> commUni= com.getCommandeUni();
		         System.out.println(commUni);
		         
		         for( CommandeUnitaire cmd :commUni){
		        	 	User	x=  cmd.getProduct().getVendeur();
		        	 
		        	 System.out.println(x);
		        	// List<Product> product= new  ArrayList<Product>();
		        	// product = productService.findProductsByVendeur(x);
		        	// System.out.println(product);
		        	while(x==us ){System.out.println("identique");
		        	commandeVendeur.add(com);}
		              //System.out.println(userService.findBymail(name));
//		        	 List<Product> product = productService.findProductsByVendeur(x.get(0));
//		        	 System.out.println(product);
//	        	 if(cmd.getProduct().getVendeur()==(userService.findBymail(name))){	 System.out.println("identique");
//	        	 
//	        	 commandeVendeur.add(com);
//	        	 
//	        	 }
		        	// else {System.out.println("non identique");}
//		        	
	        }
		         
		    			System.out.println("***************");
		    			// System.out.println(cmdUni);
		    			// List<User> vendeur=commUni.getProduct().getVendeur();
		    			 //List<Product> product = productService.findProductsByVendeur(us.get(0));
		    			//System.out.println(cmdUni);
		    			
	    		// List<User> vendeur= commUni.get(2).getProduct().getVendeur();
	    		// System.out.println(vendeur);
		    			
//		    		String id=vendeur.get(0).get_id();
//		    		User v= userService.findById(id);
//		    		System.out.println(v);
		    		//System.out.println(vendeur.get(0).get_id());
//		    		if(cmdUni.getProduct().getVendeur()==us){
//		    			
//		    			 System.out.println("identique");}
//		    		
		    	// }
		   
		   
//	    System.out.println("**********/////***********");
//	    List<Product> product = productService.findProductsByVendeur(us.get(0));
//	     System.out.println(product);
//	     System.out.println("**********/////***********");
//	    List<Product> prod = productService.findAllProducts();
//	    System.out.println(prod);
//	    System.out.println("*********************");
	
	    
		
	    //List<CommandeUnitaire> cs=  commandeService.findOrdersBycommandeUni(product);
	    // System.out.println(cs);
	 //   List<Commande> cmd =commandeService.findOrdersBycommandeUni(commande.get(0));
	    
	  //  System.out.println(cmd);
	   
	    
	
	//
		    }
		 model.addAttribute("commandeVendeur", commandeVendeur);
		return "commande/allVen";
	}
	
	@RequestMapping(value="/add/{shoppingCart}",method=RequestMethod.GET)
	public String add(@ModelAttribute("shoppingCart") Commande shoppingCart,HttpSession session) {
		Commande  c =new Commande();
		Authentication a = SecurityContextHolder.getContext().getAuthentication();
	    String name = a.getName();
	    
		List<User> us=userService.findBymail(name);
		 System.out.println(us);
	    c.setUser(us);
		  Commande cmd = (Commande)session.getAttribute("shoppingCart");
		 c.setCommandeUni(cmd.getCommandeUni()); 
	   //  Commande prod=  shoppingCart.getCommande();
	//   c.setCommandeUni(  (List<CommandeUnitaire>) shoppingCart.getCommande());
	 //   System.out.println(prod);
	  
		commandeService.save(c);
		//model.addAttribute("commande", c);
		//Commande c = new Commande();
	//	c.setUser(user);
//		HttpSession session = request.getSession();
//		String userName = (String) session.getAttribute("username");
//		commandeService.createCommande(userName);
		//commandeService.save(commandeUni);
//		ShoppingCart sh = new ShoppingCart();
//		sh.setCommande(shoppingCart);
//		
//		commandeService.save(sh.setCommande(shoppingCart))
//		commandeService.save((Commande) shoppingCart.getCommandeUni());
		//model.addAttribute("commande", commandeUni);
		return "redirect:/commande/allUser";

	}
	
	
	 

	@RequestMapping(value = "/update/{commandeId}", method = RequestMethod.GET)
	public String update(@PathVariable("commandeId") String commandeId, ModelMap model){
		Commande c = commandeService.findById(commandeId);
		if(c!=null){
			model.addAttribute("command", c);
			return "commande/update";
		}else{//normalement erreur
			return "redirect:/commande/all";
		}
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute Commande c, BindingResult result) {
		String idAvant = c.get_id();
	//	c = commandeService.save(c);
		String idapres = c.get_id();
		logger.info("updated before "+(idAvant));
		logger.info("updated after ? "+(idapres));
		logger.info("updated ok ? "+(idapres==idAvant));
		return "redirect:/commande/show/"+c.get_id();
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

		
		model.addAttribute("commandes",
				commandeService.findCommandesEntries(firstResult, sizeNo));
		float nrOfPages = (float) commandeService.countAllAccounts() / sizeNo;
		model.addAttribute(
				"maxPages",
				(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1
						: nrOfPages));

		return "commande/all";
	}

	/*
	 * pageable
	 */
	@RequestMapping(value = "/findByEtat/{commandeEtat}", method = RequestMethod.GET)
	public String findById(@PathVariable("commandeEtat") String commandeEtat,
			ModelMap model) {
		List<Commande> cs = commandeService.findByEtat(commandeEtat);
		logger.info("found = "+((cs!=null)&&(!cs.isEmpty())));
		model.addAttribute("commandes", cs);
		return "commande/commandesSearchResults";
	}
	/*
	 * pageable
	 */
//	@RequestMapping(value = "/findByCategory/{category}", method = RequestMethod.GET)
//	public String findByCategory(@PathVariable("category") String category,
//			ModelMap model) {
//		List<Product> ps = productService.findByCategory(category);
//		logger.info("found");
//		model.addAttribute("products", ps);
//		return "product/productsSearchResults";
//	}
	
	@RequestMapping(value = "/show/{commandeId}", method = RequestMethod.GET)
	public String show(@PathVariable("commandeId") String commandeId,
			ModelMap model) {
		Commande c = commandeService.findById(commandeId);
		logger.info("found");
		model.addAttribute("commande", c);
		return "commande/detail";
	}
	@RequestMapping(value = "/delete/{commandeId}", method = RequestMethod.GET)
	public String delete(@PathVariable("commandeId") String commandeId, ModelMap model,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size) {
		commandeService.deleteById(commandeId);
		model.put("page", page);
		model.put("size", size);
		return "redirect:/commande/all";
	}
}
