package nwsuaf.plvds.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DataSource {
	private static Connection conn;

	private DataSource() {
		Properties properties = new Properties();
		try {
			properties.load(this.getClass().getResourceAsStream("/mysql.properties"));
			String DRIVER = properties.getProperty("driver");
			String URL = properties.getProperty("url");
			String USER = properties.getProperty("user");
			String PASSWORD = properties.getProperty("password");
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch(IOException e){
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		if (conn == null) {
			new DataSource();
		}
		return conn;
	}
}
