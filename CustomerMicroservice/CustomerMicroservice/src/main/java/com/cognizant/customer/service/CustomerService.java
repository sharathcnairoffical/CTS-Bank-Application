package com.cognizant.customer.service;

import com.cognizant.customer.model.AuthenticationResponse;
import com.cognizant.customer.model.CustomerEntity;

public interface CustomerService {

	/*
	 * Interface to offer services in Customer_ms 
	 */
	public CustomerEntity createCustomer(String token, CustomerEntity customer);

	public CustomerEntity getCustomerDetail(String tokrn, String id);

	public CustomerEntity saveCustomer(String token, CustomerEntity customer);

	public boolean deleteCustomer(String id);

	public CustomerEntity updateCustomer(String token, CustomerEntity customer);
	
	// Authentication Validation
	public AuthenticationResponse hasPermission(String token);

	public AuthenticationResponse hasCustomerPermission(String token);

	public AuthenticationResponse hasEmployeePermission(String token);

}
