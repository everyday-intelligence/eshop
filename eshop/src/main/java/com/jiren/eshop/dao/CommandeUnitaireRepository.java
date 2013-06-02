package com.jiren.eshop.dao;


import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.jiren.eshop.domain.CommandeUnitaire;


@Repository
public interface CommandeUnitaireRepository extends  PagingAndSortingRepository<CommandeUnitaire, String> {

	
	

}
