var accepted_signal = '🗸';
var wrong_signal = '<span style="color:red;">🗴</span>';
var is_valid = {};
is_valid['username'] = false;
is_valid['email'] = false;

function checkAvailability(str, column) {
  is_valid[column]=false;
  if ((column == 'username' && (str.length == 0 || str.length > 20)) || (column == 'email' && (str.length == 0 || str.length > 50 || !validateEmail(str)))) {
    document.getElementById(column.concat("_ajax")).innerHTML = wrong_signal;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        var response = this.responseText;
        if (response === "TRUE") {
          document.getElementById(column.concat("_ajax")).innerHTML = accepted_signal;
          is_valid[column] = true;
        } else {
          document.getElementById(column.concat("_ajax")).innerHTML = wrong_signal;
        }
      }
    };
    xmlhttp.open("GET", "http://localhost:8081/IdentityService/registerservice?str=" + str + "&column=" + column, true);
    xmlhttp.send();
  }
}

function validateEmail(email) {
  regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return regex.test(email);
}

function tryRegister() {
  //Name validation
  if (document.getElementById('input_name').value.length == 0) {
    alert("Name cannot be empty");
  } else if (document.getElementById('input_name').value.length > 20) {
    alert("Name is too long (maximum 20 characters)");
  }

  //Username validation
  else if (document.getElementById('input_username').value.length == 0) {
    alert("Username cannot be empty");
  } else if (document.getElementById('input_username').value.length > 20) {
    alert("Username is too long (maximum 20 characters)");
  } else if (!is_valid['username']) {
    alert("Username is already taken");
  }

  //Email validation
  else if (document.getElementById('input_email').value.length == 0) {
    alert("Email cannot be empty");
  } else if (!validateEmail(document.getElementById('input_email').value)) {
    alert("Invalid email format");
  } else if (document.getElementById('input_email').value.length > 50) {
    alert("Email is too long (maximum 50 characters)");
  } else if (!is_valid['email']) {
    alert("Email is already taken");
  }

  //Password validation
  else if (document.getElementById('input_password').value.length == 0) {
    alert("Password cannot be empty");
  } else if (document.getElementById('input_password').value.length > 20) {
    alert("Password is too long (maximum 20 characters)");
  }

  //Confirm password validation
  else if (document.getElementById('input_confirm_password').value != document.getElementById('input_password').value) {
    alert("Confirm Password must be equal with Password");
  }

  //Phone number validation
  else if (document.getElementById('input_phone_number').value.length == 0) {
    alert("Phone number cannot be empty");
  } else if (document.getElementById('input_phone_number').value.length < 9) {
    alert("Phone number is too short (minimum 9 characters)");
  } else if (document.getElementById('input_phone_number').value.length > 12) {
    alert("Phone number is too long (maximum 12 characters)");
  }

  //Submission
  else {
    document.getElementById('form').submit();
  }
}