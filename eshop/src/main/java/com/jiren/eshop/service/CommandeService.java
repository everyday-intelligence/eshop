package com.jiren.eshop.service;

import java.util.Collection;
import java.util.List;

import javax.annotation.security.RolesAllowed;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;


public interface CommandeService {
 
	
	public List<Commande> findAllCommandes();
	@RolesAllowed({"ROLE_ADMIN"})
	public List<Commande> findCommandesEntries(int firstResult, int maxResults);
	public void save(Commande c);
	public Commande findById(String CommandeId);
	public float countAllAccounts();
//	public List<Commande> findByName(String productName);
	public List<Commande> findByEtat(String etat);
	public List<Commande> findOrdersByCustomer(User user);
	//public List<Commande> findOrdersWithVendeur(User vendeur);
	public void  delete(Commande commande);
	public void delete(String commandeId);
	public void updateCommande(String CommandeId, float Somme);
	public Commande updateCommande(Commande commande);
	public Commande updateEtat(Commande commande);
	//List<CommandeUnitaire> getAllCMD();
	//public List<CommandeUnitaire> findOrdersBycommandeUni(List<Product> product);


	/////////////////
	//public Commande createCommande(String userId);
	//public    void addProductToCommande(String commandeId, String productId);
   

}
