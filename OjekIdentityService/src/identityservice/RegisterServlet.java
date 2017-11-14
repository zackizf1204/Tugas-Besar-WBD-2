package identityservice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/registerservice"})
public class RegisterServlet extends HttpServlet {
  private RandomGen stringToken = new RandomGen(10);
  private String url = "jdbc:mysql://localhost:3306/pr_ojek";
  private String username = "root";
  private String password = "";

  /* Prosedur untuk menangani request POST yaitu pengisian form pada register*/
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //Form Response
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

    String query = "INSERT INTO customer VALUES (\'" + request.getParameter("username") + "\', \'" + request.getParameter("email") + "\', \'" + request.getParameter("password") + "\', \'" + request.getParameter("name") + "\', \'" + request.getParameter("phoneNumber") + "\')"; //Something

    boolean isDriver = false;
    //Execute query
    int querystatus;
    try {
      querystatus = st.executeUpdate(query);
      if (request.getParameter("driver") != null) {
        query = "INSERT INTO driver VALUES (\'" + request.getParameter("username") + "\', TRUE, NULL)";
        querystatus = st.executeUpdate(query);
        if (querystatus != -1)
          isDriver = true;
      } else {
        query = "INSERT INTO driver VALUES (\'" + request.getParameter("username") + "\', FALSE, NULL)";
        querystatus = st.executeUpdate(query);
      }

      ///Token Generator for Register
      //Pengguna telah teridentifikasi sebagai customer
      Calendar calendar = Calendar.getInstance();
      //Set timestamp token, agar dapat dicek apakah token valid untuk waktu 10 menit
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      Date date = calendar.getTime();
      date.setMinutes(date.getMinutes() + 10);
      String time = format.format(date);
      //Menyimpan username, token, expirytime ke dalam database
      String token = stringToken.nextString();
      String insertToken = String.format("INSERT INTO token VALUES (\"%s\", \"%s\", \"%s\")", request.getParameter("username"), token, time);
      st.executeUpdate(insertToken);
      conn.close();

      //Set session attr for username, token, expirytime
      /*if (request.getSession(false) == null) {
        HttpSession session = request.getSession();
        session.setAttribute("username", request.getParameter("username"));
        session.setAttribute("token", token);
        session.setAttribute("expirytime", time);
      } else {
        HttpSession session = request.getSession(false);
        session.setAttribute("username", request.getParameter("username"));
        session.setAttribute("token", token);
        session.setAttribute("expirytime", time);
      }*/
    } catch (SQLException e) {
      e.printStackTrace();
    }

    if (isDriver) {
      response.sendRedirect("http://localhost:8080/OjekApp/profile/index.jsp?username=" + request.getParameter("username"));
    } else {
      response.sendRedirect("http://localhost:8080/OjekApp/order/index.jsp?username=" + request.getParameter("username"));
    }
  }

  /* Prosedur untuk menangani request GET untuk mengecek username dan email dengan menggunakan AJAS*/
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //AJAX request for Username and Email
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
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    String column = request.getParameter("column");
    String value = request.getParameter("str");

    String query = "SELECT " + column + " FROM customer WHERE " + column + "=\'" + value + "\'";

    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    PrintWriter writer = response.getWriter();
    //Execute query
    ResultSet rs;
    try {
      rs = st.executeQuery(query);
      if (rs.next()) {
        writer.print("FALSE");
      } else {
        writer.print("TRUE");
      }
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
