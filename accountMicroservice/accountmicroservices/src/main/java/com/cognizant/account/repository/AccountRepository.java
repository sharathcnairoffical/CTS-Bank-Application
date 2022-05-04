package com.cognizant.account.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cognizant.account.model.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {

	@Query(nativeQuery=true,value="Select * from Account a where a.account_Id=:accountId")
	Account findByAccountId(@Param(value="accountId") long accountId);
	
	List<Account> findByCustomerId(String customerId);
}
