package com.sportyshoes.controller.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sportyshoes.controller.entities.Product;
import com.sportyshoes.controller.repo.ProductRepo;

@Service
public class ProductDao {

	@Autowired
	ProductRepo repo;
	
	public Product getById(int id) {
		return repo.findById(id).orElse(null);
	}

	public List<Product> getAll(){
		return repo.findAll();
	}

	public Product insert(Product s) {
		return repo.save(s);
	}
	public List<Product> insertAll(List<Product> list){
		return repo.saveAll(list);
	}
	
	public String delete(int id) {
		repo.deleteById(id);
		return "deleted the id value "+id;
	}	
	
	public Product update(Product s) {
		Product exists = repo.findById(s.getId()).orElse(null);
		exists.setName(s.getName());
		return repo.save(exists);
	}
	
	public Product updateToQuantity(int quantity,int id) {
		Product exists = repo.findById(id).orElse(null);
		int q = exists.getQuantity();
		exists.setQuantity(quantity+q);
		return repo.save(exists);
	}

	public Product updateQuantity(int id,int quantity) {
		Product exists = repo.findById(id).orElse(null);
		int q = exists.getQuantity();
		exists.setQuantity(q - quantity);
		return repo.save(exists);
	}

	public Product findByName(String name) {
		return repo.findByName(name);
	}
}
