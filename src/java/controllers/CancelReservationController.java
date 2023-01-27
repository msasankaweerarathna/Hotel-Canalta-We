/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.EmailModel;
import models.SmsUtilitiesModel;

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "CancelReservationController", urlPatterns = {"/CancelReservationController"})
public class CancelReservationController extends HttpServlet {

    EmailModel em = new EmailModel();
    
    private String host = em.getHost();
    private String port = em.getPort();
    private String sender = em.getSender();
    private String pass = em.getPass();
    String resultMessage = "";
  

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String id = request.getParameter("id");
       String date = request.getParameter("date");
       String subject = "Reservation Canselation Notification";
       HttpSession session1=request.getSession(false);  
       String recipient=(String)session1.getAttribute("c_email"); 
       HttpSession session2=request.getSession(false);  
       String name=(String)session2.getAttribute("c_name");
       
       HttpSession session3=request.getSession(false);  
       String phone=(String)session3.getAttribute("c_phone");
       
        String content = "Hi "+ name+ ",\n\nYour Reservation for    "+ date 
                + " is canceled Successfully... "
                + "\n\nThank you using Canalta hotel."
                ;
        String msgContent= "Hi "+ name+ ",  Your Reservation for   "+ date + " is canceled Successfully. Thank you using Canalta hotel." ;
          // sms thread
         new Thread(new Runnable() {
     @Override
     public void run() { //invoke a thread for email sending
          try {
          
        SmsUtilitiesModel sm = new SmsUtilitiesModel(msgContent, phone);
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
              System.out.println("sms triggered");
        }
        }
    }).start();
        
        
        try (PrintWriter out = response.getWriter()) {
           
            
               Connection con=null;
              PreparedStatement pst=null;
              ResultSet rs=null;
              
              
              
           try{
           
             Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelCanalta","root",""); 
           
   
                  String sql="UPDATE reservations SET status='canceled' where id='"+id+"'";
                   pst=con.prepareStatement(sql);
                    pst.execute();
                   out.println("<script type=\"text/javascript\">");
                    out.println("alert('Successfully canceld..');");
                      try {
         EmailUtility.sendEmail(host, port, sender, pass,  recipient, subject,content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
           System.out.println(host+ port + sender+ pass);
        }
                      out.println("location='./customer/dashboard.jsp';");
                    out.println("</script>");
                   
                 }
        
               
        
           
            
           
           catch (SQLException | ClassNotFoundException ex) {
                 Logger.getLogger(AdminupdatePasswordController.class.getName()).log(Level.SEVERE, null, ex);
             }
            
           
        }
       
       
       
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
