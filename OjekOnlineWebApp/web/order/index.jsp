<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
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
    <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
</head>
<body>

<jsp:include page="../header/header.jsp"/>
<jsp:include page="../header/header_tab.jsp">
    <jsp:param name="selected_tab" value="1"/>
</jsp:include>

<h1>MAKE AN ORDER</h1>
<jsp:include page="step.jsp">
    <jsp:param name="current_step" value="1"/>
</jsp:include>
<form id="select_destination_form" method="post" action="select-a-driver.jsp">
    <div id="form-holder">
        <div class="data">
            <div class="data-label">Picking Point</div>
            <div class="data-field">
                <input id="picking_point" type="text" name="picking-point" placeholder="Your picking point"/>
            </div>
        </div>
        <div class="data">
            <div class="data-label">Destination</div>
            <div class="data-field">
                <input id="destination" type="text" name="destination" placeholder="Your destination"/>
            </div>
        </div>
        <div class="data">
            <div class="data-label">Preferred Driver</div>
            <div class="data-field">
                <input id="preferred_driver" type="text" name="preferred-driver" placeholder="(optional)"/>
            </div>
        </div>
    </div>
</form>
<div id="button-holder">
    <button type="button" onclick="checkDestinationForm()">NEXT</button>
</div>
<script>
  function checkDestinationForm() {
    var pickingPoint = document.getElementById("picking_point").value
    var destination = document.getElementById("destination").value

    if (!pickingPoint || !destination) {
      alert("Picking point and destination field cannot be empty.")
    } else {
      document.getElementById("select_destination_form").submit()
    }
  }
</script>
</body>