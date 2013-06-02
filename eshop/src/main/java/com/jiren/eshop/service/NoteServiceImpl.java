package com.jiren.eshop.service;

import static org.springframework.data.mongodb.core.query.Criteria.where;


import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiren.eshop.dao.NoteRepository;
import com.jiren.eshop.domain.Note;
import com.jiren.eshop.domain.Product;
import com.jiren.eshop.domain.User;

@Service
@Transactional
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteRepository  noteRepository;
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public List<Note> getAll() {
		List<Note> comments = noteRepository.findAll();
		return comments;
	}

	public Note get(String id) {
		Note comment = noteRepository.findOne(id);
		return comment;
	}

	public Boolean add(Note note) {
		try {
			if(note.get_id()==null || note.get_id().length()==0)
				note.set_id(UUID.randomUUID().toString());
			noteRepository.save(note);
		   return true;
		  } catch (Exception e) {
			  e.printStackTrace();
			  return false;
		  }
	}

	public List<Note> get(Product product) {
		Query query = new Query(where("product.$id").is(product.get_id()));
		List<Note> comments = mongoTemplate.find(query, Note.class);
		return comments;
	}
	
	public List<Note> get(User user) {
		Query query = new Query(where("user.$id").is(user.get_id()));
		List<Note> comments = mongoTemplate.find(query, Note.class);
		return comments;
	}
	
}
