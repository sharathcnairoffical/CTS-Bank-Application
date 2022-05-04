package com.cognizant.customer.model;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Account {
	
	private long accountId;

	private String customerId;


	private double currentBalance;

	private String accountType;

	private String ownerName;

	@Transient
	private List<Transaction> transactions = new ArrayList<>();


}