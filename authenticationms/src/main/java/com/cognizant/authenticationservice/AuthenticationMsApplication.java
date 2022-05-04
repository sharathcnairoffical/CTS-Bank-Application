package com.cognizant.authenticationservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;


/**
 * The AuthenticationMsApplication class to start the application
 *
 */
@SpringBootApplication
@OpenAPIDefinition
public class AuthenticationMsApplication {
	

	
	/**
	 * The main method for app
	 */
	public static void main(String[] args) {
		SpringApplication.run(AuthenticationMsApplication.class, args);
	}
	

}
 