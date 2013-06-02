package com.jiren.eshop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jiren.eshop.dao.ProductRepository;
import com.jiren.eshop.dao.ProductRepositoryCustom;
import com.jiren.eshop.dao.UserRepository;
import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ProductSearch;
import com.jiren.eshop.domain.User;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;
	@Autowired
	ProductRepositoryCustom productRepositoryCustom;
	@Autowired
	UserRepository userRepository;
	@Autowired
	UserService userService;
	@Override
	public float countAllAccounts() {
		 return productRepository.count();
	}
	@Override
	public List<Product> findAllProducts() {
		return  (List<Product>) productRepository.findAll();
	}
	@Override
	public List<Product> findProductsEntries(int firstResult, int maxResults) {
        return productRepository.findAll(new PageRequest(firstResult / maxResults, maxResults)).getContent();
	}
	@Override
	public Product save(Product p) {
	//	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	  //   String name = user.get_id(); //get logged in username
	     User us = new User();
	     us.getNamee();
		  System.out.println(us.getNamee());
     	//ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    //	HttpSession session = attr.getRequest().getSession();
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     //	String mail = auth.getName();
	     
//		User vendeur= userService.findById(name);
//		  System.out.println(vendeur);
//		
//		  Product p = productService.findById(productId);
//			CommandeUnitaire cu = new CommandeUnitaire(p);
//		  p.setVendeur(vendeur);
		
		return 	productRepository.save(p);
	}

	@Override
	public Product findById(String productId) {
		return productRepository.findOne(productId);
	}
	@Override
	public List<Product> findByName(String productName) {
		return productRepository.findByNameContaining(productName);
	}
	/*
	 * TODO changer avec une requete et like
	 * @see com.jiren.eshop.service.ProductService#findByCategory(java.lang.String)
	 */
	@Override 
	public List<Product> findByCategory(String category) {
		Category c = new Category();
		c.setName(category);
		return productRepository.findByCategory(c);

	}
	@Override
	public void delete(Product product) {
		productRepository.delete(product);
	}
	@Override
	public void deleteById(String productId) {
		Product p = findById(productId);
		System.out.println(p);
		if(p!=null){
			delete(p);
		}
	}
	@Override
	public List<Product> findProducts(String productName) {
		// TODO Auto-generated method stub
		return productRepository.findByNameContaining(productName);
	}
	@Override
	public List<Product> findByNameAndCateory(String productName,String category) {
		Category c = new Category();
		c.setName(category);
		return productRepository.findByNameAndCategory( productName, c);
	}
//	@Override
//	public List<Product> search(String searchTerm) {
//		// TODO Auto-generated method stub
//		return  productRepository.findByName(searchTerm);
//	}
	@Override
	public void updateProduct(Product product) {
		productRepository.save(product);
		
	}
	@Override
	public List<Product> searchByCriteria(Product criteria) {
		return productRepositoryCustom.searchByCriteria(criteria);
	}
	@Override
	public List<Product> findProductsByVendeur(User x) {
		return productRepository.findProductsByVendeur(x);
	}

		
}
