package com.cognizant.bankmvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;


@SpringBootApplication
@OpenAPIDefinition
@EnableFeignClients
public class BankmvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(BankmvcApplication.class, args);
	}
	
	
 

}
