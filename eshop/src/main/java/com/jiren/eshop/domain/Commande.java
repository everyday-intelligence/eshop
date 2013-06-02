package com.jiren.eshop.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
@TypeAlias("Commande")
public class Commande {
	
	@Id
	private String _id;
	@DBRef
	private List<User> user;
	private List <CommandeUnitaire>  commandeUni = new ArrayList<CommandeUnitaire>();
//	private int qte;
	private String date;
	private String etat;

	
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public List<User> getUser() {
		return user;
	}
	public void setUser(List<User> us) {
		this.user = us;
	}
	

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public List<CommandeUnitaire> getCommandeUni() {
		return commandeUni;
	}
	public void setCommandeUni(List<CommandeUnitaire> commandeUni) {
		this.commandeUni = commandeUni;
	}
	
	
	public void addToCU(CommandeUnitaire cu){
		boolean trouve = false;
		int i = 0;
	
		while (!trouve && i <commandeUni.size()) {
			if(commandeUni.get(i).getProduct().equals(cu.getProduct())){
				commandeUni.get(i).setQte(commandeUni.get(i).getQte()+cu.getQte());
				System.out.println("prod existant dans panier");
				trouve = true;
			}
			i++;
		}
		if(!trouve){
			commandeUni.add(cu);
			System.out.println("prod non existant dans panier");
		}
	}
	
	

	
	
	
	public void removeCU(CommandeUnitaire cu){
		boolean trouve = false;
		int i = 0;
	
		while (!trouve && i <commandeUni.size()) {

			if(commandeUni.get(i).getProduct().equals(cu.getProduct())&commandeUni.get(i).getQte()>= cu.getQte()){
				commandeUni.get(i).setQte((commandeUni.get(i).getQte()-cu.getQte()));
			
				trouve = true;
			}
			if(commandeUni.get(i).getQte()==0){
				//commandeUni.remove(commandeUni.get(i).getProduct());
				System.out.println("index "+commandeUni.indexOf(cu));
				commandeUni.remove(commandeUni.indexOf(cu));
			}
			System.out.println(cu.getQte());
			System.out.println("supp"+i);
		
			i++;
		}
	}
	public void removeAll(CommandeUnitaire cu) {
		
	
			commandeUni.remove(cu);
			System.out.println("prod supprimer");
			
	}
	
	public float getTotal() {

		float total =0;

		for (CommandeUnitaire cmdU : commandeUni) {
			total= total+=cmdU.getPrice()*cmdU.getQte();
		}

		return total;
	}
	
	public float getTotalTTC() {

		float totalTTC =0;

		for (CommandeUnitaire cmdU : commandeUni) {
			totalTTC= totalTTC+=getTotal()+((getTotal()*18)/100);
		}

		return totalTTC;
	}
	
}
