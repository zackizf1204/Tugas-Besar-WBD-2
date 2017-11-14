<%--
  Created by IntelliJ IDEA.
  User: ZackiZulfikarFauzi
  Date: 02/11/2017
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String tab = request.getParameter("selected_tab"); %>
<link rel="stylesheet" type="text/css" href="../style/history_tab.css">
<div id="header_tab_history_container">
    <div onclick="redirectToPrevOrder()" class="tab_history <%= tab.equals("1")?"history_selected":"" %>">
        MY PREVIOUS ORDER
    </div>
    <div onclick="redirectToDriverHistory()" class="tab_history right_tab <%= tab.equals("2")?"history_selected":"" %>">
        DRIVER HISTORY
    </div>
</div>
<script>
    function redirectToPrevOrder() {
        window.location = "../history"
    }

    function redirectToDriverHistory() {
        window.location = "../history/history_driver.jsp"
    }
</script>