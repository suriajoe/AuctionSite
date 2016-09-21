package com.cs336.pkg;

public class Person {

	private int id;
	private String FirstName;
	private String LastName;
	private String Password;
	private String Email;
	
	public Person(/*int id, */String firstName, String lastName, String pass, String email) {
		super();
		//this.id = id;
		FirstName = firstName;
		LastName = lastName;
		Password = pass;
		Email = email;
	}


	public Person(){
		
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getEmail()
	{
		return Email;
	}
	
	public String getPassword(){
		return Password;
	}
	
	public void setPassword(String pass){
		Password = pass;
	}
	
}
