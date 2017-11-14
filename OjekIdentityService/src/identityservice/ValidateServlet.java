package identityservice;

import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name = "ValidateServlet", urlPatterns = {"/validateservlet"})
public class ValidateServlet extends HttpServlet {
  private String url = "jdbc:mysql://localhost:3306/pr_ojek";
  private String username = "root";
  private String password = "";

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //Connect to Database
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    //Create Java Statement
    Connection conn = null;
    Statement st = null;
    try {
      conn = DriverManager.getConnection(url, username, password);
      if (conn != null) {
        st = conn.createStatement();
      } else {
        System.out.println("Cannot Connect to Database");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    String query = "SELECT * FROM token WHERE username = \"" + request.getParameter("username") + "\" AND token = \"" + request.getParameter("token") + "\"";
    ResultSet rs = null;
    try {
      rs = st.executeQuery(query);
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      PrintWriter writer = response.getWriter();
      JSONObject jsonObject = new JSONObject();
      if (rs.next()) {
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        Date date1 = rs.getTimestamp("expirytime");
        if (date.after(date1)) {
          jsonObject.put("status", "expired");
        } else {
          jsonObject.put("status", "valid");
        }
      } else {
        jsonObject.put("status", "invalid");
      }
      writer.print(jsonObject.toJSONString());
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
