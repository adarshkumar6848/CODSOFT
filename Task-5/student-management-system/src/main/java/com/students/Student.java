package com.students;

public class Student {

	//Student properties/attributes.
	private long rollno;
	private String name;
	private String branch;
	private String grade;
	private long studentMobileNumber;
	private long parentMobileNumber;
	
	//no argument constructor.
	public Student() {
		
	}

	//constructor to initialize Student object 
	public Student(long rollno, String name, String branch,String grade , Long studentMobileNumber, long parentMobileNumber) {
		super();
		this.rollno = rollno;
		this.name = name;
		this.branch = branch;
		this.grade = grade;
		this.studentMobileNumber = studentMobileNumber;
		this.parentMobileNumber = parentMobileNumber;
	}
	
	//getters and setters methods to set and get properties.
	public long getRollno() {
		return rollno;
	}
	public void setRollno(long rollno) {
		this.rollno = rollno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	public long getStudentMobileNumber() {
		return studentMobileNumber;
	}
	public void setStudentMobileNumber(long studentMobileNumber) {
		this.studentMobileNumber = studentMobileNumber;
	}
	public long getParentMobileNumber() {
		return parentMobileNumber;
	}
	public void setParentMobileNumber(long parentMobileNumber) {
		this.parentMobileNumber = parentMobileNumber;
	}
	
}
