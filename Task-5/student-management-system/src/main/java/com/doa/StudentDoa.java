package com.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.students.Student;
import com.zaxxer.hikari.HikariDataSource;

public class StudentDoa {
	
	private HikariDataSource dataSource;
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps1;
	private PreparedStatement ps2;
	private PreparedStatement ps3;
	private PreparedStatement ps4;
	private PreparedStatement ps5;
	private PreparedStatement ps6; // Added for updateStudent
	
	public StudentDoa() {
		dataSource = DataBaseConfig.getDataSource();
		try {
			con = dataSource.getConnection();
			
			// Initialize prepared statements for reuse
			ps1 = con.prepareStatement("select * from Students where roll_no=?");
			ps2 = con.prepareStatement("insert into Students values(?,?,?,?,?,?)");
			ps3 = con.prepareStatement("select * from Students");
			ps4 = con.prepareStatement("select * from Students where name LIKE ?");
			ps5 = con.prepareStatement("delete from Students where roll_no=?");
			ps6 = con.prepareStatement("update Students "
					+ "set "
					+ "name=? , "
					+ "branch=? , "
					+ "grade=? , "
					+ "student_mobile_number=? , "
					+ "parent_mobile_number=? where roll_no=?");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Add a new student to the database
	public int addStudent(Student student) {
		rs = null;
		
		try {
			// Check if the student with the same roll number already exists
			ps1.setLong(1, student.getRollno());
			rs = ps1.executeQuery();
			
			if (rs.next()) {
				return -100;
			} else {
				// Insert the new student record
				ps2.setLong(1, student.getRollno());
				ps2.setString(2, student.getName());
				ps2.setString(3, student.getBranch());
				ps2.setString(4, student.getGrade());
				ps2.setLong(5, student.getStudentMobileNumber());
				ps2.setLong(6, student.getParentMobileNumber());
				
				int updatedRows = ps2.executeUpdate();
				return updatedRows;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -200;
		} finally {
			closeResultSet();
		}
	}
	
	// Display all the students present in the database
	public ResultSet displayAllStudents() {
		rs = null;
		
		try {
			rs = ps3.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	// Show the student records with a specified name
	public ResultSet searchStudent(String name) {
		rs = null;
		
		try {
			ps4.setString(1, "%" + name + "%");
			rs = ps4.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	// Remove the student record with the specified roll no.
	public int deleteStudentRecord(long rollNo) {
		try {
			ps5.setLong(1, rollNo);
			int updatedRows = ps5.executeUpdate();
			return updatedRows;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// Get a student by roll no.
	public Student getStudent(long rollNo) {
		rs = null;
		Student st = null;
		
		try {
			ps1.setLong(1, rollNo);
			rs = ps1.executeQuery();
			
			if (rs.next()) {
				long rn = rs.getLong(1);
				String name = rs.getString(2);
				String branch = rs.getString(3);
				String grade = rs.getString(4);
				long smb = rs.getLong(5);
				long pmb = rs.getLong(6);
				st = new Student(rn, name, branch, grade, smb, pmb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet();
		}
		
		return st;
	}
	
	// Update a student record
	public int updateStudent(Student student) {
		int updatedCount = 0;
		rs = null;
		
		try {
			ps6.setString(1 , student.getName());
			ps6.setString(2 , student.getBranch());
			ps6.setString(3 , student.getGrade());
			ps6.setLong(4 , student.getStudentMobileNumber());
			ps6.setLong(5 , student.getParentMobileNumber());
			ps6.setLong(6, student.getRollno());
			updatedCount = ps6.executeUpdate();
			
			return updatedCount;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet();
		}
		
		return updatedCount;
	}
	
	// Close ResultSet
	private void closeResultSet() {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
