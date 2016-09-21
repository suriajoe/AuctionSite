package com.cs336.pkg;

//import javax.rmi.CORBA.Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;

public class ApplicationDAO {

	public Connection getConnection(){
		String connectionUrl = "jdbc:mysql://classvm52.cs.rutgers.edu:3306/auction_site?autoReconnect=true";
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(connectionUrl,"root", "CalDalFal21");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void insertPerson(String lastname, String firstname, String password, String email) throws SQLException{
		
		Connection dbConnection = getConnection();
				
		PreparedStatement preparedStatement=dbConnection.prepareStatement("Insert into accounts values (?,?,?,?);");
		preparedStatement.setString(1, email); 
		preparedStatement.setString(2, firstname);
		preparedStatement.setString(3, lastname);
		preparedStatement.setString(4, password);
		
		
		// execute insert SQL statement
		//System.out.println("user added");
		preparedStatement.executeUpdate();

		preparedStatement.close();
		dbConnection.close();
	}
	
	public void insertAdmin(String email) throws SQLException{
		
		Connection dbConnection = getConnection();

		PreparedStatement preparedStatement=dbConnection.prepareStatement("Insert into admins values (?);");
		
		preparedStatement.setString(1, email);
		//execute insert SQL statement
		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}	
	
	
	public void insertRep(String email) throws SQLException{
		
		Connection dbConnection = getConnection();
				
		PreparedStatement preparedStatement=dbConnection.prepareStatement("Insert into customer_reps values (?);");
		preparedStatement.setString(1, email); 
		
		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}


	public void insertAuction(String email, int reserve, int autowin, java.sql.Timestamp open, java.sql.Timestamp close) throws SQLException{
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement("insert into auctions ( email, item_id, reserve, autowin, open_timestamp, close_timestamp) "
				+ "values ( ?,?,?,?,?,? )");
		
		String theID = getMaxFromItems();
		
		preparedStatement.setString(1, email);
		preparedStatement.setInt(2, Integer.parseInt(theID));
		preparedStatement.setInt(3, reserve);
		preparedStatement.setInt(4, autowin);
		preparedStatement.setTimestamp(5, open);
		preparedStatement.setTimestamp(6, close);
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		dbConnection.close();
		
	}
	
	
	public void deleteBids(String bidID) throws SQLException{
		
		Connection dbConnection = getConnection();
		String selectString = "delete from bids where bid_id=" + Integer.parseInt(bidID) + ";";
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
		
	}
	
	
	
	
	private String getMaxFromItems()throws SQLException{
		Connection dbConnection = getConnection();
		PreparedStatement getLatestId = dbConnection.prepareStatement("Select MAX(item_id)max from items;");
		ResultSet Lat = getLatestId.executeQuery();
		String theID = "";
		while(Lat.next()){
			theID = Lat.getString("max");
		}
		return theID;
	}
	
	
	public java.sql.Timestamp getThaTimestamp(){
		java.util.Date date = new java.util.Date();
		return new java.sql.Timestamp(date.getTime());
	}
	
	public java.sql.Timestamp getNextWeek(){
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());

		cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH)+6);
		Date myDate = cal.getTime();
		
		return new java.sql.Timestamp(myDate.getTime());
	}
	
	
	public void insertConsoleItem(String email, String name, String desc, String condition, String type, String version)throws SQLException{
		
		Connection dbConnection = getConnection();
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement("Insert into items (email) values (?)");
		preparedStatement.setString(1, email);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		
		String theID = getMaxFromItems();
		
		if(type.equals("Playstation")){
			PreparedStatement ps = dbConnection.prepareStatement("Insert into ps_games (item_id, title, description, item_condition, ps_version) values ( ?,?,?,?,? )");
			ps.setInt(1, Integer.parseInt(theID));
			ps.setString(2, name);
			ps.setString(3, desc);
			ps.setString(4, condition);
			ps.setString(5, version);
			ps.executeUpdate();
			ps.close();
		}
		
		if(type.equals("Xbox")){
			PreparedStatement ps = dbConnection.prepareStatement("Insert into xb_games (item_id, title, description, item_condition, xb_version) values ( ?,?,?,?,? )");
			ps.setInt(1, Integer.parseInt(theID));
			ps.setString(2, name);
			ps.setString(3, desc);
			ps.setString(4, condition);
			ps.setString(5, version);
			ps.executeUpdate();
			ps.close();
		}
		
		dbConnection.close();
	}
	
	
	public void insertPCItem(String cpu, String ram, String hdd, String grafx, String os, String desc, String title, String condition) throws SQLException{
		Connection dbConnection = getConnection();
		
		//PreparedStatement preparedStatement = dbConnection.prepareStatement("Insert into pc_games values ( ?,?,?,?,?,?,?,?,? )");
		
		String theID = getMaxFromItems();
		
		if(cpu == null){
			PreparedStatement preparedStatement = dbConnection.prepareStatement("Insert into pc_games values ( ?,?,?,?,?,?,?,?,? )");
			preparedStatement.setInt(1, Integer.parseInt(theID));
			preparedStatement.setString(2, title);
			preparedStatement.setString(3, desc);
			preparedStatement.setString(4, condition);
			preparedStatement.setInt(5, 0);
			preparedStatement.setInt(6, 0);
			preparedStatement.setInt(7, 0);
			preparedStatement.setInt(8, 0);
			preparedStatement.setString(9, null);
			preparedStatement.executeUpdate();
			preparedStatement.close();
			dbConnection.close();

		}else
		{	
			PreparedStatement preparedStatement = dbConnection.prepareStatement("update pc_games "
				+ "set cpu_req=" + Integer.parseInt(cpu) + " ,ram_req=" + Integer.parseInt(ram) + " ,rom_req=" + Integer.parseInt(hdd) + " ,gfx_req='" + grafx + "' ,os='" + os 
				+ "' where item_id=" + Integer.parseInt(theID) + ";");
			
			/*
			preparedStatement.setInt(1, Integer.parseInt(theID));
			preparedStatement.setString(2, title);
			preparedStatement.setString(3, desc);
			preparedStatement.setString(4, condition);
			preparedStatement.setString(5, cpu);
			preparedStatement.setInt(6, Integer.parseInt(ram));
			preparedStatement.setInt(7, Integer.parseInt(hdd));
			preparedStatement.setString(8, grafx);
			preparedStatement.setString(9, os);
			 */
			preparedStatement.executeUpdate();
		
			preparedStatement.close();
			
		}
		
		
		dbConnection.close();
	}
	
	
	
	public void updateAuction(String updateString) throws SQLException{
		Connection dbConnection = getConnection();
		
		PreparedStatement ps = dbConnection.prepareStatement(updateString);
		ps.executeUpdate();
		ps.close();
		dbConnection.close();
	}	
	
	public LinkedList<Auction> getAllAuctions() throws SQLException {
		LinkedList<Auction> listOfAuction = new LinkedList<Auction>();
		
		//display all tuples
		String selectString = "select * from auctions;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfAuction.add(new Auction(rs.getInt("auction_id"), rs.getString("email"), rs.getInt("item_id"), rs.getInt("reserve"), rs.getInt("autowin"), rs.getString("winner_email"), 
					rs.getTimestamp("open_timestamp"), rs.getTimestamp("close_timestamp")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfAuction;
	}
	public LinkedList<Bid> getAllBids() throws SQLException{
		
		LinkedList<Bid> listOfBid = new LinkedList<Bid>();
		
		//display all tuples
		String selectString = "select * from bids;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfBid.add(new Bid(rs.getInt("auction_id"), rs.getInt("amount"), rs.getInt("secret_limit"), rs.getString("email"), rs.getTimestamp("bid_timestamp")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfBid;
	}


	public LinkedList<Person> getAllPeople() throws SQLException{
		
		LinkedList<Person> listOfPeople = new LinkedList<Person>();
		
		//display all tuples
		String selectString = "select * from accounts;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfPeople.add(new Person(rs.getString("first_name"), rs.getString("last_name"), rs.getString("password"), rs.getString("email")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfPeople;
	}
	
	public LinkedList<String> getAllAdmins() throws SQLException{
		
		LinkedList<String> listOfAdmin = new LinkedList<String>();
		
		//display all tuples
		String selectString = "select * from admins;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfAdmin.add(rs.getString("email"));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfAdmin;
	}
	
	public void closeAuctionWin(String auctionID, String email) throws SQLException{
		Connection dbConnection = getConnection();
		String selectString = "update auctions set winner_email='";
		selectString = selectString + email + "' where auction_id =" + Integer.parseInt(auctionID) + ";";
		
		PreparedStatement ps = dbConnection.prepareStatement(selectString);
		ps.executeUpdate();
		ps.close();
		dbConnection.close();
	}
	
	
	public LinkedList<String> getAllReps() throws SQLException{
	
		LinkedList<String> listOfReps = new LinkedList<String>();
	
		//display all tuples
		String selectString = "select * from customer_reps;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next( )) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfReps.add(rs.getString("email"));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
	
		//close everything
		preparedStatement.close();
		dbConnection.close();
	
		return listOfReps;
	}
	
	public LinkedList<Item> getYourItems() throws SQLException{
		
		LinkedList<Item> listOfItems = new LinkedList<Item>();
	
		//display all tuples
		String selectString = "select * from items;";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next()) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfItems.add(new Item(rs.getInt("item_id"), rs.getString("email"), 
					rs.getString("title"), rs.getString("description"), rs.getString("item_condition")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
	
		//close everything
		preparedStatement.close();
		dbConnection.close();
	
		return listOfItems;
	}
	
	public LinkedList<ConsItem> getXbox()throws SQLException{

		LinkedList<ConsItem> listOfCons = new LinkedList<ConsItem>();
	
		//display all tuples
		String selectString = "select * from xb_games;";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next()) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfCons.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                    rs.getString("item_condition"), rs.getString("title"), rs.getString("xb_version")));
		}
		preparedStatement.close();
		dbConnection.close();
	
		return listOfCons;
	}
	
	public LinkedList<ConsItem> getPlaystation()throws SQLException{

		LinkedList<ConsItem> listOfCons = new LinkedList<ConsItem>();
	
		//display all tuples
		String selectString = "select * from ps_games;";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next()) {
			//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
			resLength++;
			listOfCons.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                    rs.getString("item_condition"), rs.getString("title"), rs.getString("ps_version")));
		}
		preparedStatement.close();
		dbConnection.close();
	
		return listOfCons;
	}
	
	
	public LinkedList<PCItem> getAllPC()throws SQLException{

		LinkedList<PCItem> listOfPC = new LinkedList<PCItem>();
	
		//display all tuples
		String selectString = "select * from pc_games;";
		
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next()) {
			//System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " +  rs.getString("itemName") + ", condition = " + rs.getString("condition"));
			resLength++;
			listOfPC.add(new PCItem(rs.getInt("item_id"), rs.getInt("cpu_req"), rs.getInt("ram_req"),
                    rs.getInt("rom_req"), rs.getString("gfx_req"), rs.getString("os"), "",
                    rs.getString("description"), rs.getString("title"), rs.getString("item_condition")));
		}
		
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
	
		//close everything
		preparedStatement.close();
		dbConnection.close();
	
		return listOfPC;
	}
	
    
	public LinkedList<ConsItem> getPlaystationSearchResult( String title, String version, String condition ) throws SQLException {
        LinkedList<ConsItem> resultList = new LinkedList<ConsItem>();
        boolean hasCondition = false;
        int rsLength = 0;
        String selectString = "SELECT * FROM ps_games WHERE";
        String conditionString = "";
		boolean containsItem;

        // CHECK STRING HERE
        title.trim();
        if( !Utilities.inputCheck(title) ) {
            title = "";
        }
        version.trim();
        if( !Utilities.inputCheck(version) ) {
            version = "";
        }
        condition.trim();
        if( !Utilities.inputCheck(condition) ) {
            condition = "";
        }

        if( !"".equals(title) ) {
            selectString = selectString + " title='" + title + "'";
            hasCondition = true;

        }

        // Adds version requirement
        if( !"".equals(version) ) {
            if( hasCondition ) {
                conditionString = conditionString + " AND ps_version='" + version + "'";
            } else {
                conditionString = conditionString + " ps_version='" + version + "'";
                hasCondition = true;
            }
        }
        // Adds condition requirement
        if( !"".equals(condition) ) {
            if( hasCondition ) {
                conditionString = conditionString + " AND item_condition='" + condition + "'";
            } else {
                conditionString = conditionString + " item_condition='" + condition + "'";
                hasCondition = true;
            }
        }

        conditionString = conditionString + ";";
        selectString = selectString + conditionString;
        
        Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		ResultSet rs = preparedStatement.executeQuery(); 

        while(rs.next()) {
            rsLength++;
            resultList.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                    rs.getString("item_condition"), rs.getString("title"), rs.getString("ps_version")));
        }
        
        preparedStatement.close();
		dbConnection.close();

        if( rsLength < 10 && !"".equals(title) ) {

            selectString = "SELECT * FROM ps_games WHERE title LIKE '%" + title + "%';";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();

            while(rs.next()) {
				containsItem = false;
                //System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
                for(int i = 0 ; i < resultList.size() ; i++ ){
					if(resultList.get(i).getId() == rs.getInt("item_id") ) {
						containsItem = true;
					}
				}
				if( !containsItem ) {
					rsLength++;
                    resultList.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                            rs.getString("item_condition"), rs.getString("title"), rs.getString("ps_version")));
				}
            }
            preparedStatement.close();
            dbConnection.close();

            int tsIndex = 0;
            String[] titleStrings = title.split(" ");
            while( rsLength < 10 ) {
                if( tsIndex < titleStrings.length ) {
                    if( titleStrings[tsIndex].length() > 2 ) {
                        selectString = "SELECT * FROM ps_games WHERE ps_version='" + version + "' AND title LIKE '%"
                                + titleStrings[tsIndex]+ "%';";

                        dbConnection = getConnection();
                        preparedStatement = dbConnection.prepareStatement(selectString);
                        rs = preparedStatement.executeQuery();
                        
                        while(rs.next()) {
							containsItem = false;
							//System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
							for(int i = 0 ; i < resultList.size() ; i++ ){
								if(resultList.get(i).getId() == rs.getInt("item_id") ) {
									containsItem = true;
								}
							}
							if( !containsItem ) {
								rsLength++;
                                resultList.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                                        rs.getString("item_condition"), rs.getString("title"), rs.getString("ps_version")));
							}
                        }
                        
                        preparedStatement.close();
                        dbConnection.close();
                        tsIndex++;

                    } else {
                        tsIndex++;
                    }
                } else {
                    break;
                }
            }
        }
        
        return resultList;
    }
    
    public LinkedList<ConsItem> getXboxSearchResult( String title, String version, String condition ) throws SQLException {
        LinkedList<ConsItem> resultList = new LinkedList<ConsItem>();
        boolean hasCondition = false;
        int rsLength = 0;
        String selectString = "SELECT * FROM xb_games WHERE";
        String conditionString = "";
		boolean containsItem;
        
        // CHECK STRING HERE
        title.trim();
        if( !Utilities.inputCheck(title) ) {
            title = "";
        }

        if( !"".equals(title) ) {
            selectString = selectString + " title='" + title + "'";
            hasCondition = true;
        }

        // Adds version requirement
        if( !"".equals(version) ) {
            if( hasCondition ) {
                conditionString = conditionString + " AND xb_version='" + version + "'";
            } else {
                conditionString = conditionString + " xb_version='" + version + "'";
                hasCondition = true;
            }

        }
        // Adds condition requirement
        if( !"".equals(condition) ) {
            if( hasCondition ) {
                conditionString = conditionString + " AND item_condition='" + condition + "'";
            } else {
                conditionString = conditionString + " item_condition='" + condition + "'";
                hasCondition = true;
            }
        }

        conditionString = conditionString + ";";
        selectString = selectString + conditionString;
        
        Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		ResultSet rs = preparedStatement.executeQuery(); 
		
        while(rs.next()) {
            rsLength++;
            resultList.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                    rs.getString("item_condition"), rs.getString("title"), rs.getString("xb_version")));
        }

        preparedStatement.close();
		dbConnection.close();

        if( rsLength < 10 && !"".equals(title) ) {

            selectString = "SELECT * FROM xb_games WHERE title LIKE '%" + title + "%';";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();

            while(rs.next()) {
                //System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
                rsLength++;
                resultList.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                        rs.getString("item_condition"), rs.getString("title"), rs.getString("xb_version")));
            }
            preparedStatement.close();
            dbConnection.close();

            int tsIndex = 0;
            String[] titleStrings = title.split(" ");
            while( rsLength < 10 ) {
                if( tsIndex < titleStrings.length ) {
                    if( titleStrings[tsIndex].length() > 2 ) {
                        selectString = "SELECT * FROM xb_games WHERE xb_version='" + version + "' AND title LIKE '%"
                                + titleStrings[tsIndex]+ "%';";
                        
                        dbConnection = getConnection();
                        preparedStatement = dbConnection.prepareStatement(selectString);
                        rs = preparedStatement.executeQuery();
                        
                        while(rs.next()) {
							containsItem = false;
							//System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
							for(int i = 0 ; i < resultList.size() ; i++ ){
								if(resultList.get(i).getId() == rs.getInt("item_id") ) {
									containsItem = true;
								}
							}
							if( !containsItem ) {
								rsLength++;
                                resultList.add(new ConsItem(rs.getInt("item_id"), "", rs.getString("description"),
                                        rs.getString("item_condition"), rs.getString("title"), rs.getString("xb_version")));
							}
                        }
                        
                        preparedStatement.close();
                        dbConnection.close();
                        tsIndex++;

                    } else {
                        tsIndex++;
                    }
                } else {
                    break;
                }
            }
        }
        
        return resultList;
    }
    
    public LinkedList<PCItem> getPcSearchResult( String title, String condition, String cpu, String ram,
            String hdd, String os ) throws SQLException {
		
		LinkedList<PCItem> resultList = new LinkedList<PCItem>();
		int cpuInt;
		int ramInt;
		int hddInt;
		String selectString = "SELECT * FROM pc_games WHERE";
        String conditionString = "";
		boolean hasCondition = false;
		int rsLength = 0; // Result set length
		boolean containsItem;

		// ADD BLOCK HERE TO TRIM STRINGS, HANDLE WEIRD CHARACTERS AND CHECK CASE
		title.trim();
        if( !Utilities.inputCheck(title) ) {
            title = "";
        }
		cpu.trim();
        if( !Utilities.inputCheck(cpu) ) {
            cpu = "";
        }
		ram.trim();
        if( !Utilities.inputCheck(ram) ) {
            ram = "";
        }
		hdd.trim();
        if( !Utilities.inputCheck(hdd) ) {
            hdd = "";
        }
	
		// The following blocks add search requirements to the query if they have been provided
		// Adds title to the query
		if( !"".equals(title) ) {
			selectString = selectString + " title='" + title +"'";
			hasCondition = true;
		}
        // Adds condition requirement
		if( !"".equals(condition) ) {
			if( hasCondition ) {
                conditionString = conditionString + "AND item_condition='" + condition + "'";
			} else {
                conditionString = conditionString + " item_condition='" + condition + "'";
                hasCondition = true;
			}
		}
		// Adds cpu requirement
		if( !"".equals(cpu) ) {
			
			try{
				cpuInt = Integer.parseInt(cpu);
				if( hasCondition ) {
                    conditionString = conditionString + " AND cpu_req<=" + cpuInt;
				} else {
                    conditionString = conditionString + " cpu_req<=" + cpuInt;
                    hasCondition = true;
				}
			} catch(NumberFormatException e) {
				//ADD SOME NICE ERROR?
			}
			
		}
		// Adds ram requirement
		if( !"".equals(ram) ) {
			
			try{
				ramInt = Integer.parseInt(ram);
				if( hasCondition ) {
                    conditionString = conditionString + " AND ram_req<=" + ramInt;
				} else {
                    conditionString = conditionString + " ram_req<=" + ramInt;
                    hasCondition = true;
				}
			} catch(NumberFormatException e) {
				// ADD ANOTHER NICE ERROR!
			}

		}
		// Adds storage requirement
		if( !"".equals(hdd) ) {
			try{
				hddInt = Integer.parseInt(hdd);
				if( hasCondition ) {
                    conditionString = conditionString + " AND rom_req<=" + hddInt;
				} else {
                    conditionString = conditionString + " rom_req<=" + hddInt;
                    hasCondition = true;
				}
			} catch(NumberFormatException e) {
				// ADD A THIRD NICE ERROR
			}
		}
		// Adds OS requirement
		if( !"".equals(os) ) {
			if( hasCondition ) {
                conditionString = conditionString + " AND os='" + os +"'";
			} else {
                conditionString = conditionString + " os='" + os + "'";
                hasCondition = true;
			}
		}
        
        if( !hasCondition ){
            return null;
        }

        conditionString = conditionString + ";";
        selectString = selectString + conditionString;

        
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		
		ResultSet rs = preparedStatement.executeQuery(); 

        rs.beforeFirst();
        while(rs.next()) {
            //System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
            rsLength++;
            resultList.add(new PCItem(rs.getInt("item_id"), rs.getInt("cpu_req"), rs.getInt("ram_req"),
                    rs.getInt("rom_req"), rs.getString("gfx_req"), rs.getString("os"), "",
                    rs.getString("description"), rs.getString("title"), rs.getString("item_condition")));
        }

        preparedStatement.close();
		dbConnection.close();

        if( rsLength < 10 && !"".equals(title) ) {

            selectString = "SELECT * FROM pc_games WHERE title like '%" + title + "%'" + conditionString;
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();

            rs.beforeFirst();
            while(rs.next()) {
				containsItem = false;
				//System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
				for(int i = 0 ; i < resultList.size() ; i++ ){
					if(resultList.get(i).getId() == rs.getInt("item_id") ) {
						containsItem = true;
					}
				}
				if( !containsItem ) {
					//System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
					rsLength++;
                    resultList.add(new PCItem(rs.getInt("item_id"), rs.getInt("cpu_req"), rs.getInt("ram_req"),
                            rs.getInt("rom_req"), rs.getString("gfx_req"), rs.getString("os"), "",
                            rs.getString("description"), rs.getString("title"), rs.getString("item_condition")));
				}
            }
            preparedStatement.close();
            dbConnection.close();

            int tsIndex = 0;
            String[] titleStrings = title.split(" ");
            while( rsLength < 10 ) {
                if( tsIndex < titleStrings.length ) {
                    if( titleStrings[tsIndex].length() > 2 ) {
                        selectString = "SELECT * FROM pc_games WHERE ";
                        selectString = selectString + "title like '%" + titleStrings[tsIndex]+ "%'" + conditionString;
                        
                        dbConnection = getConnection();
                        preparedStatement = dbConnection.prepareStatement(selectString);
                        rs = preparedStatement.executeQuery();

                        rs.beforeFirst();
                        while(rs.next()) {
							containsItem = false;
							//System.out.println("row : id = " + rs.getInt("item_id") + ", item name = " + rs.getString("itemName") +", condition = " + rs.getString("condition") );
							for(int i = 0 ; i < resultList.size() ; i++ ){
								if(resultList.get(i).getId() == rs.getInt("item_id") ) {
									containsItem = true;
								}
							}
							if( !containsItem ) {
								//System.out.println("row : id = " + rs.getInt("PersonID") + ", first name = " + rs.getString("FirstName") );
								rsLength++;
                                resultList.add(new PCItem(rs.getInt("item_id"), rs.getInt("cpu_req"), rs.getInt("ram_req"),
                                        rs.getInt("rom_req"), rs.getString("gfx_req"), rs.getString("os"), "",
                                        rs.getString("description"), rs.getString("title"), rs.getString("item_condition")));
							}
                        }
                        
                        preparedStatement.close();
                        dbConnection.close();
                        tsIndex++;
                    } else {
                        tsIndex++;
                    }
                } else {
                    break;
                }
            }
        }
		
		return resultList;
	}

    public void insertQuestions(String email,String title, String ques) throws SQLException{

        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement("Insert into questions(email, title, question) " +
                "values(?,?,?);");
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, title);
        preparedStatement.setString(3, ques);

        preparedStatement.executeUpdate();
        preparedStatement.close();
        dbConnection.close();
    }

    public void insertAnswer(String email, int tid, String ans) throws SQLException{

        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement("Insert into answer (email, ticket_id, answer) " +
                "values(?,?,?);");
        preparedStatement.setString(1, email);
        preparedStatement.setInt(2, tid);
        preparedStatement.setString(3, ans);

        preparedStatement.executeUpdate();
        preparedStatement.close();
        dbConnection.close();
    }

    public LinkedList<Question> getQuestion() throws SQLException{

        LinkedList<Question> listOfQuestions = new LinkedList<Question>();

        //display all tuples
        String selectString = "select * from questions;";

        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
        int resLength = 0;

        //creating a resultSet
        ResultSet rs = preparedStatement.executeQuery();


        //iterate through the resultSet
        while(rs.next())
        {
            //System.out.println("row: title = " + rs.getString("Title") +
            //", question = " + rs.getString("Question") );
            resLength++;
            listOfQuestions.add(new Question(rs.getString("email"),rs.getInt("ticket_id"),
                    rs.getString("title"), rs.getString("question")));
        }
        System.out.println("Select statement executed, " + resLength + " rows retrieved");

        //close everything
        preparedStatement.close();
        dbConnection.close();

        return listOfQuestions;
    }
 
    public LinkedList<Answer> getAnswer() throws SQLException{

        LinkedList<Answer> listOfAnswer = new LinkedList<Answer>();

        //display all tuples
        String selectString = "select * from answer;";

        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
        int resLength = 0;

        //creating a resultSet
        ResultSet rs = preparedStatement.executeQuery();


        //iterate through the resultSet
        while(rs.next())
        {
            //System.out.println(" answer = " + rs.getString("answer") );
            resLength++;
            listOfAnswer.add(new Answer(rs.getString("email"),rs.getInt("ticket_id"),
                    rs.getString("answer")));
        }
        System.out.println("Select statement executed, " + resLength + " rows retrieved");

        //close everything
        preparedStatement.close();
        dbConnection.close();

        return listOfAnswer;
    }

	    public LinkedList<Question> questionSearch(String searchString) throws SQLException{

        LinkedList<Question> questionList = new LinkedList<Question>();
        String selectString = "SELECT * FROM questions WHERE title";
        int rsLength = 0;
        
        if(searchString != null)
        {
        	searchString = searchString.trim();
        }
        
        // Returns null if user has not entered anything into search
        //if( !Utilities.inputCheck((searchString) )) {
          //  return null;
        //}
 
        selectString = selectString + " LIKE '%";
        selectString = selectString + searchString;
        selectString = selectString + "%';";

        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);

        ResultSet rs = preparedStatement.executeQuery();

        while(rs.next())
        {
            rsLength++;
            questionList.add(new Question(rs.getString("email"),rs.getInt("ticket_id"),
                    rs.getString("title"), rs.getString("question")));
        }
        System.out.println("Select statement executed, " + rsLength + " rows retrieved");

        //close everything
        preparedStatement.close();
        dbConnection.close();

        return questionList;
    }
	   


	public static void main(String[] args) {
		ApplicationDAO dao = new ApplicationDAO();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);
		
		/*
		try {
			dao.insertPerson("miranda", "antonio", "123abc", "cs@rutgers.edu");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		dao.closeConnection(connection);
	}



    /*
    Auction auction;
    Bid current_bid;
    Bid new_bid;

    // If the new bids limit is higher than the limit of the old bid, the owner of the new bid will be the owner of the
    // highest bid and the current highest bid will be the limit of the old bid
    if( current_bid.limit < new_bid.limit ) {
        auction.highest_bid = current_bid.limit;
        auction.highest_bidder = new_bid.owner;
    // If the new bid limit is NOT higher than the limit of the old bid, the owner of the highest bid will still be the
    // same person, however, the new limit will be the limit of the new bid.
    } else {
        auction.highest_bid = new_bid.limit;
    }
    */
    
	public void insertBid(String auctionId, String amount, String secretLimit, String email) throws SQLException{
		
		java.sql.Timestamp time = getThaTimestamp();
        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement("Insert into bids (email, auction_id, amount, secret_limit, bid_timestamp) " +
                "values(?,?,?,?,?);");
        preparedStatement.setString(1, email);
        preparedStatement.setInt(2, Integer.parseInt(auctionId));
        preparedStatement.setInt(3,	Integer.parseInt(amount));
        preparedStatement.setInt(4, Integer.parseInt(secretLimit));
        preparedStatement.setTimestamp(5, time);

        preparedStatement.executeUpdate();
        preparedStatement.close();
        dbConnection.close();
    }
	
	
	public Bid addNewBid(String auctionId, String amount, String secretLimit, String email) throws SQLException{

        Bid currentBid;
        Bid newBid;
        int amountInt;
        int secretLimitInt;
        int auctionIdInt;
		String selectString;

        if( !Utilities.inputCheck(auctionId ) ) {
            System.out.println("auctionId failed inputcheck");
            return null;
        } else if( !Utilities.inputCheck(amount) ) {
            System.out.println("amount failed inputcheck");
            return null;
        } else if( !Utilities.inputCheck(email) ) {
            System.out.println("email failed inputcheck");
            return null;
        }

        try{
            amountInt = Integer.parseInt(amount);
            secretLimitInt = Integer.parseInt(secretLimit);
            auctionIdInt = Integer.parseInt(auctionId);
        } catch (NumberFormatException e ) {
            System.out.println(" is not number");
            return null;
        }

        newBid = new Bid(auctionIdInt, amountInt, secretLimitInt, email, new java.sql.Timestamp(System.currentTimeMillis()) );

		selectString = "SELECT email, MAX(amount)amount, auction_id, bid_timestamp, secret_limit FROM bids WHERE auction_id="
				+ auctionIdInt + ";";

        Connection dbConnection = getConnection();
        PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);

        ResultSet rs = preparedStatement.executeQuery();

        if( rs.next() ) {
            currentBid = new Bid(rs.getInt("auction_id"), rs.getInt("amount"), rs.getInt("secret_limit"), rs.getString("email"),
                    rs.getTimestamp("bid_timestamp"));
        } else {
            return null;
        }
        //System.out.println("Select statement executed, rows retrieved");

        preparedStatement.close();
        dbConnection.close();

        if( currentBid.getSecretLimit() < newBid.getSecretLimit() ) {
            newBid.setAmount(currentBid.getSecretLimit());
            return newBid;
        } else {
            if( currentBid.getAmount() < newBid.getSecretLimit() ) {
                currentBid.setAmount(newBid.getSecretLimit());
            }
            return currentBid;
        }
    }

        
        public Bid getHighestBid(String auctionId) throws SQLException {

    		Bid highestBid;
    		String selectString;
    		int auctionIdInt;

    		try{
    			auctionIdInt = Integer.parseInt(auctionId);
    		} catch (NumberFormatException e ) {
    			System.out.println(" is not number");
    			return null;
    		}

    		selectString = "SELECT email, MAX(amount)amount, auction_id, bid_timestamp, secret_limit FROM bids WHERE auction_id="
    				+ auctionIdInt;

    		Connection dbConnection = getConnection();
    		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);

    		ResultSet rs = preparedStatement.executeQuery();

            if( rs.next() ) {
                highestBid = new Bid(rs.getInt("auction_id"), rs.getInt("amount"), rs.getInt("secret_limit"), rs.getString("email"),
                        rs.getTimestamp("bid_timestamp"));
            } else {
                return null;
            }
    		//System.out.println("Select statement executed, rows retrieved");

    		preparedStatement.close();
    		dbConnection.close();

    		return highestBid;
    	}

        public SalesReport createSalesReport() throws SQLException {
            SalesReport salesReport;
            long totalEarnings = 0;
            int userCount = 0;
            int pcItemCount =0;
            long pcItemEarnings=0;
            int psItemCount=0;
            long psItemEarnings=0;
            int xbItemCount=0;
            long xbItemEarnings=0;
            String bestCustomerEmail="";
            long bestCustomerSpent=0;

            String selectString;
            Connection dbConnection;
            PreparedStatement preparedStatement;
            ResultSet rs;

            java.sql.Timestamp currentTime = new java.sql.Timestamp(System.currentTimeMillis());

            /**
             * BLOCK FOR TOTAL EARNINGS
             */
            selectString = "SELECT SUM(amount)total FROM (SELECT MAX(amount) amount FROM bids, auctions GROUP BY bids.auction_id)t1;";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
            	totalEarnings = rs.getInt("total");	
            }
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();

            /**
             * BLOCK FOR USER COUNT
             */
            selectString = "SELECT COUNT(email)user_count FROM accounts;";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
            	userCount = rs.getInt("user_count");	
            }
            
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();

            /**
             * BLOCK FOR PC ITEM COUNT
             */
            selectString = "SELECT COUNT(item_id) pc_count FROM pc_games;";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
            	pcItemCount = rs.getInt("pc_count");	
            }
            
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();

    		/**
    		 * BLOCK FOR PC ITEM TOTAL EARNINGS
    		 */
    		selectString="SELECT SUM(amount)total FROM (SELECT MAX(B.amount) amount FROM bids B, auctions A, pc_games I WHERE I.item_id=A.item_id AND A.auction_id=B.auction_id)t2;";
    		dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
            	pcItemEarnings = rs.getInt("total");	
            }
            
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();
    		
            /**
             * BLOCK FOR PLAYSTATION ITEM COUNT
             */
            selectString = "SELECT COUNT(item_id)ps_count FROM ps_games;";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                psItemCount = rs.getInt("ps_count");

            }
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();
    		
    		/**
    		 * BLOCK FOR PLAYSTATION ITEM TOTAL EARNINGS
    		 */
    		selectString="SELECT SUM(amount) total FROM (SELECT MAX(B.amount)amount FROM bids B, auctions A, ps_games I WHERE I.item_id=A.item_id AND A.auction_id=B.auction_id)t3;";
    		dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                psItemEarnings = rs.getInt("total");

            }
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();

            /**
             * BLOCK FOR XBOX ITEM COUNT
             */
            selectString = "SELECT COUNT(item_id)xb_count FROM xb_games;";
            dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                xbItemCount = rs.getInt("xb_count");

            }
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();
    		
    		/**
    		 * BLOCK FOR XBOX ITEM TOTAL EARNINGS
    		 */
    		selectString="SELECT SUM(amount) total FROM (SELECT MAX(B.amount)amount FROM bids B, auctions A, xb_games I WHERE I.item_id=A.item_id AND A.auction_id=B.auction_id)t4;";
    		dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                xbItemEarnings = rs.getInt("total");

            }
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();
    		
    		/**
    		 * BIGGEST SPENDER
    		 */
    		 
    		selectString="SELECT MAX(bid_sum) total_spent, email FROM (SELECT SUM(amount) bid_sum, email FROM (SELECT MAX(amount)amount, email FROM bids GROUP BY auction_id)t6 GROUP BY email)t5;";
    		dbConnection = getConnection();
            preparedStatement = dbConnection.prepareStatement(selectString);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
            	bestCustomerSpent = rs.getInt("total_spent");
                bestCustomerEmail = rs.getString("email");	
            }
            System.out.println("Select statement executed, rows retrieved");
            preparedStatement.close();
            dbConnection.close();
    		
    		salesReport = new SalesReport(totalEarnings, userCount, pcItemCount, pcItemEarnings, psItemCount,
    				psItemEarnings, xbItemCount, xbItemEarnings, bestCustomerEmail, bestCustomerSpent);

            return salesReport;
        }

        public int getMinBid(String auctionID) throws SQLException{
        	Connection dbConnection = getConnection();
        	int result = -1;
        	String selectString = "select min(amount)MaxAmount from bids where auction_id=" + Integer.parseInt(auctionID) + ";";
        	PreparedStatement ps = dbConnection.prepareStatement(selectString);
        	ResultSet rs = ps.executeQuery();
        	while(rs.next()){
        		result = rs.getInt("MaxAmount");
        	}
        	
        	return result;
        	
        }
        
        public int getMaxBid(String auctionID) throws SQLException{
        	Connection dbConnection = getConnection();
        	int result = -1;
        	String selectString = "select min(amount)MaxAmount from bids where auction_id=" + Integer.parseInt(auctionID) + ";";
        	PreparedStatement ps = dbConnection.prepareStatement(selectString);
        	ResultSet rs = ps.executeQuery();
        	while(rs.next()){
        		result = rs.getInt("MaxAmount");
        	}
        	
        	return result;
        	
        }

}
