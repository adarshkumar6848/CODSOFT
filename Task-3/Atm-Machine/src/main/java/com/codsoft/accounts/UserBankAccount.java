package com.codsoft.accounts;

public class UserBankAccount {
	
	//balance property
	private static  double balance = 0;

	//setter and getter methods for balance proeprty
	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		UserBankAccount.balance = balance;
	}

	
	//no argument constructor
	public UserBankAccount() {
		super();
	}
	
	//method for withdraw
	public double withdraw(double amount) {
		if(balance < amount)
			return -1;
		else
			balance -= amount;
		return Math.round(balance * 100.0)/100.0;
	}
	
	//method for deposit
	public double deposit(double amount) {
		balance += amount;
		return Math.round(balance * 100.0)/100.0;
	}
	
	//method for balance
	public double checkBalance() {
		return Math.round(balance * 100.0)/100.0;
	}
	
}
