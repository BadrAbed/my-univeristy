<%@page import="java.sql.ResultSet"%>
<%@page import="models.ModelOfMyAdmin"%>
<%@page import="models.MyPerson"%>
<!DOCTYPE html>
<html>
    <head>

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
                                                        System.out.println("<font color='blue'>Something wrong is happened ^_^</font><font color='red'>(Error:" + ex.getMessage() + ")</font>");
                                                    }
                                                %>

                                        </ul>        
                                    </li>
                                    <li ><a  target="_blank" href="https://www.youtube.com/playlist?list=PLhjtuc8tKeGJ1hjgWRKGID-SzNkFn-epI">Description</a></li>
                                        <% if (session.getAttribute("UserObject") != null) {
                                        %>
                                    <li ><a href="MyAccount.jsp">Me</a></li>
                                        <% }else{ %>
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
<!--Code: https://goo.gl/tzqdDh

This web app goal is making the communications between students and constructors as possible as well.

 Students can download materials,post a post and a comment and chat with their instructors and rate them.
Instructors can post posts and comments,put grades to students,upload materials.
      -->



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




            <!-- strart feature-->
            <div class="feature   ">
         

                <div class="container text-center" >
                    <h1 style="font-size:20px; font-family: fantasy; color:#0078a3;"> project team</h1>
                    <br/>
                    <div class="box"  style="float:left; margin-left:15px;">
                        <img style="margin-top:3px; max-width: 400px;
    border-radius: 80%;
    margin-bottom: 40px; background-color: #FFFFFF; border: 2px solid #fcb43f;"  src="images/MeineUser.png"/>
                        <h3>Mohamed Farid</h3>
                        <p><a href="mailto:mohamedgalal9454@gmail.com">mohamedgalal9454@gmail.com</a></p>

                    </div>
                    
                    
                    
                    
                    
                    <div class="box" style="float:left; margin-left:15px;">
                        <img style="margin-top:3px; max-width: 400px;
    border-radius: 80%;
    margin-bottom: 40px; background-color: #FFFFFF; border: 2px solid #fcb43f;" src="images/MeineUser.png"/>
                        <h3>Ahmed Sobhy </h3>
                        <p><a href="mailto:ahmed.sobhy29793@gmail.com">ahmed.sobhy29793@gmail.com</a></p>

                    </div>



                    <div class="box" style="float:left; margin-left:15px;">
                        <img style="margin-top:3px; max-width: 400px;
    border-radius: 80%;
    margin-bottom: 40px; background-color: #FFFFFF; border: 2px solid #fcb43f;" src="images/MeineUser.png"/>
                        <h3>Badr Abed </h3>
                        <p><a href="mailto:baderabed56@yahoo.com">baderabed56@yahoo.com</a></p>

                    </div>




                    <div class="box" style="float:left ; margin-left:15px;">
                        <img  style="margin-top:3px; max-width: 400px;
    border-radius: 80%;
    margin-bottom: 40px; background-color: #FFFFFF; border: 2px solid #fcb43f;" src="images/MeineUser.png"/>
                        <h3>Ahmed Mostafa</h3>
                        <p><a href="mailto:a.mostafa679@yahoo.com">a.mostafa679@yahoo.com</a></p>

                    </div>


                    <div class="box" style="float:left; margin-left:15px;">
                        <img style="margin-top:3px; max-width: 400px;
    border-radius: 80%;
    margin-bottom: 40px; background-color: #FFFFFF; border: 2px solid #fcb43f;" src="images/MeineUser.png"/>
                        <h3>Ahmed Fadl</h3>
                        <p><a href="mailto:mohamedgalal9454@gmail.com">mohamedgalal9454@gmail.com</a></p>

                    </div>
  
                    
                  
<marquee  direction="right" onmouseover="this.stop();" onmouseout="this.start();">
                        <a style=" margin-top: 10px;color:#000; font-size:30px; font-family: fantasy" href="AA">Welcome to! </a>
                        <a style=" margin-top: 10px; color:#000;font-size:30px; font-family: fantasy" href="dd">My University</a>
                        
                    </marquee>

                    
                </div>
   
                </div>

             

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