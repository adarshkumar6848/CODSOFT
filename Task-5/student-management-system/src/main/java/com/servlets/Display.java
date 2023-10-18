package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import com.doa.StudentDoa;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Display extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    //handles the Get Requests.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request , response);
    }
    
    //Handles the Post Requests.
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Create StudentDoa Object and calls displayAllStudents() method.
            StudentDoa sd = new StudentDoa();
            ResultSet rs = sd.displayAllStudents();
            
            // Set the attribute for accessing in the target resource.
            request.setAttribute("AllStudents", rs);

            // Forward the request to Display.jsp.
            request.getRequestDispatcher("Display.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
