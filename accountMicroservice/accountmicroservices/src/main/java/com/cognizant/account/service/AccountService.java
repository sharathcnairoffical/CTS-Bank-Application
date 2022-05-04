package com.cognizant.account.service;

import java.util.List;

import com.cognizant.account.model.Account;
import com.cognizant.account.model.AccountCreationStatus;
import com.cognizant.account.model.AccountInput;
import com.cognizant.account.model.AuthenticationResponse;
import com.cognizant.account.model.Statement;

public interface AccountService {
	/*
	 * Interface to offer services in Account_ms 
	 */
	 public Account getAccount(long accountId);
	
	 public AccountCreationStatus createAccount(String accountId,Account account);
	
	 public List<Account> getCustomerAccount(String token,String customerId);
	
	 public List<Account> getAllAccounts();
	
	 List<Statement> getAccountStatement(long accountId);
	
	 public Account updateDepositBalance(AccountInput accountInput);
	 
	 public Account updateBalance(AccountInput accountInput);
	 
	 // Authentication Validation
	 public AuthenticationResponse hasPermission(String token);
	 
	 public AuthenticationResponse hasEmployeePermission(String Token);
	 
	 public AuthenticationResponse hasCustomerPermission(String Token);
}
