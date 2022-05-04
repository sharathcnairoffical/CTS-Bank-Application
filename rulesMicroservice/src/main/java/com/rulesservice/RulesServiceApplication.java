package com.rulesservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
@EnableFeignClients
@SpringBootApplication
@OpenAPIDefinition
public class RulesServiceApplication {
	//To run rules microservice
	public static void main(String[] args) {
		SpringApplication.run(RulesServiceApplication.class, args);
	}
	
	
	
}
