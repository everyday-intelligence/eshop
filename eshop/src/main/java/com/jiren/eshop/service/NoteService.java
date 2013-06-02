package com.jiren.eshop.service;

import java.util.List;

import com.jiren.eshop.domain.Note;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;

public interface NoteService {

	List<Note> getAll();
	Note get(String id );
	Boolean add(Note note);
	List<Note> get(Product product);
	List<Note> get(User user);
}
