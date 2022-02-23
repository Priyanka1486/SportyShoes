package com.sportyshoes.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportyshoes.controller.entities.Product;
import com.sportyshoes.controller.entities.User;
import com.sportyshoes.controller.repo.UserRepo;

@Service
public class UserDao {
	@Autowired
	UserRepo repo;
	
	public User getById(int id) {
		return repo.findById(id).orElse(null);
	}

	public List<User> getAll(){
		return repo.findAll();
	}

	public User insert(User s) {
		return repo.save(s);
	}
	public List<User> insertAll(List<User> list){
		return repo.saveAll(list);
	}
	
	public String delete(int id) {
		repo.deleteById(id);
		return "deleted the id value "+id;
	}	
	public User findByName(String name) {
		return repo.findByName(name);
	}
	
	public User findByEmail(String email) {
		return repo.findByEmail(email);
	}

	public List<User> findAllByName(String email) {
		return repo.findAllByName(email);
	}
	
	public int getTotalNumberOfUser() {
		return repo.totalNumberOfUser();
	}

}
