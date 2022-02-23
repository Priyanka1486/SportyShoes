package com.sportyshoes.controller.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sportyshoes.controller.entities.Category;

public interface CategoryRepo extends JpaRepository<Category,Integer>{ 
	@Query("select category from Category category where category.name=?1")
	public Category findByName(String name);
}
