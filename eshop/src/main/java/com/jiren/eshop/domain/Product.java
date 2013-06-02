package com.jiren.eshop.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import com.mongodb.gridfs.GridFS;

@Document
@TypeAlias("Product")
public class Product {

	@Id
	private String _id;
	private Category category;
	private float price;
	private String name;
	private String couleur;
	private String description;
	private  GridFS images;
	@DBRef
	private User vendeur;
	//private String currentProfilePhotos;
    private List<String> photos;
	
	public User getVendeur() {
		return vendeur;
	}


	public void setVendeur(User vendeur) {
		this.vendeur = vendeur;
	}


	//private Map<String, String> description;
    public void addPhoto(String photoURL){
    	if(photos == null){
    		photos = new ArrayList<String>();
    	}
    	photos.add(photoURL);
    }

	
//	public String getCurrentProfilePhotos() {
//		return currentProfilePhotos;
//	}
//	public void setCurrentProfilePhotos(String currentProfilePhotos) {
//		this.currentProfilePhotos = currentProfilePhotos;
//	}
	public List<String> getPhotos() {
		return photos;
	}
	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}

	public String getCouleur() {
		return couleur;
	}
	public GridFS getImages() {
		return images;
	}
	public void setImages(GridFS images) {
		this.images = images;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setCouleur(String couleur) {
		this.couleur = couleur;
	}
	public String getId() {
		return _id;
	}
	public void setId(String _id) {
		this._id = _id;
	}
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((_id == null) ? 0 : _id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (_id == null) {
			if (other._id != null)
				return false;
		} else if (!_id.equals(other._id))
			return false;
		return true;
	}



	
	
}
