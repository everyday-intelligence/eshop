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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	        msg.setTo(c.getUser().getMail());
	        msg.setText(
	            "Dear " + c.getUser().getName()
	                + c.getUser().getPrenom()
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
		return commandeRepository.findBy_id(commandeId);
	}
	@Override
	public List<Commande> findByEtat(String commandeEtat) {
		return commandeRepository.findByEtat(commandeEtat);
	}

	@Override
	public void delete(Commande commande) {
			Commande c=commandeRepository.findBy_id(commande.get_id());
		if (c != null) {
		
		System.out.println("testttt");
        userRepository.delete(c.getUser());
			commandeRepository.delete(c);
			
	}
		
	}
	@Override
	public void delete(String commandeId) {
		
			commandeRepository.delete(commandeId);
	
			
		
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

	
	
 
	
	@Override
	public Commande updateCommande(Commande c) {
		Authentication a = SecurityContextHolder.getContext().getAuthentication();
	    String name = a.getName();
	  User vendeurConcerne  = new User(name);
	  String etat="Non envoyée";
	  List<String> st= new ArrayList<String>();
	   List<Commande> commandeNONENVOYE = commandeRepository.findByEtat(etat);
	    for( Commande com :commandeNONENVOYE){
	    	List<User> us1= new ArrayList<User>();
	    	us1.add(com.getUser());
	    	for(User us :us1){
		List<CommandeUnitaire> commUni= c.getCommandeUni();
		 for( CommandeUnitaire cmd :commUni){
			 User vendeur= cmd.getProduct().getVendeur();
			 if(vendeur.equals(vendeurConcerne)){
				 String stat=	cmd.getStatut();
				 
				 if(stat.equals("Non envoyée")){
	         		cmd.setStatut("envoyée"); 
	         	 }
				 System.out.println("statut+++++++++"+cmd.getStatut());
			 }
			 
			
			
		 }
		 
	    	}}
	    
		        return commandeRepository.save(c);
	   
	}

	@Override
	public Commande updateEtat(Commande commande) {
	commande.setEtat("encours");
		return commandeRepository.save(commande);
	}

	


	

		
}
