/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.validator.internal.constraintvalidators.EmailValidator;
import models.MyPerson;

/**
 *
 * @author Mohamed
 */
public class RegisterGuestUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String Code = request.getParameter("Code");
            String Mail = request.getParameter("Mail");
            String FName = request.getParameter("FName");
            String LName = request.getParameter("LName");
            String Gender = request.getParameter("Gender");

            String Type = request.getParameter("Type");
            String Password = request.getParameter("Password");
            String ConfirmPassword = request.getParameter("ConfirmPassword");
            boolean isEveryThingOKAll = true;
            int UserTypeID = 0;
            int CodeInteger = 0;

            if (Code == null || Code.isEmpty()
                    || Mail == null || Mail.isEmpty()
                    || Type == null || Type.isEmpty()
                    || Gender == null || Gender.isEmpty()
                    || Password == null || Password.isEmpty()
                    || FName == null || FName.isEmpty()
                    || LName == null || LName.isEmpty()
                    || ConfirmPassword == null || ConfirmPassword.isEmpty()) {

                out.println("<script type='text/javascript' > alert('Please fill all fields   ^_^ ');history.back();</script>");
                isEveryThingOKAll = false;
            } else {
                /* out.println("Password:" + Password + "<br/>");
                 out.println("ConfirmPassword:" + ConfirmPassword + "<br/>");
                 out.println("Type:" + Type + "<br/>");
                 out.println("Code:" + Code + "<br/>");
                 out.println("Mail:" + Mail + "<br/>");
                 out.println("FName:" + FName + "<br/>");
                 out.println("LName:" + LName + "<br/>");
                 */
                if (Password.equals(ConfirmPassword)) {
                    //out.println("Password.equals(ConfirmPassword)");
                    isEveryThingOKAll = true;

                } else {

                    out.println("<script type='text/javascript' > alert('Password Doesn't match     ^_^ ');history.back();</script>");
                    out.println("<center><br/><br/><br/><font color='red'>Password Doesn't match    ^_^</font><center>");
                    out.println("<center></br><a href='Register.jsp' >Home</a></center>");
                    isEveryThingOKAll = false;

                }
                /*   if (isEveryThingOKAll) {
                 if (Password.equals(ConfirmPassword)) {
                 out.println("<script type='text/javascript' > alert('Password Doesn't match ^_^ ');history.back();</script>");

                 isEveryThingOKAll = false;

                 }
                 }*/
                if (isEveryThingOKAll) {
                    try {
                        CodeInteger += Integer.parseInt(Code);

                    } catch (Exception ex) {
                        out.println("<script type='text/javascript' > alert('Code is an integer please   ^_^ ');history.back();</script>");
                        System.out.println("Code in Register Guests User:" + ex.getMessage());
                        isEveryThingOKAll = false;

                    }
                }
                if (isEveryThingOKAll) {
                    if (Code.length() < 4) {
                        out.println("<script type='text/javascript' > alert('Code Length must be greater than 3 letters please   ^_^ ');history.back();</script>");
                        out.println("Code Length must be greater than 3 letters please   ^_^");
                        out.println("<br/><a href='MyAccount.jsp' >Home </a>");
                        isEveryThingOKAll = false;

                    }
                }

                if (isEveryThingOKAll) {
                    if (Password.length() < 6) {
                        out.println("<script type='text/javascript' > alert('Password Length must be greater than 5 letters please   ^_^ ');history.back();</script>");
                        System.out.println("Password Length in Register Guests User");
                        isEveryThingOKAll = false;

                    }
                }

                /*  if (isEveryThingOKAll) {
                 if(Mail.indexOf('@')==-1){
                 out.println("<script type='text/javascript' > alert('EMail must have (@) please   ^_^ ');history.back();</script>");
                 System.out.println("Email @ in Register Guests User");
                 isEveryThingOKAll = false;

                 }
                 }
                 if (isEveryThingOKAll) {
                 if(Mail.length()<10){
                 out.println("<script type='text/javascript' > alert('Email Length must be greater than 9 letters please   ^_^ ');history.back();</script>");
                 System.out.println("Email Length in Register Guests User");
                 isEveryThingOKAll = false;

                 }
                 }*/
                if (isEveryThingOKAll) {
                    EmailValidator validator = new EmailValidator();
                    validator.isValid(Mail, null);
                    String pattern = "^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\\\\.[a-zA-Z]{2,4}";
                    String pattern2 = "/^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/";
                    if (validator.isValid(Mail, null)) {
                        System.out.println("Check Email in Register Guests User true(" + validator.isValid(Mail, null) + ")");
                    } else {
                        out.println("<script type='text/javascript' > alert('Email Doesn't match our Pattern ^_^ ');history.back();</script>");

                        System.out.println("Check Email in Register Guests User false(" + validator.isValid(Mail, null) + ")");
                        out.println("<center><br/><br/><br/><font color='red'>Email is invalid  ^_^ </font><center>");
                        // out.println("<center><br/><br/><br/><font color='red'>check <a target='_blank' href='http://www.w3resource.com/javascript/form/email-validation.php'>this</a> ^_^ </font><center>");

                        out.println("<center></br><a href='Register.jsp' >Home</a></center>");
                        isEveryThingOKAll = false;

                    }
                }
                if (isEveryThingOKAll) {

                    String pattern = "^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\\\\.[a-zA-Z]{2,4}";
                    String pattern2 = "[A-Za-z]{3,30}$";
                    if (FName.matches(pattern2)) {
                        System.out.println("Check FName in Register Guests true");
                    } else {
                        out.println("<script type='text/javascript' > alert('First Name Doesn't match our Pattern ^_^ ');history.back();</script>");

                        System.out.println("Check FName in Register Guests User false");
                        out.println("<center><br/><br/><br/><font color='red'>First Name Doesn't match our Pattern(" + pattern2 + ") ^_^ </font><center>");

                        out.println("<center></br><a href='Register.jsp' >Home</a></center>");
                        isEveryThingOKAll = false;

                    }
                }
                if (isEveryThingOKAll) {

                    String pattern = "^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\\\\.[a-zA-Z]{2,4}";
                    String pattern2 = "[A-Za-z]{3,30}$";
                    if (LName.matches(pattern2)) {
                        System.out.println("Check LName in Register Guests true");
                    } else {
                        out.println("<script type='text/javascript' > alert('Last Name Doesn't match our Pattern ^_^ ');history.back();</script>");

                        System.out.println("Check LName in Register Guests User false");
                        out.println("<center><br/><br/><br/><font color='red'>Last Name Doesn't match our Pattern(" + pattern2 + ") ^_^ </font><center>");

                        out.println("<center></br><a href='Register.jsp' >Home</a></center>");
                        isEveryThingOKAll = false;

                    }
                }

                if (isEveryThingOKAll) {
                    if (Type.equals("2")) {
                        UserTypeID = 2;
                    } else if (Type.equals("3")) {
                        UserTypeID = 3;

                    } else {
                        out.println("<script type='text/javascript' > alert('User type is not in our System ^_^ ');history.back();</script>");
                        isEveryThingOKAll = false;

                    }
                }

                if (isEveryThingOKAll) {

                    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
                    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddhhmmss");

                    String RegistrationDate = sdf1.format(new Date());
                    String MyUniversityCodeString = sdf2.format(new Date()) + 1 + Code.trim();
                    //  out.println("MyUniversityCodeString" + MyUniversityCodeString);
                    //  int RegistrationDateCodeInteger =Integer.parseInt(RegistrationDateCodeString.trim());
                    //out.println("RegistrationDateCodeInteger" + RegistrationDateCodeInteger);

                    int rowAffected = 0;
                    try {
                        MyPerson p = new MyPerson();
                        rowAffected = p.RegisterUser(CodeInteger, FName, LName, Mail, Password, UserTypeID, 6, Gender, 1, 4, RegistrationDate, 1, MyUniversityCodeString);
                        if (rowAffected > 0) {
                            // out.println("<script type='text/javascript' > alert('User was Adding successfully ^_^ ');history.back();</script>");
                            response.sendRedirect("index.jsp");

                        } else {
                            out.println("<script type='text/javascript' > alert('User Registration  was  Failed ^_^ ');history.back();</script>");
                        }

                    } catch (Exception ex) {
                        System.err.println("RegisterUser Servlet Error:" + ex.getMessage());
                        out.println("RegisterUser Servlet Error:" + ex.getMessage());
                        out.println("<center><a href='MyAccount.jsp' >Home</a></center>");

                    }
                }//  password matches,code are correct

            }//if fields are not empty
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
