package com.jiren.eshop.dao;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import com.jiren.eshop.domain.Product;


@Repository
public interface PhotoRepository {

	public String savePhoto(MultipartFile file,Product p);

}
