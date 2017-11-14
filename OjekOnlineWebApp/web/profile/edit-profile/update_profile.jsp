<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="Service.OjekOnlineService" %>
<%@ page import="Service.OjekOnline" %>
<%@ page import = "java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
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
    File file ;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String status = "ok";
    String username = request.getParameter("username");
    //String username = session.getAttribute("username").toString();
    ServletContext context = pageContext.getServletContext();
    //String filePath = "..\\..\\profile_picture\\"+username+".jpg";
    String filePath = "F:\\Hisham\\Tugas\\Semester 5\\IF 3110 WBD\\TugasBesar2\\OjekOnlineWebApp\\web\\profile_picture\\";
    String name = new String();
    String phone = new String();
    String isdriver = new String();

    // Verify the content type
    String contentType = request.getContentType();

    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax( maxFileSize );

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            while ( i.hasNext () ) {
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () ) {
                    // Get the uploaded file parameters
                    if(fi.getSize()>0) {
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        out.print(fi);
                        // Write the file
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(filePath +
                                    fileName.substring(fileName.lastIndexOf("\\")));
                        } else {
                            file = new File(filePath +
                                    fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        fi.write(file);
                        out.println("Uploaded Filename: " + filePath +
                                fileName + "<br>");
                        File source = new File(filePath+fileName);
                        File file2 = new File(filePath+username+".jpg");
                        file2.delete();
                        File file3 = new File(filePath+username+".jpg");
                        source.renameTo(file3);

                    }
                }else{
                    String fieldname = fi.getFieldName();
                    String fieldvalue = fi.getString();
                    if (fieldname.equals("name_updated")) {
                        name = fieldvalue;
                    } else if (fieldname.equals("phone_updated")) {
                        phone = fieldvalue;
                    } else if (fieldname.equals("is_driver_active")) {
                        isdriver = fieldvalue;
                    }
                }
            }
        } catch(Exception ex) {
            System.out.println(ex);
        }

        String query = String.format("UPDATE customer SET name =\""+name+"\", phone_number = \""+phone+"\" WHERE username = \""+username+"\"");
        int update = port.updateTabel(query);
        if(update<0){
            status= "failed";
        }
        int value;
        if(isdriver!=null){
            value =1;
        }else{
            value=0;
        }

        query = "UPDATE driver SET is_active = \""+value+"\" WHERE username = \""+username+"\"";
        update = port.updateTabel(query);
        if(update<0){
            status= "failed";
        }


        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>");
        String current = new java.io.File( "." ).getCanonicalPath();
        out.println("Current dir:"+current);
        String currentDir = System.getProperty("user.dir");
        out.println("Current dir using System:" +currentDir);
        out.println("</p>");
        out.println("</body>");
        out.println("</html>");


        response.sendRedirect("index.jsp?username="+username+"&status="+status);


    } else {

    }
%>
