package com.cognizant.customer.repository;

import org.springframework.data.repository.CrudRepository;

import com.cognizant.customer.model.CustomerEntity;

public interface CustomerRepository extends CrudRepository<CustomerEntity, String> {

	

}
