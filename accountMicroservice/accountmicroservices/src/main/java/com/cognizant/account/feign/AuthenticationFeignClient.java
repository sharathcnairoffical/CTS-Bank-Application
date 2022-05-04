package com.cognizant.account.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import com.cognizant.account.model.AuthenticationResponse;

//Feign Client to access authentication microservices

@FeignClient(name="auth-ms",url="${feign.url-auth-microservices}")
public interface AuthenticationFeignClient {
	
	/*
	 * Calling method of authentication  microservice to validate token 
	 */
	@GetMapping("/validateToken") // need to be checked with auth endpoint
	public AuthenticationResponse getValidity(@RequestHeader("Authorization") String token); //token  sent to auth microservices for validate
	
	/*
	 * Calling method of authentication  microservice to get role
	 */
	@GetMapping("/role/{id}")  // need to be checked with auth end point
	public String getRole(@PathVariable("id") String id);
}
