package com.codsoft.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


//url pattern
@WebServlet(value="/AtmController")
public class AtmController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	//Handles the Get Requests
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request , response);
	}

	//handles the Post request
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			//get the action parameter 
			String action = request.getParameter("action");	
			
			//set the action attribute 
			request.setAttribute("action", action);
			
			//forward the request to Action.jsp
			request.getRequestDispatcher("Action.jsp").forward(request, response);
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
