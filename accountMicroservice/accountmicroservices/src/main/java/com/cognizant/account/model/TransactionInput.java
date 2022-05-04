package com.cognizant.account.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TransactionInput {
	
	/*
	 * Class used for inputing 2 Account info during transfering amount
	 */
	private AccountInput sourceAccount;
	private AccountInput targetAccount;
	@Positive(message="Transfer amount should be positive")
	@Min(value=1,message="Amount must be larger tham 10")
	private double amount;
	private String reference;
}
