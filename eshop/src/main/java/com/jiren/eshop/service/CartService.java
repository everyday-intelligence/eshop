package com.jiren.eshop.service;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.ShoppingCart;


public interface CartService {
	ShoppingCart getShoppingCart();
	void addItem(Product product, int quantity);
	
}
