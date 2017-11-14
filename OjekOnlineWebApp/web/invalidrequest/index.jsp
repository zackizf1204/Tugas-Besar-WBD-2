<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Invalid Request</title>
</head>
<body>
    <%= "username = " + session.getAttribute("username") + "<br>token = " + session.getAttribute("token") + "<br><br>" %>
    Your request is denied due to either invalid token, invalid username or expired session.<br>
    Click <a href="../login">here</a> to login.
</body>
</html>
