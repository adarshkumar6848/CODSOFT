package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import com.doa.StudentDoa;
import com.students.Student;

public class GetStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			long rollNo = Long.parseLong(request.getParameter("rollNo"));
			StudentDoa sd = new StudentDoa();
			Student rs1 = sd.getStudent(rollNo);
			request.setAttribute("Stu", rs1);
			request.getRequestDispatcher("Editing.jsp").forward(request, response);
		}
		catch(NumberFormatException nfe) {
			nfe.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
