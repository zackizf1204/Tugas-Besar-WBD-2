<%--
  Created by IntelliJ IDEA.
  User: Hishamlazuardi
  Date: 26/10/2017
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../style/login_register.css">
    <script src="login.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Login Page</title>
</head>
<body>

<div class="input_block">
    <div class="input-title">
        <div class="input-line"></div>
        <div class="input-title-text">
            <h1>LOGIN</h1>
        </div>
    </div>
    <form action="http://localhost:8081/IdentityService/loginservice" id="form" onsubmit="return validateLogin()" method="post">
        <div class="input_keyboard_block">
            <div>
                <div class="input_label">Username</div>
                <div class="input_keyboard">
                    <input id="username" type="text" name="username" placeholder="Username"/>
                </div>
            </div>
            <div>
                <div class="input_label">Password</div>
                <div class="input_keyboard">
                    <input id="password" type="password" name="password" placeholder="Password"/>
                </div>
            </div>
        </div>
        <div class="warning">
            <%
                if (request.getParameter("error") != null) {
                    out.print("Username atau Password yang anda masukan salah");
                    out.print("<br />");
                }
            %>
            <br/>
        </div>
        <div class="input_clickable">
            <div class="input_link">
                <a href="../register">Don't have an account?</a>
            </div>
            <div class="input_button">
                <button type="submit">GO!</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
