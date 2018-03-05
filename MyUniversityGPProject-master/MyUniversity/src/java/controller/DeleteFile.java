/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MyPerson;

/**
 *
 * @author Mohamed
 */
public class DeleteFile extends HttpServlet {

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
