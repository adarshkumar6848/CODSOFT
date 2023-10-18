package com.servlets;
import com.students.Student;
import com.doa.StudentDoa;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//Handling Post Requests
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			//Getting the values entered by user in form.
			long rollNo = Long.parseLong(request.getParameter("rollNo"));
			String name = request.getParameter("name");
			String branch = request.getParameter("branch");
			String grade = request.getParameter("grade");
			long studentMobileNumber = Long.parseLong(request.getParameter("stuMobNum"));
			long parentMobileNumber = Long.parseLong(request.getParameter("parMobNum"));
			
			//creating Student Object with the values provided by user.
			Student student = new Student(rollNo , name , branch , grade ,  studentMobileNumber , parentMobileNumber);
			
			//Creating StudentDoa Object and calling the addStudent() method.
			StudentDoa sd = new StudentDoa();
			int result = sd.addStudent(student);
			
			//Setting the attribute of result for accessing in AddStudents.jsp.
			request.setAttribute("result", result);
			request.setAttribute("rollNo", rollNo);
			
			/*
			 * based on the result redirect to the respective pages.
			 * result > 0 means Student added Successfully
			 * result = -100 means student with same roll no already exists
			 * result = -200 something went wrong (might be internal exception).
			 */
			
			if(result > 0 || result == -100) {
				request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
			}
			else if(result == -200) {
				request.getRequestDispatcher("Error.jsp").forward(request, response);
			}
		}
		catch(Exception e) {
			request.getRequestDispatcher("Error.jsp").forward(request, response);
		}
	}

}