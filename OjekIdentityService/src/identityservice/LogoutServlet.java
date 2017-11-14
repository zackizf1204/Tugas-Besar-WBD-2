package identityservice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logoutservlet"})
public class LogoutServlet extends HttpServlet {
  private final String DB_URL = "jdbc:mysql://localhost:3306/pr_ojek";
  private final String DB_USERNAME = "root";
  private final String DB_PASSWORD = "";

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

      final String query = "DELETE FROM token WHERE token = \'" +
              req.getParameter("token")+ "\' AND username = \'" +
              req.getParameter("username")+ "\'";

      PreparedStatement statement = connection.prepareStatement(query);
      statement.executeUpdate(query);

    } catch (SQLException e) {
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    HttpSession session = req.getSession();
    session.invalidate();

    resp.sendRedirect("http://localhost:8080/OjekApp/login");
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

  }
}
