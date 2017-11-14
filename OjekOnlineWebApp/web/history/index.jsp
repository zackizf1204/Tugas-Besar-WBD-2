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
<%@ page import="java.util.ArrayList" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="Service.DataHistory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /*
    ValidationService validationService = new ValidationService();
    String[] arr = request.getRequestURL().toString().split("/");
    String url = arr[0] + "//" + arr[2] + "/" + arr[3];
    if (session.getAttribute("username") == null && session.getAttribute("token") == null) {
        response.sendRedirect("../invalidrequest");
    } else {
        if (!validationService.validate(session.getAttribute("username").toString(),
                session.getAttribute("token").toString(), url))
            response.sendRedirect("../invalidrequest");
    }
    */

%>
<html>
<head>
    <title>History</title>
    <link rel="stylesheet" type="text/css" href="../style/history.css">
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
</head>
<body>
<jsp:include page="../header/header.jsp"/>
<jsp:include page="../header/header_tab.jsp">
    <jsp:param name="selected_tab" value="2"/>
</jsp:include>
<h1>TRANSACTION HISTORY</h1>
<jsp:include page="history_tab.jsp">
    <jsp:param name="selected_tab" value="1"/>
</jsp:include>
<table border="0" width="100%" >
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
        String query = String.format("SELECT * FROM pesanan WHERE user_customer = \"%s\" AND is_hidden_customer = FALSE" , session.getAttribute("username").toString());
        List<DataHistory> responsehistory = port.searchHistory(query);
        int i;
        i=0;
        while((!responsehistory.isEmpty())&&(i<responsehistory.size())) {
            DataHistory history = new DataHistory();
            history = responsehistory.get(i);
            int hidden = history.getIsHiddenCustomer();
            if(hidden==0){
                out.println("<tr class=\"row\">\n" +
                        "        <th width=\"25%\">");
                String userdriver = history.getUserDriver();
                File f = new File("../profile_picture/"+userdriver+".jpg" );
                String filedir;
                String usercustomer = history.getUserCustomer();
                if(f.exists() && !f.isDirectory()) {
                    filedir = "../profile_picture/"+usercustomer+".jpg";
                }else{
                    filedir = "dummy1.jpg";
                }
                out.println("<img src =\"" + filedir + "\" height=\"125px\" width=\"125px\">");
                out.println("</th>\n" +
                        "    <th style=\"font-weight:normal\" align=\"left\" >\n" +
                        "        <div class=\"header-row\">\n" +
                        "            <div class=\"header-row-text\">\n" +
                        "                <div class=\"text-date\">");
                String date = history.getDate();
                SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date2 = formatter.parse(date.substring(0,19));
                SimpleDateFormat formatter2=new SimpleDateFormat("E, MMM dd yyyy HH:mm:ss");
                out.print(formatter2.format(date2));
                out.println("</div>\n" +
                        "                <div class=\"text-display-name\">");
                String queryname = "SELECT name FROM customer WHERE username = \""+ userdriver +"\"";
                String name = port.searchCustomerName(queryname);
                out.print(name);
                out.println("</div>\n" +
                        "            </div>\n" +
                        "            <div class=\"header-row-button\">");
                out.println("<form action=\"hide_order.jsp\" method=\"post\">");
                out.println("<button type=\"submit\" class=\"hide-button\" name=\"hide_this_order\" value=\""+ date +"\">HIDE</button>");
                out.println("</form>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <div class=\"trip\">");
                String origin = history.getOrigin();
                String destination = history.getDestination();
                out.print(origin+"->"+destination);
                out.println(" </div>\n" +
                        "        <div>");
                int rating = history.getRating();
                out.print("You rated : <span class=\"rating\">");
                int a;
                for(a=0;a<rating;a++){
                    out.print("&#9734");
                }
                out.println("</span>");
                out.println("</div>\n" +
                        "        <div>\n" +
                        "            You commented:\n" +
                        "        </div>\n" +
                        "        <div class=\"comment\">");
                String comment = history.getComment();
                out.println(comment +
                        "        </div>\n" +
                        "    </th>\n" +
                        "    </tr>");
            }
            i++;
        }
    %>
</table>
</body>
</html>

