package com.doa;

import com.zaxxer.hikari.HikariDataSource;

/**
 * This class provides a configuration for the HikariCP DataSource, which is used for
 * managing database connections.
 */
public class DataBaseConfig {
	
	private static HikariDataSource dataSource;
	static {
		// Create a new HikariCP DataSource and configure it.
		HikariDataSource ds = new HikariDataSource();
		ds.setJdbcUrl("jdbc:mysql://localhost:3306/adarsh");
		ds.setUsername("root");
		ds.setPassword("Adarsh@123");
		ds.setMinimumIdle(1);
		ds.setMaximumPoolSize(100);
		
		dataSource = new HikariDataSource(ds);
	}
	
	/**
	 * Gets the configured HikariCP DataSource.
	 * 
	 * returns  The HikariCP DataSource for managing database connections.
	 */
	public static HikariDataSource getDataSource() {
		return dataSource;
	}
}
