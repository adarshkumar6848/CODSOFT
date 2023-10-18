package com.codsoft.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.codsoft.accounts.UserBankAccount;

//url pattern
@WebServlet(value="/status")

public class StatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Handles the Get Requests.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request , response);
	}
	
	//Handles the Post requests.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			//get the action parameter from request
			String action = request.getParameter("action");
			
			double amount , balance;
			
			String status = "fail";
			
			//create the new  UserBankAccount Obejct.
			UserBankAccount uba = new UserBankAccount();
			
			//Set the action attribute.
			request.setAttribute("action", action);
			
			//selects based on the action.
			if(action.equals("withdraw")) {
				
				//get the amount
				amount = Double.parseDouble(request.getParameter("amount"));
				
				//get the balance from UserBankAccount
				balance = uba.withdraw(amount);
				
				// set the status
				if(balance >= 0) {
					status = "success";
				}
				
				//set the status attribute 
				request.setAttribute("status", status);
			}
			else if(action.equals("deposit")) {
				
				//get the amount
				amount = Double.parseDouble(request.getParameter("amount"));
				
				//deposit the money and get the  balance
				balance = uba.deposit(amount);
				
				// set the status
				if(balance >= 0) {
					status = "success";
				}
				
				//set the status attribute 
				request.setAttribute("status", status);
			}
			else if(action.equals("balance")) {
				
				//get the balance from UserBankAccount
				balance = uba.checkBalance();
				
				status = "success";
				
				//set the status attribute 
				request.setAttribute("status", status);
				
				//set the balance attribute 
				request.setAttribute("balance", balance);
			}
			
			//forward the request to Status page
			request.getRequestDispatcher("Status.jsp").forward(request, response);
		}
		catch(Exception e) {
			
			//print the exception
			e.printStackTrace();
		}
	}

}
