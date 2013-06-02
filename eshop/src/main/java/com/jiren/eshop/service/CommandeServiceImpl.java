package com.jiren.eshop.service;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.jiren.eshop.dao.CommandeRepository;

import com.jiren.eshop.dao.CommandeRepositoryImpl;
import com.jiren.eshop.dao.ProductRepository;
import com.jiren.eshop.dao.UserRepository;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;



@Service

@Transactional
public class CommandeServiceImpl implements CommandeService {

	private static final List<Commande> Commande = null;
	@Autowired
	CommandeRepository commandeRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	ProductRepository productRepository;
	@Autowired
    UserService userService;
	@Autowired
	ProductService productService;
	
	 private MailSender mailSender;

	 private SimpleMailMessage templateMessage;
	MongoTemplate mongoTemplate;
	
	 public void setMailSender(MailSender mailSender) {
	        this.mailSender = mailSender;
	    }

	    public void setTemplateMessage(SimpleMailMessage templateMessage) {
	        this.templateMessage = templateMessage;
	    }

	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;}

	@Override
	public float countAllAccounts() {
		 return commandeRepository.count();
	}
	@Override
	public List<Commande> findAllCommandes() {
		return  (List<Commande>) commandeRepository.findAll();
	}
	@Override
	public List<Commande> findCommandesEntries(int firstResult, int maxResults) {
        return commandeRepository.findAll(new PageRequest(firstResult / maxResults, maxResults)).getContent();
	}
	@Override
	public void save(Commande c) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		String formattedDate = dateFormat.format(date);
		c.setDate(formattedDate);
		c.setEtat("Non envoyée");
		commandeRepository.save(c);
		
		  SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);
	        msg.setTo(c.getUser().get(0).getMail());
	        msg.setText(
	            "Dear " + c.getUser().get(0).getName()
	                + c.getUser().get(0).getPrenom()
	                + ", thank you for placing order. Your order number is "
	                + c.get_id());
	        try{
	            this.mailSender.send(msg);
	        }
	        catch(MailException ex) {
	            // simply log it and go on...
	            System.err.println(ex.getMessage());            
	        }
	}

	@Override
	public Commande findById(String commandeId) {
		return commandeRepository.findOne(commandeId);
	}
	@Override
	public List<Commande> findByEtat(String commandeEtat) {
		return commandeRepository.findByEtat(commandeEtat);
	}

	@Override
	public void delete(Commande commande) {
		commandeRepository.delete(commande);
	}
	@Override
	public void deleteById(String commandeId) {
		Commande c = findById(commandeId);
		if(c!=null){
			delete(c);
		}
	}
	@Override
	public void updateCommande(String CommandeId, float somme) {
		Commande c= commandeRepository.findOne(CommandeId);
		commandeRepository.save(c);
		
		
	}
//	@Override
//	public Commande createCommande(String userId) {
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
//		String formattedDate = dateFormat.format(date);
//	
//		Commande commande = new Commande();
////	
////		User customer = this.userService.findById(userId);
////		 commande.setUser((List<User>) customer);
//		 commande.setDate(formattedDate);
//		 commande.setEtat("Non envoyé");
//		
//		  //purchase.setTotal(0);
//		 return  commandeRepository.save(commande);
//		
//	}

	@Override
	public List<Commande> findOrdersByCustomer(User user) {
		return commandeRepository.findOrdersByUser(user);
	}
//	@Override
//	public List<Commande> findOrdersWithVendeur(User vendeur){
//	
//	return commandeRepository.findOrdersBycommandeUni(vendeur);	 
//		
//	}
//
//	@Override
//	public List<CommandeUnitaire> findOrdersBycommandeUni(
//			List<Product> product) {
//		
//		return commandeRepository.findOrdersBycommandeUni(product);
//	}
//



	

		
}
