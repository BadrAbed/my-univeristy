<%@page import="models.MyPerson"%>
<!DOCTYPE html>
<% if (session.getAttribute("UserObject") != null) {
        MyPerson p = (MyPerson) session.getAttribute("UserObject");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><%= p.getFName()%><%= p.getLName()%></title>

        
        <!-- BOOTSTRAP STYLES-->
        <link href="cssNew/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="cssNew/font-awesome.css" rel="stylesheet" />
        <!--CUSTOM BASIC STYLES-->
        <link href="cssNew/basic.css" rel="stylesheet" />
        <!--CUSTOM MAIN STYLES-->
        <link href="cssNew/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
        <script src="dropdown-menu.js" type="text/javascript"></script>


        <script type="text/javascript">
            <!--
            function toggle_visibility(id) {
                var e = document.getElementById(id);
                if (e.style.display == 'block')
                    e.style.display = 'none';
                else
                    e.style.display = 'block';
            }
            //-->
        </script>







        <script type="text/javascript">
            $(document).ready(function () {
                $('.text_container').addClass("hidden");

                $('.text_container').click(function () {
                    var $this = $(this);

                    if ($this.hasClass("hidden")) {
                        $(this).removeClass("hidden").addClass("visible");

                    } else {
                        $(this).removeClass("visible").addClass("hidden");
                    }
                });
            });
        </script>





        <script src="tinymce/js/tinymce/tinymce.min.js"></script>
        <script>tinymce.init({selector: 'textarea2'});</script>

    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><%= MyPerson.ReturnUserTypeName(p.getCode())%> </a>
                </div>

                <div class="header-right">
                    <h3>

                        <%

                            if (MyPerson.ReturnFaculityName(p.getCode()).equals("General")) {
                                out.println("You are an Admin ^_^");
                            } else {
                                out.println("Faculty of " + MyPerson.ReturnFaculityName(p.getCode()));
                            }

                        %></h3>

                </div>
            </nav>
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li>
                            <div class="user-img-div">
                                <img src="images/MeineUser.png" class="img-thumbnail" />

                                <div class="inner-text">
                                    <%= p.getFName()%><%out.println(" "); %><%= p.getLName()%>
                                    <br />

                                </div>
                            </div>

                        </li>


                        <li>
                            <a  class="active-menu-top"  href="?page=Courses"><i class="fa fa-dashboard "></i>Courses</a>
                        </li>



                        <li>
                            <a target="_blank" href="Chat.jsp"><i class="fa fa-desktop "></i>Chat </a>

                        </li>
                        <li>
                            <a target="_blank" href="Chat2.jsp"><i class="fa fa-desktop "></i>Chat2 </a>

                        </li>
                        <li>
                            <a href="?page=EditProfile"><i class="fa fa-yelp "></i>Edit Profile </a>
                        </li>





                        <li><a href="?page=News">News</a></li>
                            <%
                                if (p.getUserType() == 1) {


                            %>
                        <li><a href="?page=AddUniversity">Add University with it's Admin</a></li>
                        <li><a href="?page=ViewUniversity">View University Admins </a></li>

                        <%        } else if (p.getUserType() == 2) {
                        %>
                        <li><a href="?page=2UniversityAdminAddFaculity">Add Faculty </a></li>
                        <li><a href="?page=2UniversityAdminAddFaculityAdmin">Add Faculty Admin</a></li>

                        <li><a href="?page=2UniversityAdminViewUsers">View Users  </a></li>

                        <%
                        } else if (p.getUserType() == 3) {
                        %>
                        <li><a href="?page=3FaculityAdminAddStudents">Add Students</a></li>
                        <li><a href="?page=3FaculityAdminViewStudents">View Students</a></li>
                        <!-- <li><a href="?page=3FaculityAdminAddYear">Add Year</a></li>-->
                        <li><a href="?page=3FaculityAdminAddSubjects">Add Courses</a></li>
                        <li><a href="?page=3FaculityAdminViewSubjects">View Courses</a></li>
                        <li><a href="?page=3FaculityAdminOpenCourses">Open Courses</a></li>
                        <li><a href="?page=3FaculityAdminViewOpenCourses">View Open Courses</a></li>
                        <li><a href="?page=3FaculityAdminAddInstructor">Add Instructor To Open Courses</a></li>
                        <li><a href="?page=3FaculityAdminViewRatingsAjax">View Ratings</a></li>

                        <%
                        } else if (p.getUserType() == 4) {

                        %>


                        <%                    } else if (p.getUserType() == 5) {
                        %>


                        <%        } else if (p.getUserType() == 6) {

                        %>

                        <li><a href="?page=6StudentRegisterCourses">Register Courses</a></li>
                        <li><a href="?page=Transcript">Transcript</a> </li>
                        <li><a href="?page=6StudentRating">Rating</a> </li>

                        <%        } else {
                        %>

                        <%
                            }
                        %>
                        <li>
                            <a  href="MyLogout"><i class="fa fa-square-o "></i>logout</a>
                        </li>
                    </ul>
                </div>

            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <%! String pageName = null;%>
                <%                        try {

                        pageName = request.getParameter("page");
                        //     out.println(request.getAttribute("innerpage"));
                        //                    out.println(pageName);

                        if (pageName != null) {
                            pageName += ".jsp";

                           // out.println(pageName);
%>

                <jsp:include page="<%=pageName%>"></jsp:include>

                <%

                    } else {
                        out.println("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
                        out.println("<center><font color='blue' ><h1>Welcome " + p.getFName() + " " + p.getLName() + "</h1></font></center>");
                    }

                } catch (Exception ex) {

                   out.println("Error:"+ex.getMessage());

                %>
                <h1>Page Not Found ^_^  </h1>
                <%  
                }//end of catch %> 

            </div>
            <!-- /. WRAPPER  -->
            <div id="footer-sec">
                <p class="lf">Copyright &copy; <a href="#">team My University</a>. All Rights Reserved</p>
            </div>
            <!-- /. FOOTER  -->
            <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
            <!-- JQUERY SCRIPTS -->
            <script src="js/jquery-1.10.2.js"></script>
            <!-- BOOTSTRAP SCRIPTS -->
            <script src="js/bootstrap.js"></script>
            <!-- METISMENU SCRIPTS -->
            <script src="js/jquery.metisMenu.js"></script>
            <!-- CUSTOM SCRIPTS -->
            <script src="js/custom.js"></script>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>



        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

<% } else {
        response.sendRedirect(response.encodeURL("index.jsp"));

    }%>