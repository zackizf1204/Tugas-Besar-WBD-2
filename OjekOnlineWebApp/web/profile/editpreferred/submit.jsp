<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %><%--
  Created by IntelliJ IDEA.
  User: Hishamlazuardi
  Date: 06/11/2017
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
  String previous = "";
  if (request.getParameter("preferred_location") != null) {
    previous = request.getParameter("preferred_location");
  }
  String newLoc = "";
  if (request.getParameter("newLocation").isEmpty() == false) {
    newLoc = request.getParameter("newLocation");
    String newlocation = previous + "," + newLoc;
    String query = String.format("UPDATE driver SET preferred_location = \"%s\" WHERE username = \"%s\"", newlocation, request.getParameter("username"));
    port.updateLocations(query);
  }
  response.sendRedirect("index.jsp?username=" + request.getParameter("username"));
%>
