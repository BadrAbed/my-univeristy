<%-- 
    Document   : CourseGrades
    Created on : Mar 16, 2016, 2:31:29 PM
    Author     : mohamed
--%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.MyPerson"%>
<%@page import="models.ModelOfProfessor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.MyDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("UserObject") != null) {
        MyPerson p = (MyPerson) session.getAttribute("UserObject");


%>
<html>
    <head>
        <script>
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%! int Subject_Code;
            boolean IsUserRegistgerInThisSubjectOrNot;
            boolean OpenCourse;
        %>
        <% try {
                Subject_Code = Integer.parseInt(request.getParameter("Subject_Code"));
                IsUserRegistgerInThisSubjectOrNot = false;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String currentDateString = sdf.format(new Date());
                ModelOfProfessor modelOfProfessor = new ModelOfProfessor();

                /* out.println("<br/>fromDate:" + fromDate);
                 out.println("<br/>toDate:" + toDate);
                 out.println("<br/>currentDate:" + currentDate);*/
                String messages = "<br/><font color='red' >You can't update grades in this course now </font>";

                // String Subject_Code2=    (String)session.getAttribute("Subject_Code");
                if (p.getUserType() == 4 || p.getUserType() == 5) {
                    String fromDateString = ModelOfProfessor.ReturnCourseOpeningFrom(p.getCode(), Subject_Code);
                    String toDateString = ModelOfProfessor.ReturnCourseOpeningTo(p.getCode(), Subject_Code);
                    out.println("<br/>Term Begins in Date:" + fromDateString);
                    out.println("<br/>Term Ends in Date:" + toDateString);
                    out.println("<br/>Current Date:" + currentDateString);
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        if (fromDateString != null || toDateString != null) {
                            Date fromDate = formatter.parse(fromDateString);
                            Date toDate = formatter.parse(toDateString);
                            Date currentDate = formatter.parse(currentDateString);
                            /*  out.println("<br/>fromDateString:" + fromDateString);
                             out.println("<br/>toDateString:" + toDateString);
                             out.println("<br/>currentDateString:" + currentDateString);

                             out.println("<br/>if currentDate is after from date :" + currentDate.after(fromDate));
                             out.println("<br/>if currentDate is before to date  :" + currentDate.before(toDate));
                             out.println("<br/>if currentDate is equals from  date :" + currentDate.equals(fromDate));
                             out.println("<br/>if currentDate is before to date :" + currentDate.before(toDate));
                             out.println("<br/>if currentDate is after from  date :" + currentDate.after(fromDate));
                             out.println("<br/>if currentDate is equals to date " + currentDate.equals(toDate));


                             long currentDateDiffFromDate = currentDate.getTime() - toDate.getTime();
                             long currentDateDiffToDate = currentDate.getTime() - toDate.getTime();
                           
                             out.println("<br/>currentDateDiffFromDate:" + currentDateDiffFromDate);
                             out.println("<br/>currentDateDiffToDate:" + currentDateDiffToDate);

                             out.println("<br/>Year(current:" + currentDate.getYear() + ")(from:" + fromDate.getYear() + ")");
                             out.println("<br/>Year(current:" + currentDate.getYear() + ")(to:" + toDate.getYear() + ")");
                             out.println("<br/>Month(current:" + currentDate.getMonth() + ")(from:" + fromDate.getMonth() + ")");
                             out.println("<br/>Month(current:" + currentDate.getMonth() + ")(to:" + toDate.getMonth() + ")");
                             out.println("<br/>Day(current:" + currentDate.getDay() + ")(from:" + fromDate.getDay() + ")");
                             out.println("<br/>Day(current:" + currentDate.getDay() + ")(to:" + toDate.getDay() + ")");
                             */
                            OpenCourse = false;
                            if (currentDate.after(fromDate) && currentDate.before(toDate)) {
                                OpenCourse = true;
                                messages = "<br/><font color='blue'>Current Date is between Term Beginning Date and Term Ending Date )</font>";

                            } else if (currentDate.equals(fromDate) && currentDate.before(toDate)) {

                                OpenCourse = true;
                                messages = "<br/><font color='blue'>Current Date is equals to  Term Beginning Date and  before Term Ending Date </font>";
                            } else if (currentDate.after(fromDate) && currentDate.equals(toDate)) {

                                OpenCourse = true;
                                messages = "<br/><font color='blue'>Current Date is after Term Beginning Date and equals to Term Ending Date </font>";

                            } else if (currentDate.equals(fromDate) && currentDate.equals(toDate)) {

                                OpenCourse = true;
                                messages = "<br/>Current Date is equals to  Term Beginning Date and Term Ending Date </font>";

                            }
                            out.println(messages);

                        }
//if resultset is empty fromDate or toDate wilbe null

                    } catch (Exception ex) {
                        out.println("<script type='text/javascript' > alert('Begin in Date, End in Date  are  a date value please   ^_^ ');history.back();</script>");
                        System.out.println("Course Grades.jsp OpenFromDate Servlet Error:" + ex.getMessage());
                    }
                    ResultSet rs = modelOfProfessor.ViewMyCoursesProfessor(p.getCode());

                    while (rs.next()) {

                        //  SubjectsAssistantCode.add(rs.getInt("ID"));
                        if (rs.getInt("ID") == Subject_Code) {
                            IsUserRegistgerInThisSubjectOrNot = true;
                        }
                    }
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


                <li>

                    <a href="?page=CourseGrades&Subject_Code=<%=Subject_Code%>">
                        <!--       <form action="?page=Course Grades" method="POST">
                                   <input hidden="" type="text" name="Subject_Code" value="<%=Subject_Code%>" />
                                   <input type="submit" value="Grades"/>
   
                               </form>-->
                        Grades
                    </a>
                </li>

            </ul>
        </div>
        <%
            if (OpenCourse) {
        %>


        <!--start rightcontent -->
        <div id="rightcontentRigs" style="margin-left: 70px;">
            <table border="1" width="25%" cellpadding="5">
                <thead> 
                <th colspan="6">Grades:</th>        
                </thead>
                <tbody>
                    <tr>
                        <td><center><b>Id</b></center>
                <td><center><b>Written Grade</b></center>
            </td><td><center><b>Midterm Grade</b></center></td>
        <td> <center><b>Final Exam Grade</b></center></td>
        <td> <center><b>Action</b></center></td>
        <td> <center><b>Final Grade</b></center></td>

        </tr>
        <% try {

                /*  Connection connection = null;
                 MyDatabase ViewCourseDatabaseObject = MyDatabase.getInstance();
                 connection = ViewCourseDatabaseObject.connect_to_DB();
                 String sqlString = "SELECT * FROM subjectstudent WHERE SubjectID = '" + Subject_Code + "'";
                 Statement myStatement = connection.createStatement();
                 */
                ResultSet rs = modelOfProfessor.ViewMyStudentsInSpecialCourse(p.getCode(), Subject_Code);
                if (!rs.isBeforeFirst()) {
        %>
        <tr>
            <td colspan="6"><center><%out.print("<font color='blue' >No Students here ^_^</font>"); %></center></td>
        </tr>
        <%
            }

            while (rs.next()) {

                int FinalGrade = rs.getInt("FinalExamGrade") + rs.getInt("MidtermGrade") + rs.getInt("WritenGrade");


        %>
        <tr>
        <form  action="addgrade" method="post">
            <td><center><%=rs.getString("StudentID")%></center></td>
            <td><center> <input type="text" name="WritenGrade" onkeypress="return isNumberKey(event)"  value="<%=rs.getString("WritenGrade")%>" /></center></td>
            <td><center><input type="text" name="MidtermGrade" onkeypress="return isNumberKey(event)"  value="<%=rs.getString("MidtermGrade")%>" /></center></td>
            <td><center>
                <% if (p.getUserType() == 4) {
                %><input type="text" name="FinalExamGrade"  onkeypress="return isNumberKey(event)"  value="<%=rs.getString("FinalExamGrade")%>" />
                <% } else if (p.getUserType() == 5) {%>
                <%=rs.getString("FinalExamGrade")%>
                <% }%>
            </center></td>
            <input type="hidden" name="SubjectID" value="<%=rs.getString("SubjectID")%>"/>
            <input type="hidden" name="StudentID" value="<%=rs.getString("StudentID")%>"/>
            <input type="hidden" name="FinalGrade" value="<%=FinalGrade%>"/>

            <td><center><input type="submit" value="add" /> </center></td>

        </form>




        <td><center><%= FinalGrade%> </center></td>


        </tr>
        <%
            }
        %>



        </tbody> 

        <% } catch (Exception ex) {
                out.println("Error in Course Grades:(first catch)" + ex.getMessage());
                System.err.println("Error in Course Grades:(first catch)" + ex.getMessage());

            } %> 
    </table>



</div>
<!--end  rightcontent -->

<%
            }//end of OpenCourse
            else {
                out.println("<br/><br/><br/><br/><br/><br/><center><font color='red' ><h1>Course date is expired</h1></font></center> ");

            }

        }//end of IsUserRegistgerInThisSubjectOrNot
        else {
            out.println("<br/><br/><br/><br/><br/><br/><center><font color='red' ><h1>You didn't register in this course ^_^</h1></font></center> ");
        }
    }//end of true Get Subject Code
    catch (Exception ex) {
        out.println("Error in Course Grades:(last catch)" + ex.getMessage());
        System.err.println("Error in Course Grades:(last catch)" + ex.getMessage());

    } %>    </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }%>