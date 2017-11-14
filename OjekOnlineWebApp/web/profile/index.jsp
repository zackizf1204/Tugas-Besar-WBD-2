<%--
  Created by IntelliJ IDEA.
  User: ZackiZulfikarFauzi
  Date: 29/10/2017
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String username = session.getAttribute("username").toString();
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
%>
<head>
  <title> My Profile </title>
  <link rel="stylesheet" type="text/css" href="../style/profile.css">
  <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
  <script type="text/javascript" src="redirect.js"></script>
</head>
<body>
<div class="input_block">
  <div class="input-title">
    <jsp:include page="../header/header.jsp"/>
    <jsp:include page="../header/header_tab.jsp">
      <jsp:param name="selected_tab" value="3"/>
    </jsp:include>
    <%
      String profpict_dir = "F:\\Hisham\\Tugas\\Semester 5\\IF 3110 WBD\\TugasBesar2\\OjekOnlineWebApp\\web\\profile_picture\\" + username + ".jpg";
      String tempjson = port.profileData(username);
      JSONParser parser = new JSONParser();
      JSONObject json = (JSONObject) parser.parse(tempjson);
    %>
    <div class="title-container">
      <h1>MY PROFILE</h1><img class="pencil" src ="pencil.png" onclick="redirectToEdit('<%out.print(username);%>')">
    </div>
    <div class = "profile">
      <%
        File f = new File(profpict_dir);
        String filedir;
        if(f.exists() && !f.isDirectory()) {
          filedir = "../profile_picture/"+ username + ".jpg";
        }else{
          filedir = "dodydharma.jpg";
        }
      %>
      <img class="profile-picture" src = "<%= filedir %>">
    </div>
    <div class="user-name-container text-align-center">
      <p>@<%out.print(username);%></p>
    </div>
    <div class="text-align-center display-name-container">
      <%
        out.print(json.get("name").toString());
      %>
    </div>
    <div class="text-align-center">
      <%
        String isDriver = json.get("driver").toString();
        if(isDriver.equals("true")) {
          out.print("Driver | <span style=\"color:#fd9927\">&#9734; " + json.get("rating") + " " + json.get("totalvotes") + " votes");
        } else {
          out.print("Non-Driver");
        }
      %>
    </div>
    <div class="text-align-center">
      <img src = "download2.png" alt = "mail" style="width:15px; height:15px;">
      <%
        out.print(json.get("email").toString());
      %>
    </div>
    <div class="text-align-center">
      <img src = "phone1600.png" alt = "phone" style="width:15px; height:15px;">
      <%
        out.print(json.get("phonenumber").toString());
      %>
    </div>
    <div>
      <div class="title-container">
        <h1 class="little-heading">PREFFERED LOCATIONS :</h1>
        <img src="pencil.png" class="pencil" onclick="redirectToPref('<%out.print(username);%>')">
      </div>
      <div class="preferred-locations-list">
        <%
          if (json.get("preferredloc") != null) {
            String preflocation = json.get("preferredloc").toString();
            String[] location = preflocation.split(",");
            int count = 0;
            for (String loc : location) {
              if (count > 0) {
                if (count > 1) {
                  for (int i = 1; i <= count - 1; i++) {
                    out.print("&emsp;&emsp;");
                  }
                }
                out.print("&#9654; " + loc + "<br />");
              }
              count++;
            }
          }
        %>
      </div>
    </div>
  </div>
</div>
</body>   
