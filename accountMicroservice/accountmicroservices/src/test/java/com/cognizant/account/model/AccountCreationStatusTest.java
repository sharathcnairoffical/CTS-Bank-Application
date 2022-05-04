package com.cognizant.account.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class AccountCreationStatusTest {

	
	AccountCreationStatus ac=new AccountCreationStatus();
	AccountCreationStatus ac1=new AccountCreationStatus(3698,null);
	
	@Test 
	public void accIdTest()
	{
		ac.setAccountId(1234);
		assertEquals(1234, ac.getAccountId());
	}
	@Test
	public void messTest()
	{
		ac.setMessage(null);
		assertEquals(null, ac.getMessage());
	}
	
	@Test 
	public void accIdTest1()
	{
		assertEquals(3698, ac1.getAccountId());
	}
	@Test
	public void messTest1()
	{
		assertEquals(null, ac1.getMessage());
	}
	
}	
