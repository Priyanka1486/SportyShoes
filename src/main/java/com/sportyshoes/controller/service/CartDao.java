package com.sportyshoes.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sportyshoes.controller.entities.Cart;
import com.sportyshoes.controller.repo.CartRepo;

@Service
public class CartDao {

	@Autowired
	CartRepo repo;
	
	public Cart getById(int id) {
		return repo.findById(id).orElse(null);
	}

	public List<Cart> getAll(){
		return repo.findAll();
	}

	public Cart insert(Cart s) {
		return repo.save(s);
	}
}
