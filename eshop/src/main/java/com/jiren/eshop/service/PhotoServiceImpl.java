package com.jiren.eshop.service;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jiren.eshop.dao.CommandeRepository;
import com.jiren.eshop.dao.PhotoRepository;
import com.jiren.eshop.dao.ProductRepository;
import com.jiren.eshop.dao.UserRepository;
import com.jiren.eshop.domain.Category;
import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.ShoppingCart;

import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;

@Service

public class PhotoServiceImpl implements PhotoService {

	@Autowired
    PhotoRepository photoRepository;
	@Override
	public String savePhoto(MultipartFile file, Product product) {
		return photoRepository.savePhoto(file,product);
	}

	
		
}
