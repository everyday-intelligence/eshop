package com.jiren.eshop.controller;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.service.ProductService;



@Controller
@RequestMapping(value = "/cart")
@SessionAttributes("shoppingCart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private ProductService productService;

	@ModelAttribute("shoppingCart")
	   public Commande populateCommande() {
	       return new Commande(); // populates form for the first time if its null
	   }

	@RequestMapping(value="/add/{productId}",method=RequestMethod.GET)
	public String add(@ModelAttribute("shoppingCart") Commande shoppingCart,@PathVariable("productId") String productId, ModelMap model) {
		if(shoppingCart==null){
		
			shoppingCart = new Commande();
		}
		Product p = productService.findById(productId);
		CommandeUnitaire cu = new CommandeUnitaire(p);
		shoppingCart.addToCU(cu);
		model.addAttribute("shoppingCart", shoppingCart);
		return "redirect:/product/all";

	}
	@RequestMapping(value="/addP/{productId}",method=RequestMethod.GET)
	public String addP(@ModelAttribute("shoppingCart") Commande shoppingCart,@PathVariable("productId") String productId, ModelMap model) {
		if(shoppingCart==null){
		
			shoppingCart = new Commande();
		}
		Product p = productService.findById(productId);
		CommandeUnitaire cu = new CommandeUnitaire(p);
		shoppingCart.addToCU(cu);
		model.addAttribute("shoppingCart", shoppingCart);
		return "redirect:/cart/all";

	}


	@RequestMapping(value="/remove/{productId}",method=RequestMethod.GET)
	public String remove(@ModelAttribute("shoppingCart") Commande shoppingCart ,@PathVariable("productId") String productId, ModelMap model) {
//		
	Product p = productService.findById(productId);
		CommandeUnitaire cu = new CommandeUnitaire(p);
		shoppingCart.removeCU(cu);
		model.addAttribute("shoppingCart", shoppingCart);
		return "redirect:/cart/all";
		
	}
	@RequestMapping(value="/removeAll/{productId}",method=RequestMethod.GET)
	public String removeAll(@ModelAttribute("shoppingCart") Commande shoppingCart ,@PathVariable("productId") String productId, ModelMap model) {
		Product p = productService.findById(productId);
		CommandeUnitaire cu = new CommandeUnitaire(p);
		shoppingCart.removeAll(cu);
		model.addAttribute("shoppingCart", shoppingCart);
		return "redirect:/cart/all";
		
	}
	
	@RequestMapping(value = "/all")
	public String viewCart(@ModelAttribute("shoppingCart") Commande shoppingCart, ModelMap model){
		model.addAttribute("shoppingCart", shoppingCart);
		return "cart/all";
	}
	  
//		@RequestMapping(value="/add/{productId}", method = RequestMethod.GET)
//		public String addToCart(@PathVariable("productId") String productId, float price, int qte, ModelMap model)  {
//			Product product=this.productService.findById(productId);
//			ShoppingCart cart = new ShoppingCart();
//			cart.addToCart(productId, price, qte);
//			logger.info("Cart: {}",cart);
//			model.addAttribute("product", product);
//			return "redirect:/cart/add";
//	 
//		}
//		
  

}
