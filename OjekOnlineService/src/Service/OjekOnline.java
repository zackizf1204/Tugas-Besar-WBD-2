package Service;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.Endpoint;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebService()
public class OjekOnline {

  private Database dbaccess = new Database();

  public static final String USERNAME = "username";
  public static final String NAME = "name";
  public static final String IS_ACTIVE = "is_active";
  public static final String PREF_LOCATION = "preferred_location";
  public static final String AVG_RATING = "avg_rating";
  public static final String COUNT_RATING = "count_rating";

  public static final String USER_CUSTOMER = "user_customer";
  public static final String USER_DRIVER = "user_driver";
  public static final String ORIGIN = "origin";
  public static final String DESTINATION = "destination";
  public static final String DATE = "date";
  public static final String RATING = "rating";
  public static final String COMMENT = "comment";

  private String DB_URL = "jdbc:mysql://localhost:3306/pr_ojek";
  private String DB_USERNAME = "root";
  private String DB_PASSWORD = "";

  private Connection connection = null;
  private Statement statement = null;



  @WebMethod
  public List<DataDriver> retrieveDrivers() {
    ArrayList<DataDriver> retval = new ArrayList();

    ResultSet result = null;
    Connection conn = null;
    final String query = "SELECT * FROM customer NATURAL JOIN driver";

    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    try {
      conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
      statement = conn.createStatement();
      result = statement.executeQuery(query);
      while (result.next()) {
        DataDriver driver = new DataDriver();
        driver.setUsername(result.getString("username"));

        driver.setName(result.getString("name"));

        driver.setIs_active(result.getInt("is_active"));

        driver.setPrefloc(result.getString("preferred_location"));
        if(driver.getIs_active()!=0){
          retval.add(driver);
        }
      }
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return retval;
  }

  @WebMethod
  public DataDriver retrieveDriverRating(String username) {
    JSONObject retrievedRating = new JSONObject();
    DataDriver driver = new DataDriver();
    ResultSet result = null;
    Connection conn = null;
    final String query = "SELECT AVG(`rating`) AS " + AVG_RATING + ", COUNT(`rating`) AS "
            + COUNT_RATING + " FROM `pesanan` WHERE `user_driver`=\'" + username + "\'";

    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    try {
      conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
      statement = conn.createStatement();
      result = statement.executeQuery(query);
      if (result.next()) {
        if (result.getString(COUNT_RATING) != null) {
          driver.setAvgrating(result.getFloat("avg_rating"));

          driver.setRatingcount(result.getInt("count_rating"));
        }
      }
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return driver;
  }

  @WebMethod
  public int saveOrder(DataOrder order) {
    JSONParser parser = new JSONParser();
    ResultSet result = null;
    Connection conn = null;
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    try {
      conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
      statement = conn.createStatement();
      if (order != null) {
        String user_customer = order.getUser_customer();
        String user_driver = order.getUser_driver();
        String origin = order.getOrigin();
        String destination = order.getDestination();
        String date = order.getDate();
        int rating = order.getRating();
        String comment = order.getComment();

        final String query = "INSERT INTO `pesanan` VALUES ('"
                + user_customer + "\', \'" + user_driver + "\', \'"
                + origin + "\', \'" + destination + "\', \'" + date + "\', \'"
                + rating + "\', \'" + comment + "\', FALSE, FALSE)";

        statement.executeUpdate(query);
      }
      conn.close();
    }  catch (SQLException e) {
      e.printStackTrace();
    }
    return 0;
  }

  @WebMethod
  public boolean validate(String username, String token, String string_url) {
    try {
      URL url = new URL(string_url + "/validateservlet?username=" + username + "&token=" + token);
      HttpURLConnection connection = (HttpURLConnection) url.openConnection();
      connection.setDoOutput(true);
      connection.setRequestMethod("GET");

      if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
          response.append(inputLine);
        }

        try {
          JSONParser parser = new JSONParser();
          JSONObject retval = (JSONObject) parser.parse(response.toString());
          return retval.get("status").equals("valid");
        } catch (ParseException e) {
          e.printStackTrace();
        }
      }
    } catch (MalformedURLException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }

    return false;
  }


