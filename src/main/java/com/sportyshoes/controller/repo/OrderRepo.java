package com.sportyshoes.controller.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sportyshoes.controller.entities.Orders;

public interface OrderRepo extends JpaRepository<Orders,Integer>{
	@Query("select orders from Orders orders where orders.date in ?1")
	public List<Orders> filterByDate(String date);

	@Query("select count(*) from Orders orders")
	public int totalNumberOfOrder();
	
}

