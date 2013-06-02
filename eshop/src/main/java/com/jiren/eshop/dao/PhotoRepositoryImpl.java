package com.jiren.eshop.dao;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import com.jiren.eshop.domain.Product;


@Repository
public class PhotoRepositoryImpl implements PhotoRepository{

	@Autowired
	ServletContext servletContext;
	@Override
	public String savePhoto(MultipartFile file, Product p) {
		 if (!file.isEmpty()) {
        	 try {
				BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
				//File dir = new File(servletContext.getRealPath("")+"/images/"+p.getId());
				File dir = new File("D:\\PFEING\\springsource\\vfabric-tc-server-developer-2.7.2.RELEASE\\myimages\\"+p.getId());
				 if(!dir.exists()) {
			            dir.mkdirs();
			      }
				String photoFileName = new Date().getTime()+"";
				File destination = new File(dir.getAbsolutePath()+"/"+photoFileName);
				 boolean saveIsOK = ImageIO.write(src, "jpg", destination);
				 if(saveIsOK){
					 return photoFileName;
				 }
				 //Save the id you have used to create the file name in the DB. You can retrieve the image in future with the ID.
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return null;
	}

	

}
