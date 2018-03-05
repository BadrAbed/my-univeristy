
<%@page import="models.ModelOfStudent"%>
<%@page import="models.ModelOfProfessor"%>
<%@page import="models.MyPerson"%>
<%@page import="Database.MyDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% if (session.getAttribute("UserObject") != null) {
        MyPerson p = (MyPerson) session.getAttribute("UserObject");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File</title>
    </head>

    <body>

        <%! int Subject_Code;
            boolean IsUserRegistgerInThisSubjectOrNot;
        %>
        <div id="rightcontentRigs">


            <% try {
                    Subject_Code = Integer.parseInt(request.getParameter("Subject_Code"));
                    IsUserRegistgerInThisSubjectOrNot = false;

                    // String Subject_Code2=    (String)session.getAttribute("Subject_Code");
                    if (p.getUserType() == 6) {

                        ModelOfStudent modelOfStudent = new ModelOfStudent();
                        ResultSet rs = modelOfStudent.ViewMyCourses(p.getCode());

                        while (rs.next()) {
                            //SubjectsStudentCode.add(rs.getInt("ID"));
                            if (rs.getInt("ID") == Subject_Code) {
                                IsUserRegistgerInThisSubjectOrNot = true;
                            }

                        }
                    } else if (p.getUserType() == 4 || p.getUserType() == 5) {

                        ModelOfProfessor modelOfProfessor = new ModelOfProfessor();
                        ResultSet rs = modelOfProfessor.ViewMyCoursesProfessor(p.getCode());

                        while (rs.next()) {
                            //  SubjectsAssistantCode.add(rs.getInt("ID"));

                            if (rs.getInt("ID") == Subject_Code) {
                                IsUserRegistgerInThisSubjectOrNot = true;
                            }
                        }

                    } else if (p.getUserType() == 2 || p.getUserType() == 3 || p.getUserType() == 1) {
                        IsUserRegistgerInThisSubjectOrNot = true;
                    }
                    if (IsUserRegistgerInThisSubjectOrNot == true) {

            %>

            <div id="Mymenue" >
                <ul>
                    <li>

                        <a href="?page=CoursePosts&Subject_Code=<%=Subject_Code%>">
                            <!--       <form action="?page=CoursePosts" method="POST">
                                       <input hidden="" type="text" name="Subject_Code" value="<%=Subject_Code%>" />
                                       <input type="submit" value="Posts"/>
       
                                   </form>-->
                            Posts
                        </a>
                    </li>
                    <li>

                        <a href="?page=CourseMaterials&Subject_Code=<%=Subject_Code%>">
                            <!--       <form action="?page=upload_form" method="POST">
                                       <input hidden="" type="text" name="Subject_Code" value="<%=Subject_Code%>" />
                                       <input type="submit" value="Files"/>
       
                                   </form>-->
                            Files
                        </a>
                    </li>



                    <% if (p.getUserType() == 5 || p.getUserType() == 4) {


                    %>
                    <li>

                        <a href="?page=CourseGrades&Subject_Code=<%=Subject_Code%>">
                            <!--       <form action="?page=Course Grades" method="POST">
                                       <input hidden="" type="text" name="Subject_Code" value="<%=Subject_Code%>" />
                                       <input type="submit" value="Grades"/>
       
                                   </form>-->
                            Grades
                        </a>
                    </li>
                    <%
                        }%>
                </ul>
            </div>
            <%
                if (p.getUserType() != 6) {
            %>

            <form method="POST" action="UploadMaterial" enctype="multipart/form-data">
                <center>
                    <table border="1" width="25%" cellpadding="5">
                        <thead> 
                        <th colspan="5">Upload File</th>        
                        </thead>
                        <tbody>
                            <tr>    
                                <td>Description</td>
                                <td>   <textarea name="Description" required="" rows="3" cols="30" placeholder="Description">Description
                                    </textarea></td>
                            </tr>

                            <tr>
                                <td>Choose File</td>
                                <td><input type="file" name="fname" required="" /></td>
                                <td> <input type="hidden" name="Subject_Code" value="<%=Subject_Code%>" /></td>
                            </tr>
                            <tr>
                                <td colspan="3"><center><input    style="   width: 200px;
                                height: 40px;

                                background-color:#28a4c9;
                                color: #f5f4f4;
                                border:0px;
                                                                  border-radius: 25px;" type="submit" value="Upload"></center></td>
                        </tr>
                        </tbody>             
                    </table>
                </center>
            </form>

            <%
                } %>
            <br><br>

            <table border="1" width="25%" cellpadding="5">
                <thead> 
                <th colspan="8">Uploaded Files</th>        
                </thead>
                <tbody>
                    <tr>
                        <td><center><b>Id</b></center>
                <td><center><b>Title</b></center></td>
                <td><center><b>Type</b></center></td>

                <td><center><b>By</b></center></td> 
                <td><center><b>Date</b></center></td>
                <td><center><b>Description</b></center></td>

                <td><center><b>File</b></center></td>
                <td><center><b>Action</b></center></td>



                </tr>


                <%
                    try {

                        ResultSet rs = p.ViewCourseMaterials(Subject_Code);

                        if (!rs.isBeforeFirst()) {
                %>
                <tr>
                    <td colspan="8"><center><%out.print("<font color='blue'>No Files!</font>"); %></center></td>
                </tr>
                <%
                    }

                    while (rs.next()) {
                %>
                <tr>
                    <td><center><%=rs.getInt("ID")%></center></td>
                <td><center><%=rs.getString("Filename")%></center></td>
                <td><center><%=rs.getString("Type")%></center></td>

                <td><center><a href="mailto:<%=rs.getString("Mail")%>"><%=rs.getString("Mail")%></a></center></td>
                <td><center><%=rs.getString("UploadedDate")%></center></td>
                <td><center><%=rs.getString("Description")%></center></td>

                <td><center><a href="DownloadMaterial?name=<%=rs.getString("Filename")%>&type=<%=rs.getString("Type")%>&Subject_Code=<%=Subject_Code%>">View</a></center></td>
                <td>
                    <% if (p.getUserEmail().equals(rs.getString("Mail"))) {%>
                    <form action="DeleteFileJSP.jsp" method="POST">
                        <input hidden="" name="FileCode" value="<%=rs.getInt("ID")%>"/>
                        <input hidden="" name="Filename" value="<%=rs.getString("Filename")%>"/>
                        <input hidden="" name="Type" value="<%=rs.getString("Type")%>"/>

                        <input hidden="" name="Subject_Code" value="<%=Subject_Code%>"/>
                        <input type="submit" value="Delete" name="Delete" />
                    </form>
                    <% } %> 
                </td>

                </tr>
                <%
                    }
                %>

                </tbody> 
            </table>

            <%
                    rs.close();
                } catch (Exception e) {
                    out.println("Error:" + e.getMessage());
                }

            %>


            <div style="position: relative">
                <div style="position: fixed ; bottom: 0 ; width:100% ; text-align:center ">

                </div>
            </div>  
            <% }//end of IsUserRegistgerInThisSubjectOrNot
                    else {
                        out.println("<br/><br/><br/><br/><br/><br/><center><font color='red' ><h1>You didn't register in this course ^_^</h1></font></center> ");
                    }
                } catch (Exception ex) {

                    out.println("<br/><br/><br/><br/><br/>");

                    out.println("<font color='blue'>SomeThing Wrong is happened  ^_^ </font><br/>");
                    out.println("Error:" + ex.getMessage() + "<br/>");

                    out.println("<center><a href='MyAccount.jsp' >Home</a></center>");
                }%> 
        </div>
    </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }%>