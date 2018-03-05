/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ModelOfFaculityAdmin;
import models.MyPerson;
import org.hibernate.validator.internal.constraintvalidators.EmailValidator;

/**
 *
 * @author Mohamed
 */
public class EditUserProfile extends HttpServlet {

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
            HttpSession session = request.getSession();
            if (session.getAttribute("UserObject") != null) {
                MyPerson p = (MyPerson) session.getAttribute("UserObject");
                String FName = request.getParameter("FName"),
                        MName = request.getParameter("MName"),
                        LName = request.getParameter("LName"),
                        Password = request.getParameter("Password"),
                        ConfirmPassword = request.getParameter("ConfirmPassword"),
                        Mail = request.getParameter("Mail"),
                        MyUniversityCodeString = request.getParameter("MyUniversityCodeString"),
                        Address = request.getParameter("Address"),
                        BDate = request.getParameter("BDate"),
                        Department = request.getParameter("Department"),
                        Code = request.getParameter("Code"),
                        Level = request.getParameter("Level");
                int LevelID = 0, DepartmentID = 0, CodeInteger = 0;
                boolean isEveryThingOKAll = true;
                if (FName == null || FName.isEmpty()
                        || MName == null || MName.isEmpty()
                        || LName == null || LName.isEmpty()
                        || Password == null || Password.isEmpty()
                        || ConfirmPassword == null || ConfirmPassword.isEmpty()
                        || Mail == null || Mail.isEmpty()
                        || MyUniversityCodeString == null || MyUniversityCodeString.isEmpty()
                        || Department == null || Department.isEmpty()
                        || Level == null || Level.isEmpty()
                        || Code == null || Code.isEmpty()) {
                    out.println("<script type='text/javascript' > alert('Please Fill all fields ^_^  ');history.back();</script>");
                    /* out.println("<br/>Fname=" + FName);
                     out.println("<br/>Mname=" + MName);

                     out.println("<br/>Lname=" + LName);

                     out.println("<br/>Mail=" + Mail);

                     out.println("<br/>Password=" + Password);
                     out.println("<br/>Address=" + Address);

                     out.println("<br/>BDate=" + BDate);
                     out.println("<br/>MyUniversityCodeString=" + MyUniversityCodeString);
                     out.println("<br/>Code=" + Code);
                     out.println("<br/>Department=" + Department);
                     out.println("<br/>Level=" + Level);
                     */
                    isEveryThingOKAll = false;
                }
                if (isEveryThingOKAll) {
                    if (!Password.equals(ConfirmPassword)) {
                        out.println("<br/>");
                        out.println("<br/>");
                        out.println("<br/>");
                        out.println("<br/>");
                        out.println("<br/>");
                        out.println("<br/>");

                        out.println("<center>");
                        out.println("<font color='red' >Password doesn't match ^_^</font>");
                        out.println("<a href='MyAccount.jsp?page=ViewUserProfile&code=" + Code + " ' >Back ^_^ </a>");

                        out.println("</center>");

                        out.println("<script type='text/javascript' > alert('Password doesn't match ^_^  ');history.back();</script>");
                        isEveryThingOKAll = false;

                    }
                }
                if (isEveryThingOKAll) {
                    try {
                        LevelID = Integer.parseInt(request.getParameter("Level"));

                        DepartmentID = Integer.parseInt(request.getParameter("Department"));
                        CodeInteger = Integer.parseInt(request.getParameter("Code"));

                    } catch (Exception ex) {
                        out.println("<script type='text/javascript' > alert(' Level,Department and Code is an integer please ^_^');history.back();</script>");
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
                        out.println("Password Length must be greater than 5 letters please   ^_^");
                        out.println("<br/><a href='MyAccount.jsp' >Home </a>");
                        isEveryThingOKAll = false;

                    }
                }
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
                    out.println("<br/>Fname=" + FName);
                    out.println("<br/>Mname=" + MName);

                    out.println("<br/>Lname=" + LName);

                    out.println("<br/>Mail=" + Mail);

                    out.println("<br/>Password=" + Password);
                    out.println("<br/>Address=" + Address);

                    out.println("<br/>BDate=" + BDate);
                    out.println("<br/>MyUniversityCodeString=" + MyUniversityCodeString);
                    out.println("<br/>Code=" + Code);
                    out.println("<br/>Department=" + Department);
                    out.println("<br/>Password=" + Password);
                    int rowAffected;
                    try {
                        ModelOfFaculityAdmin modelOfFacultyAdmin = new ModelOfFaculityAdmin();

                        rowAffected = modelOfFacultyAdmin.EditMyUserProfile(CodeInteger, FName, MName, LName, Mail, Password, Address, BDate, MyUniversityCodeString, LevelID, DepartmentID);
                        if (rowAffected > 0) {

                            response.sendRedirect("MyAccount.jsp?page=ViewUserProfile&code=" + CodeInteger);
                            //               out.println("<script type='text/javascript' > alert('Editting Profile Done Successfull ^_^ ');history.back();</script>");

                        } else {
                            out.println("<script type='text/javascript' > alert('Editting User Profile is Failed ^_^ ');history.back();</script>");
                        }

                    } catch (Exception ex) {
                        System.err.println("Editting User Servlet Error:" + ex.getMessage());
                        out.println("<script type='text/javascript' > alert('Editting Profile Servlet Error:'" + ex.getMessage() + " ');history.back();</script>");

                        out.println("Editting User Profile Servlet Error:" + ex.getMessage());

                        out.println("<center><a href='MyAccount.jsp' >Home</a></center>");

                    }
                }

            }//end of if session is exit or not
            else {
                RequestDispatcher RD = request.getRequestDispatcher(response.encodeURL("index.jsp"));
                RD.forward(request, response);
            }
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
