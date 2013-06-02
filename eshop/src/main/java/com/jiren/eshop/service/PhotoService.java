package com.jiren.eshop.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jiren.eshop.domain.Product;

@Service
public interface PhotoService {
 
	public String savePhoto(MultipartFile file,Product product);
	
	

}
