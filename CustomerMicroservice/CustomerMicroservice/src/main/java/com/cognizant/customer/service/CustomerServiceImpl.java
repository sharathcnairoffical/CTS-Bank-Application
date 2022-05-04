package com.cognizant.customer.service;

import com.cognizant.customer.exception.AccessDeniedException;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.cognizant.customer.exception.ConsumerAlreadyExistException;
import com.cognizant.customer.exception.ServiceFailException;
import com.cognizant.customer.feign.AccountFeign;
import com.cognizant.customer.feign.AuthorizationFeign;
import com.cognizant.customer.model.Account;
import com.cognizant.customer.model.AppUser;
import com.cognizant.customer.model.AuthenticationResponse;
import com.cognizant.customer.model.CustomerEntity;
import com.cognizant.customer.repository.CustomerRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerServiceImpl implements CustomerService {

	private static final String CUSTOMER = "CUSTOMER";
	@Autowired
	AuthorizationFeign authorizationFeign; 

	@Autowired
	AccountFeign accountFeign;

	@Autowired
	CustomerRepository customerRepo;
//---------------------------------------------------------------------------------------------------------------------------
	@Override
	public CustomerEntity createCustomer(String token, CustomerEntity customer) {

		CustomerEntity checkCustomerExists = getCustomerDetail(token, customer.getUserid());
		if (checkCustomerExists != null) {
			throw new ConsumerAlreadyExistException("Customer already exist");
		} else {
			AppUser user = new AppUser(customer.getUserid(), customer.getUsername(), customer.getPassword(), null,
					CUSTOMER);
			authorizationFeign.createUser(user);
		}
		for (Account acc : customer.getAccounts()) {
			accountFeign.createAccount(token, customer.getUserid(), acc);
		}

		customerRepo.save(customer);
		log.info("Consumer details saved.");
		return customer;
	}

//---------------------------------------------------------------------------------------------------------------------------
	@Override
	public CustomerEntity getCustomerDetail(String token, String id) {
		Optional<CustomerEntity> customer = customerRepo.findById(id);
		if (!customer.isPresent())
			return null;
		log.info("Customer Details Fetched.");
		List<Account> list = accountFeign.getCustomerAccount(token, id);
		customer.get().setAccounts(list);
		return customer.get();
	}

//---------------------------------------------------------------------------------------------------------------------------
	@Override
	public CustomerEntity saveCustomer(String token, CustomerEntity customer) {
		CustomerEntity checkCustomerExists = getCustomerDetail(token, customer.getUserid());
		if (checkCustomerExists == null) {
			AppUser user = new AppUser(customer.getUserid(), customer.getUsername(), customer.getPassword(), null,
					CUSTOMER);
			authorizationFeign.createUser(user);

		}
		return customerRepo.save(customer);
	}

//------------------------------------------------------------------------------------------------------------------------------
	@Override
	public boolean deleteCustomer(String id) {
		CustomerEntity customer = customerRepo.findById(id).get();
		if (customer != null)
			customerRepo.deleteById(id);
		else
			return false;
		log.info("Customer Details Deleted");
		return true;
	}

//------------------------------------------------------------------------------------------------------------------------------
	@Override
	public CustomerEntity updateCustomer(String token, CustomerEntity customer) {
		CustomerEntity toUpdate = customerRepo.findById(customer.getUserid()).get();
		toUpdate.setAccounts(customer.getAccounts());
		for (Account acc : customer.getAccounts()) {
			accountFeign.createAccount(token, customer.getUserid(), acc);
		}
		return customerRepo.save(toUpdate);
	}

//------------------------------------------------------------------------------------------------------------------------------
	@Override
	public AuthenticationResponse hasPermission(String token) {
		return authorizationFeign.getValidity(token);
	}

//------------------------------------------------------------------------------------------------------------------------------
	@Override
	public AuthenticationResponse hasEmployeePermission(String token) {
		AuthenticationResponse validity = authorizationFeign.getValidity(token);
		if (!authorizationFeign.getRole(validity.getUserid()).equals("EMPLOYEE"))
			throw new AccessDeniedException("NOT ALLOWED");
		else
			return validity;
	}

//------------------------------------------------------------------------------------------------------------------------------
	@Override
	public AuthenticationResponse hasCustomerPermission(String token) {
		AuthenticationResponse validity = authorizationFeign.getValidity(token);
		if (!authorizationFeign.getRole(validity.getUserid()).equals(CUSTOMER))
			throw new AccessDeniedException("NOT ALLOWED");
		else
			return validity;
	}
//-------------------------------------------------------------------------------------------------------------------------------
	public CustomerEntity welcomeFallBack(String token, String id) throws ServiceFailException {
		throw new ServiceFailException("server down");
	}

}