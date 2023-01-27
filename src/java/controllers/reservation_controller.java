/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.EmailModel;
import models.RoomBookingModel;
import models.SmsUtilitiesModel;

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "reservation_controller", urlPatterns = {"/reservation_controller"})
public class reservation_controller extends HttpServlet {

    EmailModel em = new EmailModel();
    
    private String host = em.getHost();
    private String port = em.getPort();
    private String sender = em.getSender();
    private String pass = em.getPass();
    String resultMessage = "";
   
 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String recipient = request.getParameter("c_email");
         String phone = request.getParameter("c_phone");
        String subject = "Canalta Hetel Room Reservation ";
        String c_name = request.getParameter("c_name");
        String tId = request.getParameter("trans_id");
        String amount = request.getParameter("amount");
         String roomcat = request.getParameter("roomcat");
         String roomt = request.getParameter("roomt");
         String roomid = request.getParameter("roomid");
         String checkin = request.getParameter("checkin");
         String days = request.getParameter("days");
        String content = "Hi "+ c_name+ "\n\nYour Reservation is bookd Successfully. \nYour Tranaction Id is: "+ tId
                + "\nTotal Amount is: "+ amount
                + "\nRoom Category is: " + roomcat
                + "\nRoom Type is: " + roomt
                + "\nBooked For: " + checkin
                + "\nDays: "+ days
                + "\nYour Contact: " + phone
                + "\n\nThank you using Canalta hotel."
                ;
 String msgContent = "Hi "+c_name + ", Your reservation is successfully booked. Transaction ID is: "+tId+ " And Booked for "+ checkin+". Thank you.";
        RoomBookingModel rb = new RoomBookingModel();
      
 
     new Thread(new Runnable() {
     @Override
     public void run() { //invoke a thread for email sending
          try {
         EmailUtility.sendEmail(host, port, sender, pass,  recipient, subject,content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
           System.out.println(host+ port + sender+ pass);
        }
        }
    }).start();
        
        new Thread(new Runnable() {
     @Override
     public void run() { 
          try {
              //set sleep time 2.5S
              Thread.sleep(2500);
              if(rb.book(recipient,c_name,phone,tId,amount,roomcat, roomt,roomid, checkin,days ))
        {
          
            
           out.println("<script type=\"text/javascript\">");
                    out.println("alert('Reservation Success..');");
                    out.println("</script>");
                     response.sendRedirect("./customer/dashboard.jsp");
           
        }
                else{
                   out.println("<script type=\"text/javascript\">");
                    out.println("alert('Reservation Success..');");
                    out.println("</script>");
                    response.sendRedirect("./customer/dashboard.jsp");
              }
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
           
        }
        }
    }).start(); 
         //sms thread
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
              response.sendRedirect("./customer/dashboard.jsp");
 
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
