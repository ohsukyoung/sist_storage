package com.util;

import java.sql.Connection;

public class DBConn2
{
	public static Connection dbConn;
	
	public static Connection getConnection()
	{
		if(dbConn == null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "scott";
				String pwd = "tiger";
				Class.forName("oralce.jdbc.driver.OracleDriver");
				
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}
}
