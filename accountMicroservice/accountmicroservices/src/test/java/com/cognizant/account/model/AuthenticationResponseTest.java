package com.cognizant.account.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class AuthenticationResponseTest {
	
	AuthenticationResponse au=new AuthenticationResponse();
	AuthenticationResponse au1=new AuthenticationResponse("234","sarthak",false);
	
	@Test
	public void userIdTest()
	{
		au.setUserid("123");
		assertEquals("123", au.getUserid());
	}
	@Test
	public void nameTest()
	{
		au.setName("sarthak");
		assertEquals("sarthak", au.getName());
	}
	@Test
	public void isValidTest()
	{
		au.setValid(true);
		assertEquals(true, au.isValid());
	}
	
	@Test
	public void userIdTest1()
	{
		assertEquals("234", au1.getUserid());
	}
	@Test
	public void nameTest1()
	{
		assertEquals("sarthak", au1.getName());
	}
	@Test
	public void isValidTest1()
	{
		assertEquals(false, au1.isValid());
	}
	
	@Test
	public void toStringTest()
	{
		String expected = au.toString();
		assertEquals(expected, au.toString());
	}

}
