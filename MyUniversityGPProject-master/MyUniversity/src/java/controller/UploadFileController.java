package controller;

import Database.MyDatabase;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import models.MyPerson;

//@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class UploadFileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("UserObject") != null) {
            MyPerson p = (MyPerson) session.getAttribute("UserObject");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            InputStream inputStream = null;

            Random rand = new Random();
            int n = rand.nextInt(9999) + 1;
            String idTemp = String.valueOf(n);
            String title = request.getParameter("title");
            String File_Type = request.getParameter("File_Type");
            Part filePart = request.getPart("file_uploaded");

            boolean isEveryThingisOK = true;

            int Subject_Code = 0;
            try {
                Subject_Code = Integer.parseInt(request.getParameter("Subject_Code"));
            } catch (Exception ex) {
                isEveryThingisOK = false;
                out.println("<script type='text/javascript' > alert('Subject code is an integer value please   ^_^ ');history.back();</script>");

                System.out.println("" + ex.getMessage());
            }

            if (isEveryThingisOK) {
                String FileType = filePart.getContentType();
                //out.println("Type:" + filePart.getContentType());
                if (FileType.equals("application/pdf") && File_Type.equals("Pdf")) {
                    isEveryThingisOK = true;

                } else if (FileType.equals("application/pdf") && File_Type.equals("Pdf")) {
                    isEveryThingisOK = true;

                } else if (FileType.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document") && File_Type.equals("Word")) {
                    isEveryThingisOK = true;

                } else if (FileType.equals("application/vnd.ms-powerpoint") && File_Type.equals("PPt")) {
                    isEveryThingisOK = true;

                } else if (FileType.equals("text/plain") && File_Type.equals("Text")) {
                    isEveryThingisOK = true;

                } else if (FileType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") && File_Type.equals("Excel")) {
                    isEveryThingisOK = true;

                } else if (FileType.equals("application/octet-stream") && File_Type.equals("rar/7z")) {
                    isEveryThingisOK = true;

                } else {
                    isEveryThingisOK = false;
                    out.println("<script type='text/javascript' > alert('Please choose from Options(Word,Pdf,PPt,Text,Excel,Compressed file)<  ^_^ ');history.back();</script>");

                }
            }
            if (isEveryThingisOK) {
                if (filePart != null) {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                } else {
                    isEveryThingisOK = false;
                }
                if (title == null || title.isEmpty() || File_Type == null || File_Type.isEmpty()) {
                    out.println("<script type='text/javascript' > alert('Please choose file  ^_^ ');history.back();</script>");
                    isEveryThingisOK = false;
                }
            }
            if (isEveryThingisOK) {
                if (filePart.getSize() > 1048576) {
                  isEveryThingisOK = false;
                    out.println("<script type='text/javascript' > alert('Size must be less than 1048576  ^_^ ');history.back();</script>");

                }
            }
            if (isEveryThingisOK) {

                if (filePart != null) {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();

                    try {
                        Connection connection = null;
                        MyDatabase ViewCourseDatabaseObject = MyDatabase.getInstance();
                        connection = ViewCourseDatabaseObject.connect_to_DB();
                        //out.println(Subject_Code);
                        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
                        String UploadedDate = sdf1.format(new Date());
                        String sql = "INSERT INTO matrerial (ID, Filename, file,Type,SubjectID,UserCode,UploadedDate) values (?, ?, ?,?,?,?,?)";
                        out.println(sql);

                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setString(1, idTemp);
                        statement.setString(2, title);

                        if (inputStream != null) {
                            statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
                        }
                        statement.setString(4, File_Type);
                        int id = 2;
                        statement.setInt(5, Subject_Code);
                        statement.setInt(6, p.getCode());
                        statement.setString(7, UploadedDate);

                        int row = statement.executeUpdate();
                        if (row > 0) {
                            //out.println("File uploaded!!!");
                            //   out.println("<script type='text/javascript' > alert('File uploaded Successfully  ^_^ ');history.back();</script>");
                            response.sendRedirect("MyAccount.jsp?page=upload_form&Subject_Code=" + Subject_Code + "");

                            // conn.close();
                            // RequestDispatcher rs = request.getRequestDispatcher(".jsp");
                            // rs.include(request, response);
                        } else {
                            out.println("<script type='text/javascript' > alert('File not uploaded   ^_^ ');history.back();</script>");
                        }

                    } catch (Exception e) {
                        System.out.println("Error:" + e.getMessage());
                        e.printStackTrace();
                    }
                } else {
                    out.println("<script type='text/javascript' > alert('Please choose file  ^_^ ');history.back();</script>");

                }
            }//if every thing is ok or not
        }//end of if session is exit or not
        else {
            RequestDispatcher RD = request.getRequestDispatcher(response.encodeURL("index.jsp"));
            RD.forward(request, response);
        }
    }

}
