<%@page import="models.ModelOfUniversityAdmin"%>
<%@page import="models.ModelOfFaculityAdmin"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Courses
    Created on : May 8, 2016, 5:49:12 AM
    Author     : Mohamed
--%>

<%@page import="models.ModelOfProfessor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.ModelOfStudent"%>
<%@page import="models.MyPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% if (session.getAttribute("UserObject") != null) {
            MyPerson p = (MyPerson) session.getAttribute("UserObject");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="rightcontent5">
            <div id="top_page">
                <h1>Courses</h1>


            </div>
            <div id="down">


                <!--end leatest project-->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <%
                                        if (p.getUserType() == 6) {

                                            try {

                                                ModelOfStudent modelOfStudent = new ModelOfStudent();
                                                ResultSet rs = modelOfStudent.ViewMyCourses(p.getCode());
                                                if (!rs.isBeforeFirst()) {
                                                    out.println("<font color='blue'>There is no Courses Untill Now ^_^ </font>");
                                                }

                                    %>

                                    <%                        while (rs.next()) {
                                            //out.println(rs.getInt("ID"));

                                    %>
                                    <div class="col-md-4 ">
                                        <div class="alert alert-info text-center">
                                            <h4> <%= rs.getString("SubjectName")%> </h4> 
                                            <hr />
                                            <i class="fa fa-warning fa-4x"></i>
                                            Midterm :<font color="red">

                                            <% if (rs.getInt("subjectstudent.MidtermGrade") == -1) {
                                                    out.println("No grades ");
                                                } else {
                                                    out.println(rs.getInt("subjectstudent.MidtermGrade"));
                                                }

                                            %></font>

                                            <br/>
                                            Class Work: <font color="red">
                                            <% if (rs.getInt("subjectstudent.WritenGrade") == -1) {
                                                    out.println("No grades ");
                                                } else {
                                                    out.println(rs.getInt("subjectstudent.WritenGrade"));
                                                }

                                            %>
                                            </font>                        <br/>
                                            Final Exam :<font color="red">   <% if (rs.getInt("subjectstudent.FinalExamGrade") == -1) {
                                                    out.println("No grades ");
                                                } else {
                                                    out.println(rs.getInt("subjectstudent.FinalExamGrade"));
                                                }

                                            %></font>

                                            <br/>


                                            Code:<font color="red"><%= rs.getString("Code")%></font>
                                            <br/>
                                            Final Grade:
                                            <% if (rs.getInt("subjectstudent.FinalExamGrade")+rs.getInt("subjectstudent.WritenGrade")+rs.getInt("subjectstudent.MidtermGrade") > 50) {
                                            %> <font color="red"><%= rs.getInt("subjectstudent.FinalExamGrade")+rs.getInt("subjectstudent.WritenGrade")+rs.getInt("subjectstudent.MidtermGrade")%></font><font color="green">Pass</font>
                                            <% } else if (rs.getInt("subjectstudent.FinalExamGrade")+rs.getInt("subjectstudent.WritenGrade")+rs.getInt("subjectstudent.MidtermGrade") < 50 && rs.getInt("subjectstudent.FinalExamGrade")+rs.getInt("subjectstudent.WritenGrade")+rs.getInt("subjectstudent.MidtermGrade")!=-3) {%>
                                            <font color="red"><%= rs.getInt("subjectstudent.FinalExamGrade")+rs.getInt("subjectstudent.WritenGrade")+rs.getInt("subjectstudent.MidtermGrade")%></font> <font color="green">Fail</font>
                                            <% } else if(rs.getInt("subjectstudent.FinalExamGrade")+rs.getInt("subjectstudent.WritenGrade")+rs.getInt("subjectstudent.MidtermGrade")==-3) {%>
                                            <font color="green">No Grades till now</font>
                                            <% }%>
                                            <br/>
                                            Term:
                                            <font color="red"><%= rs.getString("subjectstudent.Term")%></font>
                                            <br/>
                                            Begins In:
                                            <font color="red"><%= rs.getString("subjectstudent.CourseOpeningFrom")%></font>
                                            <br/>
                                            Ends In:
                                            <font color="red"><%= rs.getString("subjectstudent.CourseOpeningTo")%></font>


                                            <hr />
                                            <a href="?page=CoursePosts&Subject_Code=<%=rs.getInt("ID")%>" class="btn btn-info">Read Full Details</a> 
                                        </div>
                                    </div>


                                    <%

                                            }
                                        } catch (Exception ex) {
                                            out.println("<font color='blue'>SomeThing Wrong is happened  ^_^ </font><br/>Error:(" + ex.getMessage() + ")");
                                        }

                                    } else if (p.getUserType() == 4 || p.getUserType() == 5) {

                                        try {

                                            ModelOfProfessor modelOfProfessor = new ModelOfProfessor();
                                            ResultSet rs = modelOfProfessor.ViewMyCoursesProfessor(p.getCode());

                                            if (!rs.isBeforeFirst()) {
                                                out.println("<font color='blue'>There is no Courses Untill Now ^_^ </font>");
                                            }

                                    %>


                                    <%                        while (rs.next()) {
                                          //  out.println(rs.getInt("ID"));

                                    %>
                                    <div class="col-md-4 ">
                                        <div class="alert alert-info text-center">
                                            <h4> <%= rs.getString("SubjectName")%> </h4> 
                                            <hr />
                                            <i class="fa fa-warning fa-4x"></i>
                                            Semester<font color="red"><%= rs.getString("semester")%></font>
                                            <br/>

                                            Code:<font color="red"><%= rs.getString("Code")%></font>
                                            <br/>

                                            Begins In:
                                            <font color="red"><%= rs.getString("subjectteachingstuff.CourseOpeningFrom")%></font>
                                            <br/>
                                            Ends In:
                                            <font color="red"><%= rs.getString("subjectteachingstuff.CourseOpeningTo")%></font>
                                            <br/>
                                            Added By:
                                            <font color="red"><%= rs.getString("subjectteachingstuff.AddedBy")%></font>

                                            <br/>


                                            <hr />
                                            <a href="?page=CoursePosts&Subject_Code=<%=rs.getInt("ID")%>" class="btn btn-info">Read Full Details</a> 
                                        </div>
                                    </div>
                                    <%                            }
                                        } catch (Exception ex) {
                                            out.println("<font color='blue'>SomeThing Wrong is happened  ^_^ </font>");
                                        }

                                    } else if (p.getUserType() == 3) {

                                        try {

                                            ModelOfFaculityAdmin modelOfFacultyAdmin = new ModelOfFaculityAdmin();
                                            ResultSet rs = modelOfFacultyAdmin.ViewFaculityCourses(p.getFaculityID(), p.getUniversityID());

                                            if (!rs.isBeforeFirst()) {
                                                out.println("<font color='blue'>There is no Courses Untill Now ^_^ </font>");
                                            }

                                    %>

                                    <%                        while (rs.next()) {
                                           // out.println(rs.getInt("ID"));

                                    %>
                                    <div class="col-md-4 ">
                                        <div class="alert alert-info text-center">
                                            <h4> <%= rs.getString("SubjectName")%> </h4> 
                                            <hr />
                                            <i class="fa fa-warning fa-4x"></i>

                                            Open Course In Date<font color="red"><%= rs.getString("OpenCourseInDate")%></font>
                                            <br/>
                                            Open From Date<font color="red"><%= rs.getString("OpenFromDate")%></font>
                                            <br/>
                                            Open To Date<font color="red"><%= rs.getString("OpenToDate")%></font>
                                            <br/>

                                            Code:<font color="red"><%= rs.getString("Code")%></font>
                                            <br/>

                                            <br/>


                                            <hr />
                                            <a href="?page=CoursePosts&Subject_Code=<%=rs.getInt("ID")%>" class="btn btn-info">Read Full Details</a> 
                                        </div>
                                    </div>
                                    <%                            }
                                        } catch (Exception ex) {
                                            out.println("<font color='blue'>SomeThing Wrong is happened  ^_^ </font>");
                                        }

                                    } else if (p.getUserType() == 2) {

                                        try {

                                            ModelOfUniversityAdmin modelOfUniversityAdmin = new ModelOfUniversityAdmin();
                                            ResultSet rs = modelOfUniversityAdmin.ViewUniversityCourses(p.getUniversityID());
                                            if (!rs.isBeforeFirst()) {
                                                out.println("<font color='blue'>There is no Courses Untill Now ^_^ </font>");
                                            }

                                    %>

                                    <%                        while (rs.next()) {

                                    %>
                                    <div class="col-md-4 ">
                                        <div class="alert alert-info text-center">
                                            <h4> <%= rs.getString("SubjectName")%> </h4> 
                                            <hr />
                                            <i class="fa fa-warning fa-4x"></i>
                                            Open Course In Date<font color="red"><%= rs.getString("OpenCourseInDate")%></font>
                                            <br/>
                                            Open From Date<font color="red"><%= rs.getString("OpenFromDate")%></font>
                                            <br/>
                                            Open To Date<font color="red"><%= rs.getString("OpenToDate")%></font>
                                            <br/>

                                            Code<font color="red"><%= rs.getString("Code")%></font>
                                            <br/>
                                            Faculty<font color="red"><%= MyPerson.ReturnFaculityNameFromCourses(rs.getInt("FaculityID"))%></font>
                                            <br/>
                                            <br/>


                                            <hr />
                                            <a href="?page=CoursePosts&Subject_Code=<%=rs.getInt("ID")%>" class="btn btn-info">Read Full Details</a> 
                                        </div>
                                    </div>
                                    <%                            }
                                        } catch (Exception ex) {
                                            out.println("<font color='blue'>SomeThing Wrong is happened  ^_^" + ex.getMessage() + " </font>");
                                        }

                                    } else {
                                        out.println("<font color='blue'>You shouldn't be here ^_^ </font>");

                                    %>

                                    <%                        }
                                    %>


                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.ROW-->

                </div>


            </div>




        </div> <!--end  rightcontent -->
    </body>
    <% } else {
            response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

        }%>
</html>
