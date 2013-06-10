package com.jiren.eshop.controller;

import java.io.IOException;

import java.util.LinkedHashMap;

import java.util.Collection;
import java.util.List;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.jiren.eshop.dao.ProductRepository;
import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ProductSearch;
import com.jiren.eshop.domain.User;
import com.jiren.eshop.service.PhotoService;
import com.jiren.eshop.service.ProductService;
import com.jiren.eshop.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
//@SessionAttributes
@RequestMapping(value = "/product")
public class ProductController {
//	ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
//	HttpSession session = attr.getRequest().getSession();
	
	private static final String PRODSNAMES = "product";
	private static final String CATSNAMES = "category";
	
	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private UserService userService;
	@Autowired
	private PhotoService photoService;
	@ModelAttribute
	ProductSearch criteria(){
		return new ProductSearch();
	}
	
//	ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
//    HttpSession session = attr.getRequest().getSession();
	 

	@RequestMapping(value = "/randomProducts/{number}", method = RequestMethod.GET)
	public String createRandom(@PathVariable("number") int number,
			ModelMap model) {
		for (int i = 0; i < number; i++) {
			Product p = new Product();
			p.setName(PRODSNAMES + "_" + i);
			p.setPrice((float) (Math.random() * 1000));
			Category c = new Category();
			int cn = (int) Math.round(Math.random() * 30);
			c.setName(CATSNAMES + "_" + cn);
			p.setCategory(c);
			productService.save(p);
		}
		return "redirect:/product/all";
	}
	
	@RequestMapping(value = "/product",method = RequestMethod.GET, headers = "Accept=text/html")
			public String findMovies(Model model, @RequestParam("q") String query) {
			 Page<Product> products = productRepository.findByNameLike(query, new PageRequest(0,20));
			 model.addAttribute("products", products);
			 model.addAttribute("query", query);
			 return "/product/list";
			}
	@RequestMapping
	public String index(){
		return "product/uploadphototest";
	}
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public String handleFormUpload(Model model,@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				System.out.println(bytes.length+" octets");
				 model.addAttribute("files", file.getContentType());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:product/uploadphototest";
		} else {
			return "redirect:uploadFailure";
		}
	}
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
	// ProductSearch criteria= new ProductSearch();
	// criteria.setName(request.getParameter("name"));
	// String name =request.getParameter("name");
	 String category =request.getParameter("category");
	 if(category!=null){
		 List<Product> ps  =productService.findByCategory(category);
		// List<Product> ps  =productService.findByName(name);
		// List<Product> ps2  =productService.findByCategory(category);
		 model.addAttribute("psSearch",ps);
		// model.addAttribute("psSearch",ps2);
		
	 }
	 return "/product/search";
	}
	
	@RequestMapping(value = "/searchCriteria",method = RequestMethod.GET)
	public String listSearch(Model model, HttpServletRequest request) {
	 Product criteria= new Product();
	criteria.setName(request.getParameter("name"));
	//criteria.setCouleur(request.getParameter("couleur"));
	criteria.setDescription(request.getParameter("description"));
//	String p=request.getParameter("price");
	//float price= Float.parseFloat(p);
	//System.out.println(price);
	//criteria.setPrice(price);
	// String category =request.getParameter("category");
	// Category cat= productService.findByCategory(category);
//	criteria.setCategory(request.getParameter("category"));
	 if(criteria!=null){
	 List<Product> ps2  =productService.searchByCriteria(criteria);
		// List<Product> ps  =productService.findByName(name);
		// List<Product> ps2  =productService.findByCategory(category);
		 model.addAttribute("psSearchCriteria",ps2);
	
	 }
	
	 return "/product/searchCriteria";
	}

