package com.sportyshoes.controller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportyshoes.controller.entities.Admin;
import com.sportyshoes.controller.entities.Product;
import com.sportyshoes.controller.repo.AdminRepo;

@Service
public class AdminDao {

	@Autowired
	AdminRepo repo;
	
	public Admin getById(int id) {
		return repo.findById(id).orElse(null);
	}
	public Admin findByEmail(String email) {
		return repo.findByEmail(email);
	}
	public Admin updatePassword(String email,String password) {
		Admin exists = repo.findByEmail(email);
		exists.setPassword(password);
		return repo.save(exists);
	}	
}
