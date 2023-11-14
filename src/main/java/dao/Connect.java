package dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class Connect {
	private Connection con;
	private static Connect c;
	private Properties prop=new Properties();
	private  InputStream input=null;
	private String url;
	private String dbName;
	private String user;
	private String pwd;
	private Connect() {
		try {
			DriverManager.registerDriver( new com.mysql.jdbc.Driver());
			input = this.getClass().getClassLoader().getResourceAsStream("config.properties");
			prop.load(input);
			url=prop.getProperty("url")+prop.getProperty("DB-NAME");
			user=prop.getProperty("user");
			pwd=prop.getProperty("password");
			con=DriverManager.getConnection(url,user,pwd);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
	public static synchronized Connect getConnect() {
		if(c==null)
			c=new Connect();	
		return c;
	}
	
	public Connection getConnection() {
			return con;
	}

}