//	@RequestMapping(value = "/search",method = RequestMethod.GET)
//	public String listCat(Model model, HttpServletRequest request) {
//	 ProductSearch criteria= new ProductSearch();
//	// criteria.setCategory(request.getParameter("category"));
//	 String cat =request.getParameter("category");
//	 if(cat!=null){
//		 List<Product> ps  =productService.findByCategory(cat);
//		 model.addAttribute("psSearchCat",ps);
//		 System.out.println(ps);
//	 }
//	 return "/product/search";
//	}
	
	
//	@RequestMapping(value = "/search",method = RequestMethod.GET)
//	public String list(Model model, String productName) {
//	List<Product> ps = productService.findByName(productName);
//	model.addAttribute("ps", ps);
//	//return "accountsearch/search";
//	//	model.addAttribute(this.productService.findProducts(criteria));
//		System.out.println(ps);
//	 return "/product/search"; 
//	}
	

	
	@RequestMapping(value = "/new", method = RequestMethod.GET )
	public String create(ModelMap model) {
		Product p = new Product();
		p.setCategory(new Category());

		model.addAttribute("command", p);
		return "product/new";
	}

	
	
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String create(@ModelAttribute Product p, BindingResult result, @RequestParam("file") MultipartFile file) {
		p=productService.save(p);
		String chemin = photoService.savePhoto(file, p);
		p.addPhoto(chemin);
		
		//org.springframework.security.core.userdetails.User springSecurityUser = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      // User employes= (User)userService.findmail(springSecurityUser.getUsername());// Méthode qui va chercher dans la base
       Authentication a = SecurityContextHolder.getContext().getAuthentication();
       String name = a.getName();
       
       System.out.println(name);
	    User us=(User) userService.findBymail2(name);
 
       System.out.println(us);

		p.setVendeur(us);
	
		productService.updateProduct(p);
		
	
		return "redirect:/product/all";
	}

	@RequestMapping(value = "/update/{productId}", method = RequestMethod.GET)
	public String update(@PathVariable("productId") String productId, ModelMap model){
		Product p = productService.findById(productId);
		if(p!=null){
			model.addAttribute("command", p);
			return "product/update";
		}else{//normalement erreur
			return "redirect:/product/all";
		}
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute Product p, BindingResult result) {
		String idAvant = p.get_id();
		p = productService.save(p);
		String idapres = p.get_id();
		logger.info("updated before "+(idAvant));
		logger.info("updated after ? "+(idapres));
		logger.info("updated ok ? "+(idapres==idAvant));
		return "redirect:/product/show/"+p.get_id();
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
	//	System.out.println(session.getAttribute(PRODSNAMES));
		
		model.addAttribute("products",
				productService.findProductsEntries(firstResult, sizeNo));
		float nrOfPages = (float) productService.countAllAccounts() / sizeNo;
		model.addAttribute(
				"maxPages",
				(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1
						: nrOfPages));
		
		
		
		return "product/all";
	}

	/*
	 * pageable
	 */
	@RequestMapping(value = "/findByName/{productName}", method = RequestMethod.GET)
	public String findByName(@PathVariable("productName") String productName,
			ModelMap model) {
		List<Product> ps = productService.findByName(productName);
		
		logger.info("found = "+((ps!=null)&&(!ps.isEmpty())));
		model.addAttribute("products", ps);
		return "product/productsSearchResults";
	}
	

	/*
	 * pageable
	 */
	@RequestMapping(value = "/findByCategory/{category}", method = RequestMethod.GET)
	public String findByCategory(@PathVariable("category") String category,
			ModelMap model) {
		List<Product> ps = productService.findByCategory(category);
		logger.info("found");
		model.addAttribute("products", ps);
		return "product/productsSearchResults";
	}
	
	@RequestMapping(value = "/show/{productId}", method = RequestMethod.GET)
	public String show(@PathVariable("productId") String productId,
			ModelMap model) {
		Product p = productService.findById(productId);
		logger.info("found");
		model.addAttribute("product", p);
		return "product/detail";
	}
		
		@RequestMapping(value = "/showP", method = RequestMethod.GET)
		public String showP( ModelMap model, @RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "size", required = false) Integer size){
			
			Authentication a = SecurityContextHolder.getContext().getAuthentication();
		    String name = a.getName();
		    System.out.println(name);
		    List<User> us=userService.findBymail(name);
			//User u = userService.findById(us.get(0).get_id());
			 List<Product> product = productService.findProductsByVendeur(us.get(0));
				model.addAttribute("products", product);
				model.put("page", page);
				model.put("size", size);
				return "product/detailP";
			}
		
		
		
	
	@RequestMapping(value = "/delete/{productId}", method = RequestMethod.GET)
	public String delete(@PathVariable("productId") String productId, ModelMap model,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size) {
		productService.deleteById(productId);
		model.put("page", page);
		model.put("size", size);
		return "redirect:/product/all";
	}
	
//	@RequestMapping(value="/remove/{productId}",method=RequestMethod.GET)
//	public  ModelAndView removeById(@PathVariable("productId") String productId){
//		productService.deleteById(productId);
//		return new ModelAndView("redirect:/product/all.html");
//		
//	}
	
	@ModelAttribute("searchList")
	public Map<String,String> populateJavaSkillList() {
		
		//Data referencing for java skills list box
		Map<String,String> searchList = new LinkedHashMap<String,String>();
		searchList.put("Informatique et Bureau", "Informatique et Bureau");
		searchList.put("Cuisine et maison", "Cuisine et maison");
		searchList.put("Vetements et chaussures", "Vetements et chaussures");
		
		
		return searchList;
	}
}
