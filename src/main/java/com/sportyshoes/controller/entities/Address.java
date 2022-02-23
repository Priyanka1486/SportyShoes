package com.sportyshoes.controller.entities;

import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class Address {
	private String society;
	private String city;
	private int pincode;
	private String state;
}
