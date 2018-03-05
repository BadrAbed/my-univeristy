/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MyPerson;

/**
 *
 * @author Mohamed
 */
public class UploadMaterial extends HttpServlet {

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
                out.println("<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>");
                out.println("<center>");

                MyPerson p = (MyPerson) session.getAttribute("UserObject");
                boolean isEveryThingisOK = true;
                if (p.getUserType() != 6) {
                    File f = null;
                    try {
                        String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
                        MultipartRequest m = new MultipartRequest(request, webRootPath);//"D:/"
                        //out.println("<font color='blue'>successfully uploaded" + "</font><br/>");
                        String Description = m.getParameter("Description");
                        String SubjectCodeString = m.getParameter("Subject_Code");
                        f = m.getFile("fname");
                        String name = "";
                        String type = "";
                        if (SubjectCodeString == null || SubjectCodeString.isEmpty()
                                || Description == null || Description.isEmpty()
                                ) {
                            isEveryThingisOK = false;
                            out.println("<script type='text/javascript' > alert('Please fill all fields ^_^ ');history.back();</script>");

                        }
                        int Subject_Code = 0;
                        try {
                            Subject_Code = Integer.parseInt(SubjectCodeString);
                        } catch (Exception ex) {
                            isEveryThingisOK = false;
                            out.println("<script type='text/javascript' > alert('Subject code is an integer value please   ^_^ ');history.back();</script>");

                            System.out.println("" + ex.getMessage());
                        }
                        if (isEveryThingisOK) {
                            name = f.getName().substring(0, f.getName().lastIndexOf("."));
                            type = f.getName().substring(f.getName().lastIndexOf(".") + 1);
                        }
                        if (name.length() > 50) {
                            isEveryThingisOK = false;
                            out.println("<script type='text/javascript' > alert('Name Size must be less than 50 character please  ^_^ ');history.back();</script>");

                        }
                        if (isEveryThingisOK) {
                            try {
                                Random rand = new Random();
                                int n = rand.nextInt(9999) + 1;
                                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
                                String UploadedDate = sdf1.format(new Date());
                                int rowAffected = p.UploadFileMethod(n, name, type, Subject_Code, p.getCode(), UploadedDate,Description);
                                if (rowAffected > 0) {
                            response.sendRedirect("MyAccount.jsp?page=CourseMaterials&Subject_Code=" + Subject_Code + "");

                                } else {
                                    out.println("<script type='text/javascript' > alert('File Uploading was  Failed(File name must be unique value) ^_^ ');history.back();</script>");
                                }

                            } catch (Exception ex) {
                                System.err.println("UploadFile Servlet Error:" + ex.getMessage());
                                out.println("UploadFile Servlet Error:" + ex.getMessage());
                                out.println("<center><a href='MyAccount.jsp' >Home</a></center>");

                            }
                        }
                        /* if (f.length() < 1048576) {
                         //this.DownloadTranscript(response, p);
                         out.println("<br/>name:" + name);
                         out.println("<br/>Type:" + type);
                        
                         out.println("<br/>SubjectCodeString:" + SubjectCodeString);
                         out.println("<br/>Description:" + Description);
                        
                         }//end of  iflength of file <1048576 or not 
                         else {
                        
                         out.println("<script type='text/javascript' > alert('file length must be less than 1048576 bytes  please ^_^ ');history.back();</script>");
                         }*/

                    } catch (Exception ex) {
                        System.out.println("uploading Material Error:" + ex.getMessage());
                        out.println("<script type='text/javascript' > alert('uploading Material Error:" + ex.getMessage() + " ');history.back();</script>");

                    } finally {
                        /*try {
                         if (f.exists()) {
                         f.delete();
                         }

                         } catch (Exception ex) {
                         out.println("Error:" + ex.getMessage());
                         }*/
                    }
                }//end of is this user is not Student 
                else {
                    out.println("<br/><br/><br/><br/><br/>");
                    out.println("<center><font color='blue'><h1>You shouldn't be here ^_^ </h1></font></center>");
                    out.println("<center><a href='MyAccount.jsp' >Home</a></center>");

                }
                out.println("</center>");

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
