package com.cognizant.bankmvc.model;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

//import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
//@AllArgsConstructor
public class CustomerEntity {
	
	private String userid;
	
	private String username;
	
	private String password;
	
	private Date dateOfBirth;
	
	private String pan;
	
	private String address;
	
	private List<Account> accounts = new ArrayList<Account>();

	public CustomerEntity(String username, String password, Date dateOfBirth, String pan, String address,
			List<Account> accounts) {
		super();
		this.username = username;
		this.password = password;
		this.dateOfBirth = dateOfBirth;
		this.pan = pan;
		this.address = address;
		this.accounts = accounts;
	}
	
}
