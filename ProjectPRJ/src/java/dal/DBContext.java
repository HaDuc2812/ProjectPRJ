package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=WineShop2";
    private static final String USERNAME = "sa";           // Update with your username
    private static final String PASSWORD = "12345";  // Update with your password

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("SQLServer JDBC Driver not found.", e);
        }
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    private final String serverName = "localhost";
    private final String dbName = "WineShop2";
    private final String portNumber ="9999";
    private final String instance="";
    private final String userID = "sa";
    private final String password = "123";
//    public static void main(String[] args) {
//        try{
//            System.out.println(new DBContext());
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//    }
}
