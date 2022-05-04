package com.cognizant.customer.controller;

import java.net.BindException;
import java.time.DateTimeException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.customer.feign.AuthorizationFeign;
import com.cognizant.customer.model.CustomerEntity;
import com.cognizant.customer.model.MessageDetails;
import com.cognizant.customer.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CustomerController { // /customer endpoint

	@Autowired
	private CustomerService customerService; // customer interface

	@Autowired
	AuthorizationFeign authorizationFeign; // auth feign
	
	@Autowired
	MessageDetails messageDetails; //object from model package
//-----------------------------------------------------------------------------------------------------------------------------------------
	@PostMapping("/createCustomer")
	public ResponseEntity<?> createCustomer(@RequestHeader("Authorization") String token,
			@Valid @RequestBody CustomerEntity customer, BindingResult bindingResult)
			throws DateTimeException, BindException {
		if (bindingResult.hasErrors()) {
			throw new BindException(); 
		}
		customerService.hasEmployeePermission(token);
		CustomerEntity customerEntity = customerService.createCustomer(token, customer);
		if (customerEntity != null)
			return new ResponseEntity<>(customerEntity, HttpStatus.CREATED);
		else
			return new ResponseEntity<>("Customer Creation is UNSUCCESSFUL", HttpStatus.NOT_ACCEPTABLE);

	}
//-----------------------------------------------------------------------------------------------------------------------------------------
	@GetMapping("/getCustomerDetails/{id}")
	public ResponseEntity<?> getCustomerDetails(@RequestHeader("Authorization") String token, @PathVariable String id) {
		customerService.hasPermission(token);
		CustomerEntity toReturnCustomerDetails = customerService.getCustomerDetail(token, id);
		if (toReturnCustomerDetails == null)
			return new ResponseEntity<>("Customer userid " + id + " Does Not Exist", HttpStatus.NOT_ACCEPTABLE);
		toReturnCustomerDetails.setPassword(null);
		return new ResponseEntity<>(toReturnCustomerDetails, HttpStatus.OK);
	}
//-----------------------------------------------------------------------------------------------------------------------------------------
	@PostMapping("/saveCustomer")
	public CustomerEntity saveCustomer(@RequestHeader("Authorization") String token,
			@Valid @RequestBody CustomerEntity customer) {
		customerService.hasPermission(token);
		CustomerEntity customerEntity = customerService.saveCustomer(token, customer);
		if (customerEntity != null)
			return customerEntity;
		else
			return null;
	}
//-----------------------------------------------------------------------------------------------------------------------------------------
	
	@DeleteMapping("/deleteCustomer/{id}")
	public ResponseEntity<?> deleteCustomer(@RequestHeader("Authorization") String token, @PathVariable String id) {
		customerService.hasPermission(token);
		CustomerEntity toReturnCustomerDetails = customerService.getCustomerDetail(token, id);
		if (toReturnCustomerDetails == null)
			return new ResponseEntity<>("Customer Userid " + id + " DOES NOT EXISTS", HttpStatus.NOT_ACCEPTABLE);
		toReturnCustomerDetails.setPassword(null);
		boolean deleteCustomer = customerService.deleteCustomer(id);
		if(deleteCustomer) {
			
			messageDetails.setMessage("CUSTOMER DELETED");
			return new ResponseEntity<>(messageDetails, HttpStatus.OK);			
		}
		return new ResponseEntity<>("Customer Userid " + id + " DOES NOT EXISTS", HttpStatus.NOT_ACCEPTABLE);
	}

//-----------------------------------------------------------------------------------------------------------------------------------------
	@PostMapping("/updateCustomer")
	public CustomerEntity updateCustomer(@RequestHeader("Authorization") String token,
			@Valid @RequestBody CustomerEntity customer) {
		customerService.hasEmployeePermission(token);
		return customerService.updateCustomer(token, customer);
	}
	
	@GetMapping("/check")
	public String checkAccessWWithoutValidation(@RequestHeader("Authorization") String token) {
		customerService.hasEmployeePermission(token);
		return "Your Token is valid";
	}


}
