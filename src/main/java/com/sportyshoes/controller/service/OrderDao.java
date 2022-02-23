package com.sportyshoes.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportyshoes.controller.entities.Cart;
import com.sportyshoes.controller.entities.Orders;
import com.sportyshoes.controller.repo.OrderRepo;

@Service
public class OrderDao {

	@Autowired
	OrderRepo repo;
	
	public Orders getById(int id) {
		return repo.findById(id).orElse(null);
	}

	public List<Orders> getAll(){
		return repo.findAll();
	}

	public Orders insert(Orders s) {
		return repo.save(s);
	}

	public List<Orders> filterByDate(String date){
		return repo.filterByDate(date);
	}
	
	public int getTotalNumberOfOrder() {
		return repo.totalNumberOfOrder();
	}
}
