/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mohamed
 */
public class MyDatabase {

    public static String message;
    private Connection connection;

    private static MyDatabase myDatabaseObject;
    public static int count = 0;

    public static synchronized MyDatabase getInstance() {

        if (myDatabaseObject == null) {
            myDatabaseObject = new MyDatabase();
        }

        return myDatabaseObject;

    }

    private MyDatabase() {
        // if (connection == null) {
        try {
            String classForName = "com.mysql.jdbc.Driver";
            message = "";
            //Connect to Driver
            Class.forName(classForName);//org.apache.derby.jdbc.ClientDriver"
            System.out.println("Connection Driver true");
            message += "Connection Driver true</br>";
        } catch (ClassNotFoundException ex) {
            System.out.println("ClassNotFoundException");
            //  JOptionPane.showMessageDialog(null, "ClassNotFoundException");
            System.err.println(ex.getMessage());
            message += "ClassNotFoundException:</br>" + ex.getMessage() + "</br>";

        }
        try {
            String url2 = "jdbc:mysql://mysql3934-meineuni2.techequity.cloud/myunidb"; //"jdbc:mysql://localhost:3306/meineuni1";
            String url = "jdbc:mysql://localhost:3306/web_shop_jsp";
            String url3 = "jdbc:mysql://mysql3932-meineuni1.techequity.cloud/myunidb";
            String user = "root";//"eb2a_18019930";
            String password = ""; //"01112858168";//"";
            String user2 = "meineuni1";//"eb2a_18019930";
            String password2 = "DAIgtf11839";//for Jalastic.com//"0100Mo_Ga@9454";for eatj.com  //"01112858168"; for ebqa.com//"";
            String password3 = "Ntxdd8qUee";//for Jalastic.com//"0100Mo_Ga@9454";for eatj.com  //"01112858168"; for ebqa.com//"";

            //Connect to DB
            // String driverManager = "jdbc:mysql://localhost:3306/web_shop_jsp?user=root";
            connection = DriverManager.getConnection(url, user, password);
            //   JOptionPane.showMessageDialog(null, "true connection");
            System.out.println("Connection DB True");
            message += "Connection DB True</br>";

        } catch (SQLException ex) {
            System.out.println("SQLException:Connection Failuer" + ex.getMessage());
            System.err.println(ex.getMessage());
            message += "SQLException:Connection Failuer:</br>" + ex.getMessage() + "</br>";

            //JOptionPane.showMessageDialog(null, "SQLException:Connection Failuer");
        }
        // }//end of if connection =null
        this.count++;
    }

    public Connection connect_to_DB() {

        return connection;
    }//end of function connect_to_DB

}//end of class

