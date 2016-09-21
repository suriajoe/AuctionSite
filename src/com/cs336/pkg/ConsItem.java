package com.cs336.pkg;

public class ConsItem extends Item{

	private String version;

	public ConsItem(int id, String email, String desc, String condition, String itemName, String version) {
		super(id, email, itemName, desc, condition);
		this.version = version;
	}

	public ConsItem(int id, String condition, String itemName, String version ) {
        this(id, "", "", condition, itemName, version);
    }
	
	public String getVersion() {
		return version;
	}
	
	public void setVersion(String version){
		version = version;
	}
	
	

}
