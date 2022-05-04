package com.cognizant.customer.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table
//@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CustomerEntity {
	@Id
	@Column(name = "userid", length = 15, unique = true)
	@Pattern(regexp = "^[A-Za-z0-9_-]*$")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String userid;

	@Column(name = "username", length = 20)
	@NotBlank(message="Name Should not be Null")
	private String username;

	@Column(name = "password")
	@NotBlank
	private String password;

	@Column(name = "dateOfBirth")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date dateOfBirth;

	@Pattern(regexp = "^[A-Z]{5}+[0-9]{4}+[A-Z]{1}$")
	@Column(name = "pan", length = 10)
	@NotBlank
	private String pan;

	@Column(name = "address")
	@NotBlank
	private String address;

	@Transient
	private List<Account> accounts = new ArrayList<>();

	public CustomerEntity(@NotBlank String username, @NotBlank String password, Date dateOfBirth,
			@Pattern(regexp = "^[A-Z]{5}+[0-9]{4}+[A-Z]{1}$") @NotBlank String pan, @NotBlank String address,
			List<Account> accounts) {
		super();
		this.username = username;
		this.password = password;
		this.dateOfBirth = dateOfBirth;
		this.pan = pan;
		this.address = address;
		this.accounts = accounts;
	}

	
}
