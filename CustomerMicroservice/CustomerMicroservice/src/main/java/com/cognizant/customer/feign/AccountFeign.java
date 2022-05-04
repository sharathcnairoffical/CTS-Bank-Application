package com.cognizant.customer.feign;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;

import com.cognizant.customer.model.Account;
import com.cognizant.customer.model.AccountCreationStatus;

import io.swagger.v3.oas.annotations.parameters.RequestBody;


@FeignClient(name = "account-ms", url = "${feign.url-account-service}")
public interface AccountFeign {
	
	@PostMapping("/createAccount/{customerId}")
	public AccountCreationStatus createAccount(@RequestHeader("Authorization") String token,
			@PathVariable String customerId, @RequestBody Account account);

	@GetMapping("/getAccounts/{customerId}")
	public List<Account> getCustomerAccount(@RequestHeader("Authorization") String token,
			@PathVariable String customerId);
}
