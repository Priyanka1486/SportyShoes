package com.sportyshoes.controller.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sportyshoes.controller.entities.Cart;

public interface CartRepo extends JpaRepository<Cart,Integer>{

}
