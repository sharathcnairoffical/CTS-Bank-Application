package com.cognizant.account.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class TransactionTest {
	
	Transaction tc=new Transaction();
	Transaction tc1=new Transaction(1, 2, "sarthak", 32, "prabha", 1000, null, "deposit");
	
	@Test
	public void setTransactionIdTest()
	{
		tc.setId(1);
		assertEquals(1,tc.getId());
	}
	@Test
	public void setTransactionNameTest()
	{
		tc.setSourceAccountId(1001);
		assertEquals(1001, tc.getSourceAccountId());
	}
	@Test
	public void SetTransactionOwnerTest()
	{
		tc.setSourceOwnerName("sarthak");
		assertEquals("sarthak", tc.getSourceOwnerName());
	}
	
	@Test
	public void setTransactionTargetAccIdTest()
	{
		tc.setTargetAccountId(200315);
		assertEquals(200315, tc.getTargetAccountId());
	}
	
	@Test
	public void setTransactionTOwnerTest()
	{
		tc.setTargetOwnerName("swaraj");
		assertEquals("swaraj", tc.getTargetOwnerName());
	}
	
	@Test
	public void SetAmount()
	{
		tc.setAmount(5000);
		assertEquals(5000, tc.getAmount());
	}
	@Test
	public void SetDateTest()
	{
		tc.setInitiationDate(null);
		assertEquals(null, tc.getInitiationDate());
		
	}
	
	@Test
	public void setReferenceTest() {
		tc.setReference("Deposit");
		assertEquals("Deposit", tc.getReference());
	}
	@Test
	public void setIdTest1() {
		assertEquals(1, tc1.getId());
	}

	@Test
	public void setSourceAccountIdTest1() {
		assertEquals(2, tc1.getSourceAccountId());
	}

	@Test
	public void setTargetOwnerNameTest1() {
		assertEquals("prabha", tc1.getTargetOwnerName());
	}

	@Test
	public void setTargetAccountIdTest1() {
		assertEquals(32, tc1.getTargetAccountId());
	}

	@Test
	public void setAmountTest1() {
		assertEquals(1000, tc1.getAmount());
	}

	@Test
	public void setReferenceTest1() {
		assertEquals("deposit", tc1.getReference());
	}

	@Test
	public void setInitiationDateTest1() {
		assertEquals(null, tc1.getInitiationDate());
	}
	@Test
	public void setSourceOwnerTest1()
	{
		
		assertEquals("sarthak", tc1.getSourceOwnerName());
	}


}
