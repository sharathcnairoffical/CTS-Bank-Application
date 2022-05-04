package com.cognizant.account.controller;


import java.util.List;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import java.util.ArrayList;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.account.exception.MinimumBalanceException;
import com.cognizant.account.feign.TransactionFeignClient;
import com.cognizant.account.model.Account;
import com.cognizant.account.model.AccountCreationStatus;
import com.cognizant.account.model.AccountInput;
import com.cognizant.account.model.Transaction;
import com.cognizant.account.model.TransactionInput;
import com.cognizant.account.service.AccountServiceImpl;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AccountController {

	//private static final Logger log=LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	AccountServiceImpl accountServiceImpl; //service 
	
	@Autowired
	TransactionFeignClient transactionFeignClient; //transaction feign
	
	//---------------------------------------------------------------------------------------------------------------------
	

//------------------------------------------------------------------------------------------------------------------------
	/* 
	 * Getting the Acc Details based on Id! 
	 */
	@GetMapping("/getAccount/{accountId}")
	public ResponseEntity<Account> getAccount(@RequestHeader("Authorization") String token,@PathVariable long accountId){
		accountServiceImpl.hasPermission(token);
		Account accountReturn = accountServiceImpl.getAccount(accountId);
		log.info("Account Details Fetched Successfully");
		return new ResponseEntity<>(accountReturn,HttpStatus.OK);
	}
//------------------------------------------------------------------------------------------------------------------------	
		/* 
		 * Getting All Acc Details! 
		 */
		@GetMapping("/find")
		public ResponseEntity<List<Account>> getAllAccount(@RequestHeader("Authorization") String token){
			accountServiceImpl.hasPermission(token);
			List<Account> accountReturn = accountServiceImpl.getAllAccounts();
			log.info("Account Details Fetched Successfully");
			return new ResponseEntity<>(accountReturn,HttpStatus.OK);
		}	
//------------------------------------------------------------------------------------------------------------------------
	/* 
	 * Create a new Account for an existing Customer!
	 * This will be called by Customer Microservices!
	 */
	@PostMapping("/createAccount/{customerId}")
	public ResponseEntity<?> createAccount(@RequestHeader("Authorization") String token,@PathVariable String customerId,@Valid @RequestBody Account account){
		accountServiceImpl.hasEmployeePermission(token);
		AccountCreationStatus  returnAccountstatus = accountServiceImpl.createAccount(customerId, account);
		if(returnAccountstatus == null) {
			log.error("Customer Creation UnSuccessful");
			return new ResponseEntity<>("Customer Creation UnSuccessful",HttpStatus.NOT_ACCEPTABLE);
		}
		log.info("Account Created Successful");
		return new  ResponseEntity<>(returnAccountstatus,HttpStatus.CREATED);
	}
//------------------------------------------------------------------------------------------------------------------------
	/* 
	 * Deposit amount in Account!
	 * This will be called by Bank MVC and Calls the Controller of transaction Microservices!
	 */
	@PostMapping("/deposit") 
	public ResponseEntity<Account> deposit(@RequestHeader("Authorization") String token,@RequestBody AccountInput accInput){
		accountServiceImpl.hasPermission(token);
		transactionFeignClient.makedeposit(token, accInput);
		Account updateAccBal=accountServiceImpl.updateDepositBalance(accInput);
		List<Transaction> list=transactionFeignClient.getTransactionByAccId(token, accInput.getAccountId());
		updateAccBal.setTransactions(list);
		log.info("Amount Deposited");
		return new ResponseEntity<>(updateAccBal,HttpStatus.OK);
	}

//------------------------------------------------------------------------------------------------------------------------
	/* To Withdraw cash from the account
	 * This will be called by Bank MVC and Calls the Controller of transaction Microservices!
	 */
	@PostMapping("/withdraw")
	public ResponseEntity<Account> withdraw(@RequestHeader("Authorization") String token,@RequestBody AccountInput accInput){
		accountServiceImpl.hasPermission(token);
		try {
			transactionFeignClient.makewithdraw(token, accInput); 
		}catch(Exception e) {
			throw new MinimumBalanceException("Minimum Balance of 1000 should be maintained");
		}
		Account updateAccBal=accountServiceImpl.updateBalance(accInput);
		List<Transaction> list=transactionFeignClient.getTransactionByAccId(token, accInput.getAccountId());
		updateAccBal.setTransactions(list);
		log.info("Amount Withdraw Successfully");
		return new ResponseEntity<>(updateAccBal,HttpStatus.OK);
	}
//------------------------------------------------------------------------------------------------------------------------	
	/*
	 * To deduct service charge on not Mainitaining minimum Balance account
	 */
	@PostMapping("/servicecharge") 
	public ResponseEntity<Account> servicecharge(@RequestHeader("Authorization") String token,@RequestBody AccountInput accInput){
		accountServiceImpl.hasPermission(token);
		try {
			transactionFeignClient.makeServiceCharges(token, accInput);
		} catch(Exception e) {
			throw new MinimumBalanceException("Minimum Balance of 1000 should be maintained");
		}
		
		Account newUpdateAccBal= accountServiceImpl.updateBalance(accInput);
		List<Transaction> list=transactionFeignClient.getTransactionByAccId(token, accInput.getAccountId());
		newUpdateAccBal.setTransactions(list);
		log.info("Service Charge deducted Sucessfully");
		return new ResponseEntity<>(newUpdateAccBal,HttpStatus.OK);
	}
//------------------------------------------------------------------------------------------------------------------------
	/*
	 * To fetch the CustomerAccount details  
	 */
	@GetMapping("/getAccounts/{customerId}")
	public ResponseEntity<List<Account>> getCustomerAccount(@RequestHeader("Authorization") String token, @PathVariable String customerId){
		accountServiceImpl.hasPermission(token);
		log.info("Account List");
		return new ResponseEntity<>(accountServiceImpl.getCustomerAccount(token, customerId),HttpStatus.OK);
	}
	
//------------------------------------------------------------------------------------------------------------------------	
	/*
	 * To check the Balance of an Account
	 * This  method is created in Account Microservies and will by called by the client
	 */
	@PostMapping("/checkBalance")
	public ResponseEntity<Account> checkAccountBalance(@RequestHeader("Authorization") String token,@Valid @RequestBody AccountInput accInput){
		accountServiceImpl.hasPermission(token);
		Account account=accountServiceImpl.getAccount(accInput.getAccountId());
		return new ResponseEntity<>(account,HttpStatus.OK);
	}

//------------------------------------------------------------------------------------------------------------------------	
	
	/*
	 * To Transfer money from souce to Destination Bank Account
	 * This endpoint is called in Account ms which will fetch transac. id from Transaction Ms.
	 */
	@PostMapping("/transaction")
	public ResponseEntity<String> transaction(@RequestHeader("Authorization") String token,@RequestBody TransactionInput transInput){
		accountServiceImpl.hasPermission(token);
		boolean status = true;
		try {
			status=transactionFeignClient.maketransfer(token, transInput); //return boolean
		}catch(Exception e) {
			throw new MinimumBalanceException("Insufficient Balance in Account");	
		}
		if(status==false) {
			return new ResponseEntity<>("Transaction Failed",HttpStatus.NOT_IMPLEMENTED);
		}
		Account updateSourceAccBal = accountServiceImpl.updateBalance(transInput.getSourceAccount());
		List<Transaction> sourcelist = transactionFeignClient.getTransactionByAccId(token, transInput.getSourceAccount().getAccountId());
		updateSourceAccBal.setTransactions(sourcelist);
		
		Account updateTargetAccBal = accountServiceImpl.updateDepositBalance(transInput.getTargetAccount());
		List<Transaction> targetlist = transactionFeignClient.getTransactionByAccId(token, transInput.getTargetAccount().getAccountId());
		updateTargetAccBal.setTransactions(targetlist);
		return new ResponseEntity<>("Transaction Made Successfully from source AccId"+ transInput.getSourceAccount().getAccountId() + "To Target Account" + transInput.getTargetAccount().getAccountId()+ " ", HttpStatus.OK);	
	}
//----------------------------------------------------------------------------------------------------------------------------
	
	
	
}