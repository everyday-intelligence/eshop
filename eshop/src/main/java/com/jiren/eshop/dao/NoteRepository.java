package com.jiren.eshop.dao;


import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.jiren.eshop.domain.Note;

@Repository
public interface NoteRepository extends MongoRepository<Note, String> {


}
