<%-- 
    Document   : DeleteFileJSP
    Created on : Jul 14, 2016, 9:10:21 AM
    Author     : Mohamed
--%>

<%@page import="java.io.File"%>
<%@page import="models.MyPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            if (session.getAttribute("UserObject") != null) {
                MyPerson p = (MyPerson) session.getAttribute("UserObject");
                String name = request.getParameter("Filename");
                String type = request.getParameter("Type");
                String SubjectCodeString = request.getParameter("Subject_Code");
                File file = null;

                boolean isEveryThingisOK = true;

                if (name == null || name.isEmpty()
                        || type == null || type.isEmpty()
                        || SubjectCodeString == null || SubjectCodeString.isEmpty()) {
                    isEveryThingisOK = false;
                    out.println("<script type='text/javascript' > alert('Please fill all fields ^_^ ');history.back();</script>");

                }
                int FileId = 0;
                int Subject_Code = 0;
                try {

                    FileId = Integer.parseInt(request.getParameter("FileCode"));
                    Subject_Code = Integer.parseInt(SubjectCodeString);

                    // out.println(Subject_Code);
                } catch (Exception ex) {
                    out.println("<script type='text/javascript' > alert('File Codeis an integer value please   ^_^ ');history.back();</script>");
                    System.out.println("File Code DeletFileServlet Error:" + ex.getMessage());
                    isEveryThingisOK = false;

                }
                if (isEveryThingisOK) {
                    try {
                        String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');

                        file = new File(webRootPath + name + "." + type);//"D:\\"
                        if (file.delete()) {
                            out.println(file.getName() + " is deleted ");

                        } else {
                            out.println("file is not deleted");
                            isEveryThingisOK = false;
                        out.println("<script type='text/javascript' > alert(' Can not delete file from Server ');history.back();</script>");

                        }

                    } catch (Exception ex) {
                        out.println("Error:" + ex.getMessage());
                        out.println("<script type='text/javascript' > alert(' Can not delete file from server(Error: " + ex.getMessage() + ") ');history.back();</script>");

                        isEveryThingisOK = false;

                    }
                }
                if (isEveryThingisOK) {
                    int rowAffected;
                    try {
                        rowAffected = p.DeleteFileMethod(FileId, Subject_Code);

                        if (rowAffected > 0) {
                            //out.println("<script type='text/javascript' > alert('Post was success ^_^ ');history.back();</script>");

                          response.sendRedirect("MyAccount.jsp?page=CourseMaterials&Subject_Code=" + Subject_Code + "");
                            //  out.println("<script type='text/javascript' > alert('Post was Adding Successfully  ^_^ ');history.back();</script>");
                        } else {
                            out.println("<script type='text/javascript' > alert('Deleting File is Failed ^_^ ');history.back();</script>");
                        }

                    } catch (Exception ex) {
                        System.err.println("DeletFile Servlet Error:" + ex.getMessage());
                        out.println("DeletFile Servlet Error:" + ex.getMessage());
                        out.println("<center><a href='MyAccount.jsp'>Home</a></center>");

                    }
                }
            }//end of if session is exit or not
            else {
                RequestDispatcher RD = request.getRequestDispatcher(response.encodeURL("index.jsp"));
                RD.forward(request, response);
            }
        %>  
    </body>
</html>
