package com.cs336.pkg;

public class Answer {

	private String email;
	private int ticket_id;
	private String answer;
	
	public Answer(String e,int tid, String a)
	{
		super();
		
		email = e;
		ticket_id = tid;
		answer = a;
		
	}
	
	public Answer()
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
	
	
	public String getAnswer()
	{
		return answer;
	}
	
	public void setAnswer(String answer)
	{
		this.answer = answer;
	}
	
	
}
