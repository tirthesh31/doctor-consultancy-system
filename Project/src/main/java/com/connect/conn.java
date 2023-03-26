package com.connect;

import java.sql.*;

public class conn {
	public Connection connect(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medic","root","root");
			
			return con;
		}catch(Exception e) {
			return null;
		}
	}
	public boolean insert(String tblName, String[] columnNames, String[] values)
	{
	try {
	Connection con = new conn().connect();

	int clen = columnNames.length;
	int vlen = values.length;

		if(clen == vlen)
		{
			System.out.println("hii");
			String query = "INSERT INTO ";
		
			query += tblName + " (" ;
			for(int i = 0; i < columnNames.length; i++)
			{
				query += columnNames[i];
		
				if(i < clen - 1)
				{
					query += ", ";
				}
		
			}
		
			query += ") values (";
		
			for(int i = 0; i < values.length; i++)
			{
				query += "'" + values[i] + "'";
			
				if(i < vlen - 1)
				{
				query += ", ";
				}	
			}
		
			query += ");";
		
			Statement st = con.createStatement();
			st.executeUpdate(query);
		
			con.close();
			return true;
		}
		else {
			System.out.println("helo");
			return false;
		}
	}
	catch(Exception e)
	{
		return false;
	}
}

	public boolean insert(String tblName, int values)
	{
	try {
	Connection con = new conn().connect();


			System.out.println("hii");
			String query = "INSERT INTO " + tblName + " (did,vali) values (" + values + ","+ false + ");";
		
			
			Statement st = con.createStatement();
			st.executeUpdate(query);
		
			con.close();
			return true;
		
	}
	catch(Exception e)
	{
		System.out.println(e);
		return false;
	}
}
	public boolean update(String tblName, String[] columnNames, String[] values, String whereColumnName, String whereColumnValue)
	{
		try {
			Connection con = new conn().connect();
		
			int clen = columnNames.length;
			int vlen = values.length;
		
			if(clen == vlen){
				String query = "UPDATE ";
			
				query += tblName + " set " ;
				for(int i = 0; i < columnNames.length; i++)
				{
					query += columnNames[i] + " = '" + values[i] +"'";
				
					if(i < clen - 1)
					{
					query += ", ";
					}
			
				}
				query += " where "+whereColumnName+" = "+whereColumnValue+";";
			
				Statement st = con.createStatement();
				st.executeUpdate(query);
			
				con.close();
			
				return true;
			}
			else {
				return false;
			}
		}
		catch(Exception e)
		{
			return false;
		}
	}

	public ResultSet select(String tblName)
	{

	try {
	Connection con = new conn().connect();

	String query = "SELECT * FROM " + tblName + ";" ;

	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(query);

	return rs;
	}
	catch(Exception e)
	{
	return null;
	}
	}
	
	public ResultSet select(String tblName,int no)
	{

	try {
	Connection con = new conn().connect();

	String query = "SELECT * FROM " + tblName + " ORDER BY id DESC LIMIT " + no + ";";

	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(query);

	return rs;
	}
	catch(Exception e)
	{
	return null;
	}
	}

	public ResultSet select(String tblName, String[] columnNames, String[] values)
	{
	int clen = columnNames.length;
	int vlen = values.length;


	if(clen == vlen)
	{
	try {
	Connection con = new conn().connect();

	String query = "SELECT * FROM " + tblName + " where " ;

	for(int i = 0; i < clen; i++)
	{
	query += columnNames[i] + "='" + values[i] + "'";

	if(i < clen - 1)
	{
	query += "and ";
	}
	}

	// query += ";";

	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(query);

	// return query;
	return rs;
	}
	catch(Exception e)
	{
	return null;
	}
	}
	else {
	return null;
	}
	}
	
	public boolean delete(String tblName,String column,int no)
	{

	try {
	Connection con = new conn().connect();

	String query = "DELETE FROM " + tblName + " where " + column + " = " + no + ";";

	Statement st = con.createStatement();
	st.executeUpdate(query);

	return true;
	}
	catch(Exception e)
	{
	return false;
	}
	}
}
