package com.jiren.eshop.dao;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.jiren.eshop.domain.User;

@Repository
public interface UserRepository extends PagingAndSortingRepository<User, String> {

	public List<User> findByNameContaining(String userName);
	public List<User> findBypassword(String password);
	public List<User> findBymail(String mail);
	public User findByMail(String mail);
	public User findBy_id(String userId);

}
