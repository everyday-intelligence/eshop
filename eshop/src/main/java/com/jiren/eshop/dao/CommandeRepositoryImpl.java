package com.jiren.eshop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;



@Repository
public  class CommandeRepositoryImpl {
	@Autowired
	MongoTemplate mongoTemplate;

	
	
	public List<Commande> findOrdersByCustomer(User user) {
		Query query = Query.query(Criteria.where("user").is(user));
		return mongoTemplate.find(query, Commande.class);

	}
	
	public List<Commande> findOrdersWithVendeur(User vendeur) {
	// Where the lines matches the provided product
		Query query1 = Query.query(Criteria.where("vendeur").is(vendeur));
		return mongoTemplate.find(query1, Commande.class);
	
	}
	public List<Commande> findOrdersBycommandeUni(List<Product> product){
		Query query = Query.query(Criteria.where("commandeUni.product").is(product));
		return mongoTemplate.find(query, Commande.class);
	     
	}

	

	

	
}
