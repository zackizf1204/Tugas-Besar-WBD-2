package Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
  //Atribut
  private String url = "jdbc:mysql://localhost:3306/pr_ojek";
  private String username = "root";
  private String password = "";
  Connection conn = null;

  //Method
  public Database() {
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    try {
      conn = DriverManager.getConnection(url, username, password);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public Connection getConn() {
    return conn;
  }
}

