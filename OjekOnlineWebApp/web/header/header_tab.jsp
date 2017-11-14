<%--
  Created by IntelliJ IDEA.
  User: ZackiZulfikarFauzi
  Date: 02/11/2017
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String tab = request.getParameter("selected_tab"); %>
<link rel="stylesheet" type="text/css" href="../style/style_header_tab.css">
<div id="header_tab_container">
    <div onclick="redirectToOrder()" class="tab <%= tab.equals("1")?"selected":"" %>">ORDER</div>
    <div onclick="redirectToHistory()" class="tab <%= tab.equals("2")?"selected":"" %>" id="center">HISTORY</div>
    <div onclick="redirectToProfile()" class="tab <%= tab.equals("3")?"selected":"" %>">MY PROFILE</div>
</div>
<script>
  function redirectToHistory() {
    window.location = "../history"
  }

  function redirectToProfile() {
    window.location = "../profile"
  }

  function redirectToOrder() {
    window.location = "../order"
  }
</script>