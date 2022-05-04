package com.cognizant.account.exception;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class MinimumBalanceTest {

	@Test
	public void MinimumException() {
		
		MinimumBalanceException e1=new  MinimumBalanceException("hello");
		MinimumBalanceException e2=new  MinimumBalanceException("hello");
		assertThat(e1).isNotEqualTo(e2);
		
	}
	
	@Test
	public void MinimumExceptionNull() {
		
		MinimumBalanceException e1=new  MinimumBalanceException();
		MinimumBalanceException e2=new  MinimumBalanceException();
		assertThat(e1).isNotEqualTo(e2);
		
	}

}
