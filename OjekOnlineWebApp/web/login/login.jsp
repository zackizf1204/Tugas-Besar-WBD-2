<%@ page import="java.util.Enumeration" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="consumer.RestConsumer" %>
<%--
  Created by IntelliJ IDEA.
  User: Hishamlazuardi
  Date: 08/11/2017
  Time: 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login Page</title>
</head>
<body>
  <%
    String username = "", token = "", time = "";
    RestConsumer consume = new RestConsumer("http://localhost:8081/IdentityService/userservlet", "/" + request.getParameter("username"));
    if (request.getParameter("username") != null) {
      consume.execute();
      JSONObject json = consume.getOutput();
      if (json != null) {
        username = json.get("username").toString();
        token = json.get("token").toString();
        time = json.get("expirytime").toString();
        if (request.getSession(false) == null) {
          session = request.getSession();
          session.setAttribute("username", username);
          session.setAttribute("token", token);
          session.setAttribute("exptime", time);
        } else {
          session = request.getSession(false);
          session.setAttribute("username", username);
          session.setAttribute("token", token);
          session.setAttribute("exptime", time);
        }
      }
    }
    response.sendRedirect("../profile");
  %>
</body>
</html>
