package com.jiren.eshop.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.jiren.eshop.domain.Commande;
import com.jiren.eshop.domain.CommandeUnitaire;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.service.ProductService;

@SuppressWarnings("unused")
@RequestMapping("/uploadphototest/**")
@Controller

public class UploadPhotoTest {
	private static final Logger logger = LoggerFactory.getLogger(UploadPhotoTest.class);
	
	@RequestMapping
	public String index(){
		return "product/uploadphototest";
	}
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public String handleFormUpload(Model model,@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				
				System.out.println(bytes.length+" octets");
		     String name=file.getOriginalFilename();
		 
				model.addAttribute("files",name);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:uploadphototest";
		} else {
			return "redirect:uploadFailure";
		}
	}
}
