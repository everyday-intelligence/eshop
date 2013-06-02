package com.jiren.eshop.service;

import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ProductSearch;
import com.jiren.eshop.domain.User;

public interface ProductService {
 

	public List<Product> findAllProducts();
	public List<Product> findProductsEntries(int firstResult, int maxResults);
	public Product save(Product p);
	public Product findById(String productId);
	public float countAllAccounts();
	public List<Product> findByName(String productName);
	public List<Product> findByNameAndCateory(String productName,String category);
	public List<Product> findByCategory(String category);
	public void delete(Product product);
	public void deleteById(String productId);
	//public List<Product> findProducts(ProductSearch criteria);
	//List<Product> findProducts(Product name);
	List<Product> findProducts(String productName);
	public void updateProduct(Product product);
	 //public List<Product> search(String searchTerm);
	 public List<Product> searchByCriteria(Product criteria);
	 
	 List<Product> findProductsByVendeur(User user);

}
