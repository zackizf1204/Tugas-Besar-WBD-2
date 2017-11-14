<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.io.File" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<!DOCTYPE html>
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
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="../../style/edit_profile.css">
    <script type="text/javascript" src="allfunc.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet"> 
</head>

<body>
    <h1>EDIT PROFILE INFORMATION</h1>
    <%
        String username =  session.getAttribute("username").toString();
        String tempjson = port.profileData(username);
        JSONParser parser = new JSONParser();
        JSONObject responseJSON = (JSONObject) parser.parse(tempjson);
        String profpict_dir = "F:\\Hisham\\Tugas\\Semester 5\\IF 3110 WBD\\TugasBesar2\\OjekOnlineWebApp\\web\\profile_picture\\"+ username + ".jpg";;
    %>
    <form action="update_profile.jsp?username=<%out.print(username);%>" method="post" id="profile-picture-form" enctype = "multipart/form-data">
        <div class="profile-picture-container">
            <div class="picture">
                <%
                    File f = new File(profpict_dir);
                    String filedir;
                    if(f.exists() && !f.isDirectory()) {
                        filedir = "../../profile_picture/"+username+".jpg";
                    }else{
                        filedir = "../dodydharma.jpg";
                    }
                %>
                <img id="profpict" src="<%out.print(filedir);%>">
            </div>
            <div class="setter">
                <div class="profpict-label">Update profile picture</div>
                    <div class="file-explorer-container">
                        <div class="profile-field-container">
                            <input id="file-path" onclick="browseFile()" readonly>
                            <input id="file-selector" type="file" accept=".jpg" onchange="obtainFile()" name="picture_selected">
                        </div>
                        <div class="browser-container">
                            <button type="button" id="upload-button" onclick="browseFile()">Browse...</button>
                        </div>
                    </div>
            </div>
        </div>
        <div class="name-container">
            <div class="label">Your Name</div>
            <div class="input-container">
                <input type="text" name="name_updated" value="<%=responseJSON.get("name").toString()%>">
            </div>
        </div>
        <div class="phone-container">
            <div class="label">Phone</div>
            <div class="input-container">
                <input type="text" name="phone_updated" value="<%=responseJSON.get("phonenumber").toString()%>">
            </div>
        </div>
        <div class="status-driver-contariner">
            <div class="label">Status Driver</div>
            <div class="input-container">
                <label class="toggle">
                    <%
                        String isDriver = responseJSON.get("driver").toString();
                        if(isDriver.equals("true")) {
                            out.print("<input type=\"checkbox\" name=\"is_driver_active\" checked>");
                        }else{
                            out.print("<input type=\"checkbox\" name=\"is_driver_active\">");
                        }
                    %>
                    <span class="slider"></span>
                </label>
            </div>
        </div>
        <div class="button-container"> 
            <div class="back-button-container">
                <button type="button" onclick="back('<%=username%>')" class="soft-edges">BACK</button>
            </div>
            <div class="save-button-container">
                <button type="submit" class="soft-edges">SAVE</button>
            </div>
        </div>
    </form>
    <%
        if(request.getParameter("status")!=null){
            out.print("<script>isSuccess(\""+request.getParameter("status")+"\")</script>");
        }

    %>
</body>