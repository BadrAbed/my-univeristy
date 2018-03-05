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
public class DownloadMaterial extends HttpServlet {

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

                out.println("<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>" + "<br/>");
                out.println("<center>");
                MyPerson p = new MyPerson();
                String name = request.getParameter("name");
                String type = request.getParameter("type");
                String SubjectCodeString = request.getParameter("Subject_Code");
                File file = null;

                boolean isEveryThingisOK = true;

                if (name == null || name.isEmpty()
                        || type == null || type.isEmpty()
                        || SubjectCodeString == null || SubjectCodeString.isEmpty()) {
                    isEveryThingisOK = false;
                    //out.println("<script type='text/javascript' > alert('Please fill all fields ^_^ ');history.back();</script>");
                    out.println("<br/>type:" + type);
                    out.println("<br/>SCode:" + SubjectCodeString);
                                        out.println("<br/>name:" + name);

                }
                /*  int Subject_Code = 0;
                 try {
                 Subject_Code = Integer.parseInt(SubjectCodeString);
                 } catch (Exception ex) {
                 isEveryThingisOK = false;
                 out.println("<script type='text/javascript' > alert('Subject code is an integer value please   ^_^ ');history.back();</script>");

                 System.out.println("Subject_Code:" + ex.getMessage());
                 }
                 */
                if (isEveryThingisOK) {
                    try {

                        //response.setContentType("application/pdf");
                        //set the header and also the Name by which user will be prompted to save
                        response.setHeader("Content-Disposition", "attachment;filename=" + name + "." + type);
                        String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');

                        file = new File(webRootPath + name + "." + type);//"D:\\"
                        FileInputStream fileIn = new FileInputStream(file);
                        ServletOutputStream out2 = response.getOutputStream();

                        byte[] outputByte = new byte[4096];
//copy binary contect to output stream
                        while (fileIn.read(outputByte, 0, 4096) != -1) {
                            out2.write(outputByte, 0, 4096);
                        }
                        fileIn.close();
                        out2.flush();
                        out2.close();
                        System.out.println("<script type='text/javascript' > alert('Successfull Downloading File ^_^ ');history.back();</script>");

                    } catch (Exception ex) {
                        out.println("<script type='text/javascript' > alert('Failed Downloading File ^_^ Error:" + ex.getMessage() + "  ');history.back();</script>");

                    } finally {
                        /*try {
                         if (file.exists()) {
                         file.delete();
                         }

                         } catch (Exception ex) {
                         out.println("Error:" + ex.getMessage());
                         }
                         */
                    }
                }//end of is everything is ok

           
        }//end of try Print Writer

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
