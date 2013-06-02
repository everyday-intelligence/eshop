package com.jiren.eshop.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;


@Repository
public class ProductRepositoryImpl implements ProductRepositoryCustom{

	@Autowired
	MongoTemplate mongoTemplate;

	@Override
	public List<Product> searchByCriteria(Product criteria) {
		Query query = new Query();
		  if ( StringUtils.hasText(criteria.get_id())) 
		  { 
		   Criteria c = Criteria.where("id").is(criteria.get_id());
		   query.addCriteria(c);
		  }
		  if (StringUtils.hasText(criteria.getCouleur())) {
		   Criteria c = Criteria.where("couleur").regex(".*" + criteria.getCouleur() + ".*", "i");
		   query.addCriteria(c);
		  }
		  if (StringUtils.hasText(criteria.getDescription())) {
		   Criteria c = Criteria.where("description").regex(".*" + criteria.getDescription() + ".*", "i");
		   query.addCriteria(c);
		  }
		  if (StringUtils.hasText(criteria.getName())) {
		   Criteria c = Criteria.where("name").regex(".*" + criteria.getName() + ".*", "i");
		   query.addCriteria(c);
		    
		  }  
//		  if (StringUtils.hasText(criteria.getName())) {
//		   Criteria c = Criteria.where("category.name").regex(".*" + criteria.getName() + ".*", "i");
//		   query.addCriteria(c);
//		  }
//		  if (Float.valueOf(( criteria.getPrice())) != null) {
//		   Criteria c = Criteria.where("price").is(criteria.getPrice());
//				   //.regex(".*" + criteria.getPrice()+ ".*", "i");
//		   query.addCriteria(c);
//		  }
	  return mongoTemplate.find(query, Product.class);
		 }
		  
	
//	public List<Product> findProductsByVendeur(User vendeur) {
//		Query query = Query.query(Criteria.where("vendeur").is(vendeur));
//		return mongoTemplate.find(query, Product.class);
//
//	}

}
