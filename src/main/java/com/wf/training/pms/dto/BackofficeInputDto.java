package com.wf.training.pms.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class BackofficeInputDto {
	
	@NotBlank(message="First Name is Mandatory")
	private String firstName;
	@NotBlank(message="Last Name is Mandatory")
	private String lastName;
	@Email
	@NotBlank(message="Email ID is Mandatory")
	private String emailId;
	
	@NotBlank(message="User name ID is Mandatory")
	private String userName;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@NotBlank(message="Password is Mandatory")
	private String password;
	
	

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
