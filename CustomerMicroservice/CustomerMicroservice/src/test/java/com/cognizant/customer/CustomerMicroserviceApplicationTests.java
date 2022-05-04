package com.cognizant.customer;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CustomerMicroserviceApplicationTests {

	@Test
	void contextLoads() {
		String check="Cust101";
		assertEquals("Cust101",check );
	}

}
