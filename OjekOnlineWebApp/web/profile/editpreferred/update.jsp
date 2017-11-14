<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %><%--
  Created by IntelliJ IDEA.
  User: Hishamlazuardi
  Date: 06/11/2017
  Time: 19:04
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
  String updateLoc = "";
  int deleteIndex = -1;
  if (request.getParameter("delete_this") != null || (!request.getParameter("delete_this").equals("-1"))) {
    deleteIndex = Integer.parseInt(request.getParameter("delete_this"));
  }

  int index = 1;
  String[] locations = request.getParameterValues("updated_locations[]");
  for (String loc : locations) {
    if (index != deleteIndex) {
      updateLoc += "," + loc;
    }
    index++;
  }

  String query = String.format("UPDATE driver SET preferred_location = \"%s\" WHERE username = \"%s\"", updateLoc, session.getAttribute("username").toString());
  port.updateLocations(query);

  response.sendRedirect("index.jsp?username=" + request.getParameter("username"));
%>
