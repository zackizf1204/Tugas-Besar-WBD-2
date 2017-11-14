package identityservice;

import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.sql.*;

@WebServlet(name = "UserServlet", urlPatterns = "/userservlet/*")
public class UserServlet extends HttpServlet {
  private String url = "jdbc:mysql://localhost:3306/pr_ojek";
  private String username = "root";
  private String password = "";

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(url, username, password);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    String url = request.getPathInfo();
    String[] str = url.split("/");
    String query = String.format("SELECT * FROM `token` WHERE username=\"%s\"", str[1]);
    //Create Java Statement
    Statement st = null;
    try {
      st = conn.createStatement();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    //Execute query
    ResultSet rs = null;
    JSONObject json = new JSONObject();
    response.setContentType("text/plain");
    PrintWriter out = response.getWriter();
    try {
      rs = st.executeQuery(query);
      if (rs.next()) {
        json.put("username", rs.getString("username"));
        json.put("token", rs.getString("token"));
        json.put("expirytime", rs.getString("expirytime"));
        out.print(json.toJSONString());
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
