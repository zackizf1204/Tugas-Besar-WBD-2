package Service;

import java.util.Date;

public class DataHistory {
  private String user_customer;
  private String user_driver;
  private String origin;
  private String destination;
  private String date;
  private int rating;
  private String comment;
  private int is_hidden_customer;
  private int is_hidden_driver;

  public DataHistory() {
  }

  public String getUser_customer() {
    return user_customer;
  }

  public void setUser_customer(String user_customer) {
    this.user_customer = user_customer;
  }

  public String getUser_driver() {
    return user_driver;
  }

  public void setUser_driver(String user_driver) {
    this.user_driver = user_driver;
  }

  public String getOrigin() {
    return origin;
  }

  public void setOrigin(String origin) {
    this.origin = origin;
  }

  public String getDestination() {
    return destination;
  }

  public void setDestination(String destination) {
    this.destination = destination;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public int getRating() {
    return rating;
  }

  public void setRating(int rating) {
    this.rating = rating;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public int getIs_hidden_customer() {
    return is_hidden_customer;
  }

  public void setIs_hidden_customer(int is_hidden_customer) {
    this.is_hidden_customer = is_hidden_customer;
  }

  public int getIs_hidden_driver() {
    return is_hidden_driver;
  }

  public void setIs_hidden_driver(int is_hidden_driver) {
    this.is_hidden_driver = is_hidden_driver;
  }
}
