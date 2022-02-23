package com.sportyshoes.controller.entities;

import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;

@Data
@Entity
public class Orders {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String date;
	
	@Embedded
	private Address addrs;
	
	@OneToMany(mappedBy="orders",fetch=FetchType.EAGER)
	private List<Cart> carts;
	
	private double amount;
	
	@ManyToOne
	private User user;
}
