package com.sportyshoes.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sportyshoes.controller.entities.Category;
import com.sportyshoes.controller.entities.Product;
import com.sportyshoes.controller.repo.CategoryRepo;

@Service
public class CategoryDao {

	@Autowired
	CategoryRepo repo;
	public Category getById(int id) {
		return repo.findById(id).orElse(null);
	}
	
	public Category insert(Category s) {
		return repo.save(s);
	}
	
	public String deleteById(int id) {
		repo.deleteById(id);
		return "deleted the id value "+id;	
	}
	public List<Category> getAll(){
		return repo.findAll();
	}
	public Category findByName(String name) {
		return repo.findByName(name);
	}
}
