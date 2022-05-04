package com.cognizant.account.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Transaction {

	//Class from Transaction Microservices for mapping entity in Controller---->withdraw & deposit
	
	private long id;
	private long sourceAccountId;
	private String sourceOwnerName;
	private long targetAccountId;
	private String targetOwnerName;
	private double amount;
	private LocalDateTime initiationDate;
	private String reference;
}
