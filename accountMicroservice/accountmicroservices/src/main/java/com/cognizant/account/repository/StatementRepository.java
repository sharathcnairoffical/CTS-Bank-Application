package com.cognizant.account.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cognizant.account.model.Statement;

public interface StatementRepository extends JpaRepository<Statement, Long>{
	@Query(nativeQuery = true, value = "SELECT * from STATEMENT s WHERE (s.source_Id = :accountId or s.target_Id = :accountId)") 

	List<Statement> findStatementByAccountId(@Param(value = "accountId") long accountId); 

	 
}
