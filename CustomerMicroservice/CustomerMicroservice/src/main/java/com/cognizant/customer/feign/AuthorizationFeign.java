package com.cognizant.customer.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

import com.cognizant.customer.model.AppUser;
import com.cognizant.customer.model.AuthenticationResponse;



@FeignClient(name = "auth-service", url = "${feign.url-auth-service}")
@Component
public interface AuthorizationFeign {

	// Create Consumer
	@PostMapping(value = "/createUser")
	public ResponseEntity<?> createUser(@RequestBody AppUser appUserCredentials);

	// Customer login
	@PostMapping(value = "/login")
	public ResponseEntity<?> login(@RequestBody AppUser appUserloginCredentials);
	
	/*
	 * Calling method of authentication  microservice to validate token 
	 */
	@GetMapping(value = "/validateToken")
	public AuthenticationResponse getValidity(@RequestHeader("Authorization") String token);
	
	/*
	 * Calling method of authentication  microservice to get role
	 */
	@GetMapping("/role/{id}")
	public String getRole(@PathVariable("id") String id);

}