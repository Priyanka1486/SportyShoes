package com.sportyshoes.controller.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sportyshoes.controller.entities.Product;

public interface ProductRepo extends JpaRepository<Product,Integer>{

	@Query("select product from Product product where product.name=?1")
	public Product findByName(String name);
}
