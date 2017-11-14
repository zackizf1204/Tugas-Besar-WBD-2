<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
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
    String date = request.getParameter("hide_this_order");
    String query = String.format("UPDATE pesanan SET is_hidden_driver = TRUE WHERE date = \""+date+"\"");
    int hide = port.updateTabel(query);
    response.sendRedirect("history_driver.jsp");
%>