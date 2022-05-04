package com.cognizant.account.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="STATEMENT")
public class Statement {
	@Id
	private long transactionId;
	
	private long sourceId;
	
	private long targetId;
	
	private double amount;
	
	private double sourceBalance;
	
	private double targetBalance;
	
	private Date date;
	
	private String reference;

	public Statement(long sourceId, long targetId, double amount, double sourceBalance, double targetBalance, Date date,
			String reference) {
		super();
		this.sourceId = sourceId;
		this.targetId = targetId;
		this.amount = amount;
		this.sourceBalance = sourceBalance;
		this.targetBalance = targetBalance;
		this.date = date;
		this.reference = reference;
	}
	
}
