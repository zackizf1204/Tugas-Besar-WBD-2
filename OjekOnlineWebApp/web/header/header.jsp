<%--
  Created by IntelliJ IDEA.
  User: ZackiZulfikarFauzi
  Date: 02/11/2017
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../style/style_header.css">
<div id="header_container">
    <div id="logo"><img src="../header/gambar/logoprojek.jpg"></div>
    <div id="header-right-side">
        <div>
            <div>Hi, <strong><%
                if (session.getAttribute("username") == null) {
                    response.sendRedirect("../invalidrequest");
                } else {
                    out.print(session.getAttribute("username"));
                }
            %>
            </strong>!
            </div>
            <div>
                <a href="../logoutservlet?username=<%=session.getAttribute("username")+"&token="+session.getAttribute("token")%>">
                    Logout
                </a>
            </div>
        </div>
    </div>
</div>