package com.cognizant.customer.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AppUser {
	
	@Id
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "userid", length = 20)
	private String userid;
	
	@Column(name = "username", length = 20)
	private String username;
	
	@Column(name = "password")
	private String password;
	
	private String authToken;
	
	private String role;
}