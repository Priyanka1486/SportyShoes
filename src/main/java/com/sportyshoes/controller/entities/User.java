package com.sportyshoes.controller.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;

@Data
@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String firstName;
	private String lastName;
	@Column(unique=true)
	private String email;
	private String password;
	
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Orders> orders;
}