  @WebMethod
  public String search_customer_name(String query) {
    String customername = new String();
    String url = "jdbc:mysql://localhost:3306/pr_ojek";
    String username = "root";
    String password = "";
    Connection conn = null;
    //Create Java Statement
    Statement st = null;
    ResultSet rs = null;
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    try{
      conn = DriverManager.getConnection(url, username, password);
      st = conn.createStatement();
      rs = st.executeQuery(query);
      if(rs.next()){
        customername= rs.getString("name");
      }
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return customername;
  }

  @WebMethod
  public String profileData(String username) {
    JSONObject outputJson = new JSONObject();
    String name, email, phoneNumber, prefLocation;
    boolean driver;
    float rating = 0;
    int totalvotes = 0;

    String url = "jdbc:mysql://localhost:3306/pr_ojek";
    String user = "root";
    String password = "";
    Connection conn = null;
    //Create Java Statement
    Statement st = null;
    ResultSet rs = null;
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    String query = "SELECT * FROM customer NATURAL JOIN driver WHERE username =\"" + username + "\"";
    try {
      conn = DriverManager.getConnection(url, user, password);
      st = conn.createStatement();
      rs = st.executeQuery(query);
      if (rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
        phoneNumber = rs.getString("phone_number");
        driver = rs.getBoolean("is_active");
        prefLocation = rs.getString("preferred_location");
        query = String.format("SELECT AVG(rating) AS avgrating, COUNT(rating) AS countrating FROM pesanan WHERE user_driver=\"%s\"" , username);
        rs = st.executeQuery(query);
        if (rs.next()) {
          rating = rs.getFloat("avgrating");
          totalvotes = rs.getInt("countrating");
        }

        outputJson.put("username", username);
        outputJson.put("name", name);
        outputJson.put("email", email);
        outputJson.put("phonenumber", phoneNumber);
        outputJson.put("driver", driver);
        outputJson.put("preferredloc", prefLocation);
        outputJson.put("rating", rating);
        outputJson.put("totalvotes", totalvotes);
      }
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    String StringJSON = outputJson.toJSONString();

    return StringJSON;
  }

  @WebMethod
  public ArrayList<DataHistory> search_history(String query) {
    ArrayList<DataHistory> history_list = new ArrayList();
    //Create Java Statement
    Statement st = null;
    ResultSet rs = null;
    boolean empty;
    Connection conn = null;
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    try{
      conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
      st = conn.createStatement();
      rs = st.executeQuery(query);

      while((rs!=null)&&(rs.next())){
        empty = true;
        DataHistory history = new DataHistory();
        history.setUser_customer(rs.getString("user_customer"));
        history.setUser_driver(rs.getString("user_driver"));
        history.setOrigin(rs.getString("origin"));
        history.setDestination(rs.getString("destination"));
        history.setDate(rs.getString("date"));
        history.setRating(rs.getInt("rating"));
        history.setComment(rs.getString("comment"));
        history.setIs_hidden_customer(rs.getInt("is_hidden_customer"));
        history.setIs_hidden_driver(rs.getInt("is_hidden_driver"));
        history_list.add(history);
      }
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return history_list;
  }

  @WebMethod
  public int update_tabel(String query) {
    int updateSuccess = 0;
    //Create Java Statement
    Statement st = null;
    Connection conn = null;
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    try{
      conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
      st = conn.createStatement();
      updateSuccess = st.executeUpdate(query);
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return updateSuccess;
  }

  @WebMethod
  public int update_locations(String query) {
    //Create Java Statement
    int result = 0;
    Statement st = null;
    Connection conn = null;
    try {
      Class.forName("com.mysql.jdbc.Driver") ;
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    try{
      conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
      st = conn.createStatement();
      st.executeUpdate(query);
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }


  public static void main(String[] argv) {
    Object implementor = new OjekOnline();
    String address = "http://localhost:8082/OjekOnline";
    Endpoint.publish(address, implementor);
  }
}

