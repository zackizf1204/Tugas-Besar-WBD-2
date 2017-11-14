
<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.io.File" %>
<%@ page import="Service.DataDriver" %>
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
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
    <script type="text/javascript" src="order.js"></script>
</head>
<body>

<jsp:include page="../header/header.jsp"/>
<jsp:include page="../header/header_tab.jsp">
    <jsp:param name="selected_tab" value="1"/>
</jsp:include>

<h1>MAKE AN ORDER</h1>

<jsp:include page="step.jsp">
    <jsp:param name="current_step" value="2"/>
</jsp:include>

<%
    String pickingPoint = request.getParameter("picking-point");
    String destination = request.getParameter("destination");
    String preferredDriver = request.getParameter("preferred-driver");

    List<DataDriver> drivers = port.retrieveDrivers();
%>
<div>
        <div class="drivers-box">
            <div class="label">PREFERRED DRIVERS:</div>
            <div class="content">
                <%
                    List<DataDriver> otherDrivers = new ArrayList<DataDriver>();
                    if (!drivers.isEmpty()) {
                        int i;
                        i=1;
                        for (DataDriver datadriver : drivers) {
                            if(datadriver.getUsername()!=session.getAttribute("username")){
                            Object prefLocObject = datadriver.getPrefloc();

                            String prefloc = prefLocObject == null ? "," : prefLocObject.toString();
                            String name = datadriver.getName();

                            if (prefloc.toLowerCase().contains(destination.toLowerCase()) ||
                                    prefloc.toLowerCase().contains(pickingPoint.toLowerCase())) {
                                if (name.toLowerCase().contains(preferredDriver.toLowerCase()) &&
                                        !preferredDriver.isEmpty()) {
                %>
                <div class="other-driver">
                    <%
                        File f = new File("F:\\Hisham\\Tugas\\Semester 5\\IF 3110 WBD\\TugasBesar2\\OjekOnlineWebApp\\web\\profile_picture\\"+datadriver.getUsername()+".jpg" );
                        String filedir;
                        if(f.exists() && !f.isDirectory()) {
                            filedir = "../profile_picture/"+datadriver.getUsername()+".jpg";
                        }else{
                            filedir = "../profile/dodydharma.jpg";
                        }
                    %>
                    <div class="profile-picture"><img src="<%= filedir %>"></div>
                    <div class="profile-content">
                        <div class="name-rating-driver">
                            <div class="name"><%= name %>
                            </div>
                            <div>
                                <% DataDriver rating = port.retrieveDriverRating(datadriver.getUsername());


                                %>
                                <%=
                                "<span style=\"color:#fd9927\">&#9734; " + rating.getAvgrating()
                                        + " </span>(" + rating.getRatingcount() + " votes)"
                                %>
                            </div>
                        </div>
                        <div class="button-holder-align-right-bottom">
                            <form id="<%="select_driver_form_pref"+i%>" action="complete-your-order.jsp" method="post">
                                <input type="hidden" name="origin" value="<%= request.getParameter("picking-point") %>">
                                <input type="hidden" name="destination" value="<%= request.getParameter("destination") %>">
                                <input type="hidden" name="selected_driver_username" value="<%= datadriver.getUsername() %>">
                                <input type="hidden" name="selected_driver_name" value="<%= datadriver.getName() %>">
                            </form>
                            <button class="choose-driver" type="submit" onclick="checkDriverFormPref(<%=i%>)">
                                I CHOOSE YOU!
                            </button>
                        </div>
                    </div>
                </div>
                <%
                                } else {
                                    otherDrivers.add(datadriver);
                                }
                            }
                            i++;
                        }
                        }
                    }
                %>
            </div>
        </div>
        <div class="drivers-box">
            <div class="label">OTHER DRIVERS:</div>
            <div class="content">
                <%
                    int i;
                    i=1;
                    for (DataDriver datadriverother : otherDrivers) {
                        if(datadriverother.getUsername()!=session.getAttribute("username")){
                %>
                <div class="other-driver">
                    <%
                        File f = new File("F:\\Hisham\\Tugas\\Semester 5\\IF 3110 WBD\\TugasBesar2\\OjekOnlineWebApp\\web\\profile_picture\\"+datadriverother.getUsername()+".jpg" );
                        String filedir;
                        if(f.exists() && !f.isDirectory()) {
                            filedir = "../profile_picture/"+datadriverother.getUsername()+".jpg";
                        }else{
                            filedir = "..//profile/dodydharma.jpg";
                        }
                    %>
                    <div class="profile-picture"><img src="<%= filedir %>"></div>
                    <div class="profile-content">
                        <div class="name-rating-driver">
                            <div class="name"><%= datadriverother.getUsername() %>
                            </div>
                            <div>
                                <% DataDriver temprating = port.retrieveDriverRating(datadriverother.getUsername());%>
                                <%=
                                "<span style=\"color:#fd9927\">&#9734; " + temprating.getAvgrating()
                                        + " </span>(" + temprating.getRatingcount() + " votes)"
                                %>
                            </div>
                        </div>
                        <%
                            JSONObject json = new JSONObject();
                            json.put("username", temprating.getUsername());
                            json.put("name", temprating.getName());
                            JSONParser parse = new JSONParser();
                            String stringjson = json.toJSONString();
                        %>

                        <form id="<%="select_driver_form"+i%>" action="complete-your-order.jsp" method="post">
                            <input type="hidden" name="origin" value="<%= request.getParameter("picking-point") %>">
                            <input type="hidden" name="destination" value="<%= request.getParameter("destination") %>">
                            <input type="hidden" name="selected_driver_username" value="<%= datadriverother.getUsername() %>">
                            <input type="hidden" name="selected_driver_name" value="<%= datadriverother.getName() %>">
                        </form>
                        <div class="button-holder-align-right-bottom">
                            <button class="choose-driver" type="submit" onclick="checkDriverForm(<%=i%>)">
                                I CHOOSE YOU!
                            </button>
                        </div>
                    </div>
                </div>
                <%
                        i++;
                    }
                    }
                %>
            </div>
        </div>

</div>
<script>
    function checkDriverFormPref(a) {
            document.getElementById("select_driver_form_pref"+a).submit()
    }
    function checkDriverForm(a) {
        document.getElementById("select_driver_form"+a).submit()
    }
</script>
</body>