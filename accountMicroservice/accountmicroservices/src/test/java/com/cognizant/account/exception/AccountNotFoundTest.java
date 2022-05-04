package com.cognizant.account.exception;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class AccountNotFoundTest {

	@Test
	public void AccountException() {
		
		AccountNotFoundException e1=new AccountNotFoundException("hello");
		AccountNotFoundException e2=new AccountNotFoundException("hello");
		assertThat(e1).isNotEqualTo(e2);
		
	}
	
	@Test
	public void AccountExceptionNull() {
		
		AccountNotFoundException e1=new AccountNotFoundException();
		AccountNotFoundException e2=new AccountNotFoundException();
		assertThat(e1).isNotEqualTo(e2);
		
	}
}
