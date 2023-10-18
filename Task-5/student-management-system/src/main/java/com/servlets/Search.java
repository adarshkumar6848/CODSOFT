package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import com.doa.StudentDoa;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Handles the Get requests.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request , response);
	}

	//Handles the Post Requests.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = null;
		
		try {
			//gets the names entered by user to search.
			name = request.getParameter("txtNameSearch");
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(name != null ) {
			try {
				
				//creates the StudentDoa object and calls the searchStudent Method.
				StudentDoa sd = new StudentDoa();
				ResultSet rs = sd.searchStudent(name);
				
				//sets the attribute of result set(holding the student records).
				request.setAttribute("searchName" , rs);
				
				request.setAttribute("name", name);
				
				//forwards the request to Search.jsp(displays the student records.
				request.getRequestDispatcher("Search.jsp").forward(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			
			//this is same as above but when students were removed as the page refreshes this is to set the attribute and using that attribute .
			try {
				name = (String) request.getAttribute("txtNameSearch");
				StudentDoa sd = new StudentDoa();
				ResultSet rs = sd.searchStudent(name);
				request.setAttribute("searchName" , rs);
				request.setAttribute("name", name);
				request.getRequestDispatcher("Search.jsp").forward(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
