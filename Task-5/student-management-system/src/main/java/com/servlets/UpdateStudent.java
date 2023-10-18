package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.doa.StudentDoa;
import com.students.Student;

public class UpdateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			long rollNo = Long.parseLong(request.getParameter("rollno"));
			String name = request.getParameter("name");
			String branch = request.getParameter("branch");
			String grade = request.getParameter("grade");
			long studentMobileNumber = Long.parseLong(request.getParameter("stuMobNum"));
			long parentMobileNumber = Long.parseLong(request.getParameter("parMobNum"));
			
			Student student = new Student(rollNo , name , branch , grade ,  studentMobileNumber , parentMobileNumber);
			
			
			StudentDoa sd = new StudentDoa();
			int result = sd.updateStudent(student);
			request.setAttribute("result", result);
			request.setAttribute("rollNo", rollNo);
			request.setAttribute("Stu", student);
			request.getRequestDispatcher("Editing.jsp").forward(request, response);
			if(result == -200) {
				out.println("SQL EXception occured");
			}
		}
		catch(NumberFormatException nfe) {
			nfe.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
