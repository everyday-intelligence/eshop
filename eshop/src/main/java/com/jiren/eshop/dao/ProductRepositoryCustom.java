package com.jiren.eshop.dao;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ProductSearch;

@Repository
public interface ProductRepositoryCustom  {

	public List<Product> searchByCriteria(Product criteria);
}
