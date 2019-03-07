package com.voidmain.pojo;

public class Student {

	private String userName;
	private String password;
	private String name;
	private String mobile;
	private String email;
	private String branch;
	private String accountStatus="no";
	private String havingNomination="no";
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getHavingNomination() {
		return havingNomination;
	}
	public void setHavingNomination(String havingNomination) {
		this.havingNomination = havingNomination;
	}
}
