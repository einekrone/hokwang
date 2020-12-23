package com.hokwang.config;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class DBConfiguration {
	final static String DB_URL = "jdbc:oracle:thin:@hokwangdb_high?TNS_ADMIN=C://dbcon//Wallet_hokwangDB";
	final static String DB_USER = "admin";
	final static String DB_PASSWORD = "Rhkdgh123456789";

	// 데이터소스 등록
	@Bean(destroyMethod = "close")
	public BasicDataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
		dataSource.setUrl(DB_URL);
		dataSource.setUsername(DB_USER);
		dataSource.setPassword(DB_PASSWORD);
		dataSource.setMaxTotal(6);
		dataSource.setDefaultAutoCommit(false);
		return dataSource;
	}

	// 트랜잭션 매니저 등록
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
}
