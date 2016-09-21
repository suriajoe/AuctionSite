package com.cs336.pkg;

public class Question {

	private String email;
	private int ticket_id;
	private String title;
	private String question;
	
	public Question(String e,int tid,String t, String q)
	{
		super();
		
		email = e;
		ticket_id = tid;
		title = t;
		question = q;
		
	}
	
	public Question()
	{
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public int getTid()
	{
		return ticket_id;
	}
	
	public void setTid(int ticket_id)
	{
		this.ticket_id = ticket_id;
	}
	
	public String getTitle()
	{
		return title;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	
	public String getQuestion()
	{
		return question;
	}
	
	public void setQuestion(String question)
	{
		this.question = question;
	}
	
	
}
