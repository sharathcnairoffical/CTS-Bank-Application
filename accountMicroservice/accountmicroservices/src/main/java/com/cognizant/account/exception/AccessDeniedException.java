package com.cognizant.account.exception;

public class AccessDeniedException extends RuntimeException{
	
	/*
	 * Access Denied Exception
	 */
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AccessDeniedException() {
		
	}
	
	public AccessDeniedException(String message) {
		super(message);
	}
}
