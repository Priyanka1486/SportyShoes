package com.sportyshoes.controller.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.sportyshoes.controller.entities.User;

public interface UserRepo extends JpaRepository<User,Integer>{
	@Query("select user from User user where user.firstName=?1")
	public User findByName(String name);	

	@Query("select user from User user where user.email=?1")
	public User findByEmail(String email);	

	@Query("select user from User user where user.firstName in ?1")
	public List<User> findAllByName(String name);	

	@Query("select count(*) from User user")
	public int totalNumberOfUser();

}
