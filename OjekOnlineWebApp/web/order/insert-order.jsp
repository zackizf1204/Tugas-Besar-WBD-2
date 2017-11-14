<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="Service.DataOrder" %>


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
<%
    String destination = request.getParameter("destination");
    String origin = request.getParameter("origin");
    String user_customer = request.getParameter("user_customer");
    String user_driver = request.getParameter("user_driver");
    String date = request.getParameter("date");
    String rating = request.getParameter("rating");
    String comment = request.getParameter("customer-comment");

    DataOrder order = new DataOrder();
    order.setUserDriver(user_driver);
    order.setUserCustomer(user_customer);
    order.setOrigin(origin);
    order.setDestination(destination);
    order.setDate(date);
    order.setRating(Integer.parseInt(rating));
    order.setComment(comment);


    int res = port.saveOrder(order);

    response.sendRedirect("index.jsp");
%>