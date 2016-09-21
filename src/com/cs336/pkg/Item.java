package com.cs336.pkg;

public class Item {

	private int id;
	private String ItemName;
	private String Email;
	private String Description;
	private String Condition;
	
	public Item(int id, String email, String itemName, String desc, String cond) {
		super();
		this.id = id;
		ItemName = itemName;
		Email = email;
		Description = desc;
		Condition = cond;
	}	
	
	public Item(int id, String itemName, String cond)
	{
		super();
		this.id = id;
		Email = "";
		Description = "";
		ItemName = itemName;
		Condition = cond;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemName() {
		return ItemName;
	}

	public void setItemName(String itemName) {
		ItemName = itemName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getCondition() {
		return Condition;
	}

	public void setCondition(String condition) {
		Condition = condition;
	}
}

