package identityservice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name = "LoginServlet", urlPatterns = {"/loginservice"})
public class LoginServlet extends HttpServlet {
  private RandomGen stringToken = new RandomGen(10);
  private String url = "jdbc:mysql://localhost:3306/pr_ojek";
  private String username = "root";
  private String password = "";

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //Form Response
    //Connect to Database
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
    String query = String.format("SELECT username FROM `customer` WHERE username=\"%s\" AND password =\"%s\"", request.getParameter("username"), request.getParameter("password"));
    //Create Java Statement
    Statement st = null;
    try {
      st = conn.createStatement();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    //Execute query
    ResultSet rs = null;
    try {
      rs = st.executeQuery(query);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    try {
      if (rs.next()) {
        //Token Generator for Login
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
        //Set session attr for username, token, expirytime

        /*HttpSession session;
        if (request.getSession(false) == null) {
          session = request.getSession();
          session.setAttribute("username", request.getParameter("username"));
          session.setAttribute("token", token);
          session.setAttribute("expirytime", time);
        } else {
          session = request.getSession(false);
          session.setAttribute("username", request.getParameter("username"));
          session.setAttribute("token", token);
          session.setAttribute("expirytime", time);
        }*/

        //Check Driver
        query = String.format("SELECT username FROM `driver` WHERE username=\"%s\"", request.getParameter("username"));
        rs = st.executeQuery(query);
        if (rs.next()) {
          response.sendRedirect("http://localhost:8080/OjekApp/login/login.jsp?username=" + request.getParameter("username"));
          //response.sendRedirect("http://localhost:8080/OjekApp/profile/index.jsp?username=" + request.getParameter("username"));
        } else {
          response.sendRedirect("http://localhost:8080/OjekApp/login/login.jsp?username=" + request.getParameter("username") + "&token=" + token + "&expirytime=" + time);
          //response.sendRedirect("http://localhost:8080/OjekApp/profile/index.jsp?username=" + request.getParameter("username"));
        }
      } else {
        response.sendRedirect("http://localhost:8080/OjekApp/login/index.jsp?error=true");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    try {
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //Get response
    response.setContentType("text/html");
    PrintWriter writer = response.getWriter();
    writer.println("<html> <body>");
    writer.println("<h3> NOTHING <h3>");
    writer.println("<hr />");
    writer.println("</body> </html>");
  }
}
