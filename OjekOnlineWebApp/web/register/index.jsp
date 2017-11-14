<%--
  Created by IntelliJ IDEA.
  User: Hishamlazuardi
  Date: 03/11/2017
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../style/login_register.css">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
    <script src="register.js"></script>
</head>
<body>
<div class="input_block">
    <div class="input-title">
        <div class="input-line"></div>
        <div class="input-title-text">
            <h1>SIGN UP</h1>
        </div>
    </div>
    <form action="http://localhost:8081/IdentityService/registerservice" id="form" method="post">
        <div class="input_keyboard_block">
            <div>
                <div class="input_label">Your Name</div>
                <div class="input_keyboard">
                    <input id="input_name" type="text" name="name" placeholder="Your Name"/>
                </div>
            </div>
            <div>
                <div class="input_label">Username</div>
                <div class="input_keyboard">
                    <input id="input_username" type="text" name="username" placeholder="Username" class="input_ajax"
                           onkeyup="checkAvailability(this.value, this.name)"/>
                    <span class="input_ajax_label" id="username_ajax"></span>
                </div>
            </div>
            <div>
                <div class="input_label">Email</div>
                <div class="input_keyboard">
                    <input id="input_email" type="email" name="email" placeholder="Email" class="input_ajax"
                           onkeyup="checkAvailability(this.value, this.name)"/>
                    <span class="input_ajax_label" id="email_ajax"></span>
                </div>
            </div>
            <div>
                <div class="input_label">Password</div>
                <div class="input_keyboard">
                    <input id="input_password" type="password" name="password" placeholder="Password"/>
                </div>
            </div>
            <div>
                <div class="input_label">Confirm Password</div>
                <div class="input_keyboard">
                    <input id="input_confirm_password" type="password" name="confirmPassword"
                           placeholder="Confirm Password"/>
                </div>
            </div>
            <div>
                <div class="input_label">Phone Number</div>
                <div class="input_keyboard">
                    <input id="input_phone_number" type="tel" name="phoneNumber" placeholder="Phone Number"/>
                </div>
            </div>
        </div>
        <div id="input_checkbox_driver">
            <input type="checkbox" name="driver" value="true"> Also sign me up as a driver
        </div>
        <div class="input_clickable">
            <div class="input_link">
                <a href="../login">Already have an account?</a>
            </div>
            <div class="input_button">
                <button type="button" onclick="tryRegister()">REGISTER</button>
            </div>
        </div>
    </form>
</div>

<script>
    checkAvailability(document.getElementById('input_username').value, 'username');
    checkAvailability(document.getElementById('input_email').value, 'email');
</script>
</body>
</html>
