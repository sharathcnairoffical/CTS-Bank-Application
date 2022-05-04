package com.cognizant.account.exception;

public class AccountNotFoundException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * Account Not Found Exception 
	 */
	
	public AccountNotFoundException() {
		super();
	}
	
	public AccountNotFoundException(String message) {
		super(message);
	}
		
}
