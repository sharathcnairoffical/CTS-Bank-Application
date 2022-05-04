package com.cognizant.account.model;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class AccountInput {
	@NotNull(message="Account number is mandatory")
	private long accountId;
	
	@NotNull(message="Amount is mandatory")
	private double amount;
}
