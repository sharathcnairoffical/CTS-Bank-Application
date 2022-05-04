package com.cognizant.account.feign;

import java.util.List;

import javax.validation.Valid;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

import com.cognizant.account.model.Account;
import com.cognizant.account.model.AccountInput;
import com.cognizant.account.model.Transaction;
import com.cognizant.account.model.TransactionInput;

//Feign Client to access Transaction Microservices

@FeignClient(name="transaction-ms",url="${feign.url-transaction-microservices}")
public interface TransactionFeignClient {
	
	@PostMapping("/withdraw")  //  need to be checked with tran ms controller
	public boolean makewithdraw(@RequestHeader("Authorization") String token,@Valid @RequestBody AccountInput accountInput);
	
	@PostMapping("/deposit" ) //need to check with with tran ms controller
	public ResponseEntity<?> makedeposit(@RequestHeader("Authorization") String token,@Valid @RequestBody AccountInput accountInput);
	
	@GetMapping(value="/getAllTransByAccId/{id}")
	public List<Transaction> getTransactionByAccId(@RequestHeader("Authorization") String token,@PathVariable("id") long accId);
	
	@PostMapping(value="/accounts", consumes = MediaType.APPLICATION_JSON_VALUE ,produces= MediaType.APPLICATION_JSON_VALUE)
	public Account checkAccountBalance(@Valid @RequestBody AccountInput accountInput);

	@PostMapping(value="/transactions")
	public Boolean maketransfer(@RequestHeader("Authorization") String token,@Valid @RequestBody TransactionInput transactionInput);
	
	@PostMapping(value="/servicecharge")
	public boolean makeServiceCharges(@RequestHeader("Authorization") String token,@Valid @RequestBody AccountInput accountInput);





}
