<%-- 
    Document   : 6StudentRegisterCourses
    Created on : Mar 14, 2016, 7:01:08 AM
    Author     : mohamed
--%>
<%@page import="java.util.Locale"%>
<%@page import="models.MyPerson"%>
<%@page import="models.ModelOfStudent"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("UserObject") != null) {
        MyPerson p = (MyPerson) session.getAttribute("UserObject");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="rightcontentRigs" style="margin-left: 70px;">
            <div id="top_pageRig">
                <h1>Register courses</h1>


            </div>
            <div class="title"><h1>Courses Registration  This Year		</h1></div>
            <div id="downRig">

                <form action="RegisterCourses" method="POST">
                    <table border="1" class="gridtable" style="margin-left: 150px;">
                        <tbody>
                            <tr>
                                <td colspan="12" align="center" bgcolor="#3b7ebb">Please select courses to register this semester:</td>
                            </tr>
                            <tr>

                                <th  colspan="2" align="center">Code</th>
                                <th  align="center">Course Name</th>
                                <th align="center">Written Grade</th>
                                <th align="center">Midterm Grade</th>
                                <th align="center">Final Grade</th>
                                <th align="center">Description</th>
                                <th align="center">For Term</th>
                                <th align="center">Term Begins in:</th>
                                <th align="center">Term Ends in:</th>
                                <th align="center">Registration Date From:</th>
                                <th align="center">Registration Date To:</th>
                                <th align="center">By:</th>
                            </tr>
                            <%
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String currentDateString = sdf.format(new Date());
                                // out.println(currentDateString);
                                //  15-10-2013
                               /* String[] theDate = currentDateString.split("-");
                                 int currentDay;//=date.substring(0, 2);
                                 int currentMonth;//=date.substring(4, 5);
                                 int currentyear;//=date.substring(6);
                                 currentDay = Integer.parseInt(theDate[0]);
                                 currentMonth = Integer.parseInt(theDate[1]);

                                 currentyear = Integer.parseInt(theDate[2]);
                                 */
                                /* out.println("<br/>currentDay=" + currentDay);
                                 out.println("<br/>currentMonth=" + currentMonth);
                                 out.println("<br/>currentyear=" + currentyear);
                                 */
                                ModelOfStudent modelOfStudent = new ModelOfStudent();
                                //  p= new ModelOfStudent();

                                ResultSet rs = modelOfStudent.ViewRegisterCourses(p.getFaculityID(), p.getUniversityID(), p.getLevelID(), p.getDepartmentID(), p.getCode());
                                out.println("<br/><font color='green' >Department</font>:<font color='blue' >" + ModelOfStudent.ReturnDepartmentName(p.getCode()) + "</font>");
                                out.println("<br/><font color='green' >Level</font>:<font color='blue' >" + ModelOfStudent.ReturnLevelName(p.getCode()) + "</font>");

                                while (rs.next()) {
                                    boolean OpenCourse = false;
                                    String fromDateString = rs.getString("DateFrom");
                                    String toDateString = rs.getString("DateTo");
                                    /* out.println("<br/>fromDateString:" + fromDateString);
                                     out.println("<br/>toDateString:" + toDateString);
                                     out.println("<br/>currentDateString" + currentDateString);
                                     out.println("<br/>SubjectName:" + rs.getString("SubjectName"));
                                     out.println("<br/>");*/
                                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                                    Date fromDate = formatter.parse(fromDateString);
                                    Date toDate = formatter.parse(toDateString);
                                    Date currentDate = formatter.parse(currentDateString);
                                    /* out.println("<br/>fromDate:" + fromDate);
                                     out.println("<br/>toDate:" + toDate);
                                     out.println("<br/>currentDate:" + currentDate);*/
                                    String messages = "<font color='red' >You can't register this course now </font>";
                                    if (currentDate.after(fromDate) && currentDate.before(toDate)) {
                                        OpenCourse = true;
                                        messages = "<br/><font color='blue' >currentDate.isAfter(fromDate) && currentDate.isBefore(toDate)</font>";

                                    } else if (currentDate.equals(fromDate) && currentDate.before(toDate)) {

                                        OpenCourse = true;
                                        messages = "<br/><font color='blue' >currentDate.equals(fromDate)&& currentDate.isBefore(toDate)</font>";
                                    } else if (currentDate.after(fromDate) && currentDate.equals(toDate)) {

                                        OpenCourse = true;
                                        messages = "<br/><font color='blue' >currentDate.isAfter(fromDate)&& currentDate.isEqual(toDate)</font>";

                                    } else if (currentDate.equals(fromDate) && currentDate.equals(toDate)) {

                                        OpenCourse = true;
                                        messages = "<br/><font color='blue'>currentDate.isEqual(fromDate)&& currentDate.isEqual(toDate)</font>";

                                    }
                                    //out.println(messages);

                                    /* int DayFrom = Integer.parseInt(rs.getString("DayFrom"));
                                     int DayTo = Integer.parseInt(rs.getString("DayTo"));
                                     int MonthFrom = Integer.parseInt(rs.getString("MonthFrom"));
                                     int MonthTo = Integer.parseInt(rs.getString("MonthTo"));
                                     int OpenForYear = Integer.parseInt(rs.getString("OpenForYear"));

                                     if (OpenForYear == currentyear) {//ex if course open until 2018 and now is 2017
                                     if (currentMonth == MonthFrom && currentMonth == MonthTo) {
                                     //5 = 5 && 5=5){ 
                                     // if monthfrom=5,monthto=5 currentmonth must =5  to open course 
                                     if (currentDay >= DayFrom && currentDay <= DayTo) {
                                     // if dayfrom=5,dayto=7 currentday must be betwen them to open course 
                                     OpenCourse = true;
                                     }
                                     }
                                     else if (currentMonth == MonthFrom && currentMonth < MonthTo) {
                                     // if monthfrom=5,monthto=6 currentmonth must =5  to open course 
                                     if (currentDay >= DayFrom && currentDay <= DayTo) {
                                     // if dayfrom=5,dayto=7 currentday must be betwen them to open course 
                                     OpenCourse = true;
                                     }
                                     }


                                     }*/
                                   // if (OpenCourse) {
                                    //   out.println("<br/>Course num :" + rs.getInt("ID") + " is opening now ^_^");
                                    //    out.println("<br/>because:" + messages);

                            %>

                            <tr>
                                <td><%  if (OpenCourse) {%>
                                    <input type="checkbox" checked="" name="SelectedSubjects" value="<%=rs.getInt("ID")%>" onchange="handleClick(this);">
                                    <% } else {
                                            out.println(messages);
                                        }%>
                                </td>
                                <td><%= rs.getString("Code")%></td>
                                <td><%= rs.getString("SubjectName")%></td>
                                <td><%= rs.getInt("WritenGrade")%></td>
                                <td><%= rs.getInt("MidtermGrade")%></td>
                                <td><%= rs.getInt("FinalExamGrade")%></td>
                                <td><%= rs.getString("CourseDescription")%></td>
                                <td><%= rs.getString("Term")%></td>
                                <td><%= rs.getString("OpenFromDate")%></td>
                                <td><%= rs.getString("OpenToDate")%></td>
                                <td><%= rs.getString("DateFrom")%></td>
                                <td><%= rs.getString("DateTo")%></td>
                                <td><%= rs.getString("AddedBy")%></td>

                                <!--   <td align="center">Unlimited</td><td align="center">239</td>
                                -->
                            </tr>
                            <tr>
                                <td colspan="12" align="center">

                                </td>
                            </tr>

                            <!--  <input type="text" hidden="" value="<rs.getString("Term")%>" />
                            -->
                            <%

                                    //}//end of OpenCourse=true
                                }
                            %>
                        </tbody></table>

                    <input type="submit" value="submit"   style="   width: 200px;
                           height: 40px;text-align: center;
                           margin-left: 250px;
                           margin-top: 20px;
                           background-color:#28a4c9;
                           color: #f5f4f4;
                           border:0px;
                           border-radius: 25px;"/>
                </form>
            </div>
        </div>
        <!--end  rightcontent -->

    </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("index.jsp"));

    }
%>