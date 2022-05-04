package com.cognizant.account.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.account.exception.AccessDeniedException;
import com.cognizant.account.exception.AccountNotFoundException;
import com.cognizant.account.feign.AuthenticationFeignClient;
import com.cognizant.account.model.Account;
import com.cognizant.account.model.AccountCreationStatus;
import com.cognizant.account.model.AccountInput;
import com.cognizant.account.model.AuthenticationResponse;
import com.cognizant.account.model.Statement;
import com.cognizant.account.repository.AccountRepository;
import com.cognizant.account.repository.StatementRepository;

@Service
public class AccountServiceImpl implements AccountService { //Account Interface

	private static final Logger log = LoggerFactory.getLogger(AccountServiceImpl.class);
	
	 //Autowiring the Repository 
	@Autowired
	AccountRepository accountRepository; 
	StatementRepository statementRepository;
	
	//Autowiring the Feign Client to communicate with auth microservices 
	@Autowired
	AuthenticationFeignClient authFeignClient;
		
	
	/*
	 * Getting the account details based on  accountId
	 */
	@Override
	public Account getAccount(long accountId) {
		Account account =accountRepository.findByAccountId(accountId);
		if(account==null) {
			log.info("Account do not Exist");
			throw new AccountNotFoundException("Account does not Exist");
		}
		return account;	
	}

	/*
	 *  creating the customer bank account and storing in database
	 */
	@Override
	public AccountCreationStatus createAccount(String accountId, Account account) {
		accountRepository.save(account);
		AccountCreationStatus accountCreationStatus = new AccountCreationStatus(account.getAccountId(),"Account Successfully Created");
		log.info("Account Successfully Created");
		return accountCreationStatus;
	}
	
	/*
	 * Fetching Account Details for a Customer
	 */
	@Override
	public List<Account> getCustomerAccount(String token, String customerId) {
		List<Account> account = accountRepository.findByCustomerId(customerId);
		return account;
		}
	
	/*
	 * Fetching AllAccount Details 
	 */
	@Override
	public List<Account> getAllAccounts() {
		List<Account> accounts = accountRepository.findAll();
		log.info("Listing All Accounts");
		return accounts;
	}
	
	/*
	 * Fetching Account Statements 
	 */
	@Override
	public List<Statement> getAccountStatement(long accountId) {
		List<Statement> statement = statementRepository.findStatementByAccountId(accountId);
		return statement;
	}

	/*
	 * Method to update Balance on Deposit
	 */
	@Override
	public Account updateDepositBalance(AccountInput accInput) {
		Account dupdateacc=accountRepository.findByAccountId(accInput.getAccountId());
		dupdateacc.setCurrentBalance(dupdateacc.getCurrentBalance()+accInput.getAmount());
		log.info("Balance Update to account after deposit"+accInput.getAccountId());
		return accountRepository.save(dupdateacc);
	}
	
	/*
	 * Method to update Balance after withdraw
	 */
	@Override
	public Account updateBalance(AccountInput accInput) {
		Account wupdateacc=accountRepository.findByAccountId(accInput.getAccountId());
		wupdateacc.setCurrentBalance(wupdateacc.getCurrentBalance() - accInput.getAmount());
		return accountRepository.save(wupdateacc);
	}

	
	/*
	 * Validating the token using auth microservice 
	 */
	@Override
	public AuthenticationResponse hasPermission(String token) {
		return authFeignClient.getValidity(token);
	}
	
	/*
	 * Validating the token using auth microservice 
	 * Checking for Employee Permission
	 */
	@Override
	public AuthenticationResponse hasEmployeePermission(String Token) {
		AuthenticationResponse validity =authFeignClient.getValidity(Token); //validating
		if(!authFeignClient.getRole(validity.getUserid()).equals("EMPLOYEE")) {  
			log.info("Access Denied for Employees");
			throw new AccessDeniedException("Access Restricted! Not Allowed for Employees!");
		}else 
			return validity;
		
	}

	/*
	 * Validating the token using auth microservice 
	 * Checking for Customer Permission
	 */
	@Override
	public AuthenticationResponse hasCustomerPermission(String Token) {
		AuthenticationResponse validity = authFeignClient.getValidity(Token);//validating
		if(!authFeignClient.getRole(validity.getUserid()).equals("CUSTOMER")) {
			log.info("Access Denied for Customers");
			throw new AccessDeniedException("Access Restricted! Not Allowed for Customer!");
		}else 
			return validity;
	}
	
	
	
	
	
}
