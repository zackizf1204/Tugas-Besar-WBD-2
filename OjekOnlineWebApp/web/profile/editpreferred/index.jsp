<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="org.json.simple.parser.JSONParser" %><%--
  Created by IntelliJ IDEA.
  User: Hishamlazuardi
  Date: 04/11/2017
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<head>
  <title> Edit Preffered Location </title>
  <link rel="stylesheet" type="text/css" href="../../style/editpreferred.css">
  <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet">
</head>
<script type="text/javascript" src="allfunc.js"></script>
<body>
<h1>EDIT PREFERRED LOCATIONS</h1>
<table width="100%" border="">
  <tr>
    <th align="center" width="10%"> No</th>
    <th align="center" width="70%"> Location </th>
    <th colspan ="2" align="center" width="20%"> Actions </th>
  </tr>
  <%
    OjekOnlineService service = new OjekOnlineService();
    OjekOnline port = service.getOjekOnlinePort();
    String url_string = "http://localhost:8081/IdentityService/";
    if (session.getAttribute("username") == null || session.getAttribute("token") == null) {
      response.sendRedirect("../invalidrequest");
    } else {
      if (!port.validate(session.getAttribute("username").toString(), session.getAttribute("token").toString(), url_string)) {
        response.sendRedirect("../invalidrequest");
      }
    }
    String username = session.getAttribute("username").toString();
    String tempjson = port.profileData(username);
    JSONParser parser = new JSONParser();
    JSONObject json = (JSONObject) parser.parse(tempjson);
  %>
  <form id="edit-location-form" action="update.jsp?username=<%= username %>" method="post">
    <%
      String preflocation = "";
      if (json.get("preferredloc") != null) {
        preflocation = json.get("preferredloc").toString();
        String[] location = preflocation.split(",");
        if (location.length > 0) {
          for (int i = 1; i < location.length; i++) {
    %>
    <tr>
      <td align="center"><%= i %></td>
      <td align="left">
        <input class="location-idx" id="location-<%= i %>" name="updated_locations[]" value="<%= location[i] %>" readonly>
      </td>
      <td align="left-right">
        <img id="edit-<%= i %>" src="pencil.png" class= "pencil" onclick="edit(<%= i %>)">
        <img id="delete-<%= i %>" src="cross.png" class= "cross" onclick="deleteLocation(<%= i %>)">
      </td>
    </tr>
    <%
          }
        }
      }
    %>
    <input id="delete-input" type="hidden" name="delete_this" value="-1">
  </form>
</table>
<h6>ADD NEW LOCATION:</h6>
<form method="post" action="submit.jsp?username=<%= username %>">
  <div class="input-location">
    <div class="input-container">
      <input type="text" name="newLocation" value="">
      <input class="hidden-input" name="preferred_location" value="<%= preflocation %>">
    </div>
    <div class="button-container">
      <button class="green-button" type="submit">ADD</button>
    </div>
  </div>
  <br>
</form>
<div class="input_button">
  <button class="red-button" type="button" onclick="back('<%= username %>')">BACK</button>
</div>
</body>
</html>
