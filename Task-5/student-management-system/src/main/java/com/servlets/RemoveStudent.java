package com.servlets;

import java.io.IOException;

import com.doa.StudentDoa;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RemoveStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Long rollNo = Long.parseLong(request.getParameter("rollNo"));
			String name= request.getParameter("name");
			String requestPage = request.getParameter("requestPage");
			StudentDoa sd = new StudentDoa();
			int updatedRows = sd.deleteStudentRecord(rollNo);
			request.setAttribute("updatedRows", updatedRows);
			if(requestPage.equals("display")) {
				request.getRequestDispatcher("/display").forward(request, response);
			}
			
			else if(requestPage.equals("search")) {
				request.setAttribute("txtNameSearch" ,name);
				request.getRequestDispatcher("/search").forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
