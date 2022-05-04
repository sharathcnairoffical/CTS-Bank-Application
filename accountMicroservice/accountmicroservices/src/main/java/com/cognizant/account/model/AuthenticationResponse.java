package com.cognizant.account.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthenticationResponse {
/*
 * class used to sent authentication response 
 * Refered to Authentication Microservices
 */

	private String userid;
	private String name;
	private boolean isValid;
}
