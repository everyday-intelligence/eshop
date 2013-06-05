package com.jiren.eshop.dao;

import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;
import com.jiren.eshop.service.CommandeService;

@Repository
public interface CommandeRepository  extends PagingAndSortingRepository<Commande, String>   {

	
	public List<Commande> findByEtat(String etat);

	public Commande findBy_id(String commandeId);
	List<Commande> findOrdersByUser(User user);
	List<CommandeUnitaire> findOrdersBycommandeUni(List<Product> product);
	public void delete(Commande c);
	public void delete(String commandeId);
	
	//List<Commande> findOrdersByProduct(List<Product> product);
	
	
	
	

	
}
