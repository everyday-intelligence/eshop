package com.jiren.eshop.dao;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ProductSearch;
import com.jiren.eshop.domain.User;

@Repository
public interface ProductRepository extends PagingAndSortingRepository<Product, String> {

	public List<Product> findByNameContaining(String productName);
	public List<Product> findByCategory(Category category);
	@Query("{ ?0 : ?1 }")
	List<Product> findByAttributes(String key, String value);
	List<Product> findByName(ProductSearch criteria);
	List<Product> findByNameAndCategory(String productName,Category category);
	//Page<Product> findByTitleLike(String productName, Pageable page);
	Page<Product> findByNameLike(String productName, Pageable page);
	List<Product> findByDescription(String criteria);
	List<Product> findProductsByVendeur(User x);
   

}
