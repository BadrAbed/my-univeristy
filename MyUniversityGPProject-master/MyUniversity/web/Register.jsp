<%@page import="java.sql.ResultSet"%>
<%@page import="models.ModelOfMyAdmin"%>
<%@page import="models.MyPerson"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
            function ValidateEmail(inputText)
            {
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (inputText.value.match(mailformat))
                {
                    document.RegisterForm.Mail.focus();
                    // var m= document.getElementsByTagName("Registermessage").innerHTML = " Valid Email Address ^_^";

                    return true;
                }
                else
                {
                    alert("You have entered an invalid email address Do you want to continue?!");
                    //m=document.getElementsByTagName("Registermessage").innerHTML= "You have entered an invalid email address!" ;

                    document.RegisterForm.Mail.focus();
                    return false;
                }
            }
        </script>

        <meta  charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <title>My University</title>



        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700' rel='stylesheet' type='text/css'>


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
        <script src="dropdown-menu.js" type="text/javascript"></script>


    </head>
    <body>





        <div id="wurrap">
            <!-- start header-->

            <div id="top"></div>
            <div class="header">










                <div class="overlay">     

                    <div class="container table">


                        <div class="navbar">

                            <!--               
                                  
                           
                           
                           
                                  
                           
                           
                           
                           
                                     
                                     
                                  
                                  
                                  
                                           
                                           
                                     
               
               
                            <!--start menu-->

                            <div class="logo">

                                <div class="menu">         
                                    <span class="main-color"><i class="fa fa-graduation-cap">
                                        </i>My

                                        <span>university</span></span>
                                </div>


                            </div>
                            <div class="container-menu">
                                <ul id="nav">



                                    <li >
                                        <i class="fa fa-home" style="font-size:20px;color:#000"></i>
                                        <a href="index.jsp">Home</a></li>
                                    <li><a href="#">Courses</a>

                                        <ul>
                                            <%
                                                try {
                                                    ResultSet rs = ModelOfMyAdmin.ViewMyUniversityCourses();
                                                    if (!rs.isBeforeFirst()) {
                                                        out.println("<font color='blue'>There is no courses till now ^_^</font>");
                                                    }
                                                    while (rs.next()) {
                                            %>
                                            <li><a href="CourseGuestPosts.jsp?CourseCode=<%=rs.getInt("ID")%>"><%=rs.getString("SubjectName")%></a></li>
                                                <% }
                                                    } catch (Exception ex) {
                                                        out.println("<font color='blue'>Something wrong is happened ^_^</font><font color='red'>(Error:" + ex.getMessage() + ")</font>");

                                                    }
                                                %>

                                        </ul>        
                                    </li>
                                    <li ><a  target="_blank" href="https://www.youtube.com/playlist?list=PLhjtuc8tKeGJ1hjgWRKGID-SzNkFn-epI">Description</a></li>
                                        <% if (session.getAttribute("UserObject") != null) {
                                        %>
                                    <li ><a href="MyAccount.jsp">Me</a></li>
                                        <% } else { %>
                                    <li ><a href="Register.jsp">Register</a></li>

                                    <%}
                                    %>

                                </ul>

                            </div>

                            <!--end menu-->


                            <div class="table_row">




                                <div class="intro text-center">
                                    <div class="text">
                                        <h1 class="upper">welcome to!                                                          <span class="main-color">My University ...</span></h1>
                                        <div class="upper2">
                                            <p  style="font-size:17px;">
                                                we try to provide you the communication with 
                                                <br/>
                                                your  instructors , chat with them
                                                <br/>
                                                ,register in courses ,find their material,post and comment in them .
                                            </p>
                                        </div>
                                        <div class="buttons">
                                            <button class="upper"> our app</button>
                                            <button class="upper">our works</button>
                                        </div>
                                    </div>
                                </div>




                                <div class="container-left">

                                    <% if (session.getAttribute("UserObject") == null) {
                                            MyPerson p = (MyPerson) session.getAttribute("UserObject");
                                    %>
                                    <form class="form-signin" action="MyLogin" method="POST">


                                        <input type="text" class="form-control" name= "UserEmail" placeholder="Email" required autofocus>

                                        <input type="password" class="form-control"  name="UserPassword"  placeholder="Password" required>

                                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                                            Sign in                </button>
                                        <label class="checkbox pull-left">
                                            <input type="checkbox" value="remember-me">
                                            Remember me
                                        </label>
                                        <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>

                                        <% } else {
                                            MyPerson p = (MyPerson) session.getAttribute("UserObject");

                                        %>
                                        Welcome <%= p.getFName()%>  <%= p.getLName()%> 
                                        <% } %>

                                    </form>




                                </div>





                            </div>

                        </div>

                        <span class="arrow">

                        </span>
                    </div>








                </div>
            </div>
            <!-- end header-->


            <% MyPerson p = new MyPerson();%>
            <br/>
         <font style="color: #02b3e4;font-size: x-large;">Register</font>
            
            <br/><br/>
            <form method="POST" name="RegisterForm" action="RegisterGuestUser">
                <table width="100%">
                    <tr>
                        <td> <font style="color: #905;font-size: large;">Code</font> </td>
                        <td>
                            <font style="color: #905;font-size: large;">Mail</font> </td>
                    </tr>
                    <tr>
                        <td>         
                            <input type="text" name="Code" style="margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;" required="" placeholder="Code ex:20120399" value="" onkeypress="return isNumberKey(event)" /></td>
                        <td> <input type="Email" name="Mail" onchange="ValidateEmail(this)" style="margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;" placeholder="Mail" required="" value="" /></td>
                        <!--<td> <input type="text" name="Registermessage" placeholder="message"  required="" value="" /></td>-->

                    </tr>
                    <tr>
                        <td> <font style="color: #905;font-size: large;">First Name</font> </td>
                        <td>   <font style="color: #905;font-size: large;">Last Name</font> </td>
                    </tr>
                    <tr>
                        <td><input type="text" style="margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;" name="FName" placeholder="First Name" required="" value="" /></td>
                        <td>            <input type="text" name="LName" required="" style="margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;"  placeholder="Last Name" value="" /></td>
                    </tr>
                    <tr>
                        <td><font style="color: #905;font-size: large;">Password</font></td>
                        <td><font style="color: #905;font-size: large;">Confirm Password</font> </td>
                    </tr>
                    <tr>
                        <td><input type="password" required="" style="margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;"  placeholder="Password" name="Password" value="" /></td>
                        <td> <input type="password" required="" placeholder="ConfirmPassword" name="ConfirmPassword"  style="margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;" value="" /></td>
                    </tr>
                    <tr>
                        <td>  <font style="color: #905;font-size: large;">Type</font></td>
                        <td><font style="color: #905;font-size: large;">Gender</font> </td>
                    </tr>
                    <tr>
                        <td> <select name="Type" required="">
                                <option value="2">University Admin</option>
                                <option value="3">Faculty Admin</option>

                            </select></td>
                        <td> <select name="Gender" required="">
                                <option>Male</option>
                                <option> Female</option>

                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="2" >
                            <input  onclick="ValidateEmail(document.RegisterForm.Mail)" style="padding-left: 5px;
                                    background-color: #333; border: 1px;  
                                    color: #FFF; text-align: center;width:70%;  height: 40px; margin-left: 30px; margin-top: 20px;"
                                    type="submit"  name="Register" value="Register">  
                        </td>
                    </tr>
                </table>

            </form>   

        </div>
        <!-- end feature-->







        <div id="footer">
            <div id="send"> 
                <form action="SendProblem" method="POSt">

                    <input type="text" name="UserName"  required="" placeholder="write your name here!" />
                    <input type="text" name="UserEmail" required placeholder="write your mail here!" />


                    <textarea    name="UserMessage" required placeholder="write your message here!"></textarea> 

                    <input type="submit" value="send message"/>




                </form>


            </div>
            <div id="contects">
                <div id="left_con">
                    <br/>
                    <a href="https://www.facebook.com/Mohamed.AbdullahFCIH" target="_blank"><img src="images/fb.png"/></a>
                    <br/>
                    <a href="" target="_blank"><img src="images/sky.png"/> </a>
                    <br/>

                    <a href="https://twitter.com/mohamedgalal943" target="_blank"><img src="images/tw.png"/> </a>
                    <br/>
                    <a href="" target="_blank"><img src="images/srs_14.png"/> </a>  
                </div>


                <div id="right_con">
                    Contact Information<br/>

                    Mobile: +2 01112858168<br/>


                    Skype: mohamed.gallal9454<br/>

                    Address<br/>
                    Egypt, Cairo.<br/>

                    Email<br/>
                    <a href="mailto:mohamedgalal9454@gmail.com"> mohamedgalal9454@gmail.com </a></br>


                </div> 
            </div>


            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>



            <script src="js/bootstrap.min.js"></script>





            <!--
            
           
    <script src="jquery-1.12.2.min.js"></script>
    
    
    <script src="js/bootstrap.min.js"></script>
            -->
        </div>
        <!-- end footer-->

        <div id="end">

            Copy rights reserved � <a href="http://myuniversity.com">university.com 2016</a> 
        </div>
    </body>
</html>
</body>
</html>
