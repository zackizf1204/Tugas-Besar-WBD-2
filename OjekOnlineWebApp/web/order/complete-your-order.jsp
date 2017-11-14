<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="java.io.File" %>
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
%>
<!DOCTYPE html>
<head>
    <title>Order</title>
    <link rel="stylesheet" type="text/css" href="../style/style_order.css">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
    <script type="text/javascript" src="rating.js"></script>
</head>
<body>

<jsp:include page="../header/header.jsp"/>
<jsp:include page="../header/header_tab.jsp">
    <jsp:param name="selected_tab" value="1"/>
</jsp:include>

<h1>MAKE AN ORDER</h1>

<jsp:include page="step.jsp">
    <jsp:param name="current_step" value="3"/>
</jsp:include>
<%
    JSONParser parser = new JSONParser();
    String destination = request.getParameter("destination");
    String origin = request.getParameter("origin");
    String user_customer = session.getAttribute("username").toString();
    String user_driver = request.getParameter("selected_driver_username");
    String driver_name = request.getParameter("selected_driver_name");
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    String date = dateFormat.format(new Date());

%>
<div class="label">HOW WAS IT?</div>
<div id="profile-holder">
    <div class="profile-picture" id="complete-profile-picture">
        <%
            File f = new File("F:\\Hisham\\Tugas\\Semester 5\\IF 3110 WBD\\TugasBesar2\\OjekOnlineWebApp\\web\\profile_picture\\"+user_driver+".jpg" );
            String filedir;
            if(f.exists() && !f.isDirectory()) {
                filedir = "../profile_picture/"+user_driver+".jpg" ;
            }else{
                filedir = "/profile/dodydharma.jpg";
            }
        %>
        <img src="<%=filedir%>">
    </div>
    <div id="complete-username">
        @<%= user_driver %>
    </div>
    <div id="complete-displayname">
        <%= driver_name %>
    </div>
</div>
<div id="rating-holder">
    <div onclick="clickRating(1)" onmouseover="light(1)" onmouseout="turnoff(1)">
        <img id="rating-1" src="assets/star-gray.png">
    </div>
    <div onclick="clickRating(2)" onmouseover="light(2)" onmouseout="turnoff(2)">
        <img id="rating-2" src="assets/star-gray.png">
    </div>
    <div onclick="clickRating(3)" onmouseover="light(3)" onmouseout="turnoff(3)">
        <img id="rating-3"  src="assets/star-gray.png">
    </div>
    <div onclick="clickRating(4)"
         onmouseover="light(4)" onmouseout="turnoff(4)">
        <img id="rating-4" src="assets/star-gray.png">
    </div>
    <div onclick="clickRating(5)" onmouseover="light(5)" onmouseout="turnoff(5)">
        <img id="rating-5" src="assets/star-gray.png">
    </div>
</div>
<br>
<form action="insert-order.jsp" method="post" id="finish-order-form">
    <input type="hidden" name="user_customer" value="<%= user_customer %>">
    <input type="hidden" name="user_driver" value="<%= user_driver %>">
    <input type="hidden" name="origin" value="<%= origin %>">
    <input type="hidden" name="destination" value="<%= destination %>">
    <input type="hidden" name="date" value="<%= date %>">
    <input type="hidden" name="rating" id="input-rating">
    <textarea id="comment-field" name="customer-comment" placeholder="Your comment ..."></textarea>
    <div id="button-holder-align-right">
        <button type="button" onclick="checkRating()">COMPLETE<br>ORDER</button>
    </div>
</form>
</body>
