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

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "AdminupdatePasswordController", urlPatterns = {"/AdminupdatePasswordController"})
public class AdminupdatePasswordController extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 try (PrintWriter out = response.getWriter()) {
           
            
               Connection con=null;
              PreparedStatement pst=null;
              ResultSet rs=null;
              
              
              
           try{
           
             Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelCanalta","root",""); 
           
            
            HttpSession session1=request.getSession(false);  
            String id=(String)session1.getAttribute("a_id"); 
            String newPass = request.getParameter("pass1"); 
            String newPass1 = request.getParameter("pass2"); 
           
    
           
             if(newPass.equals(newPass1))
            {
                 
                  String sql="UPDATE admin SET password='"+newPass+"' where id='"+id+"'";
                   pst=con.prepareStatement(sql);
                    pst.execute();
                   out.println("<script type=\"text/javascript\">");
                    out.println("alert('Password Changed!! Login With Your New Password..');");
                      out.println("location='./AdminLogout';");
                    out.println("</script>");
                   
                 }
                else
                
            {
             out.println("<script type=\"text/javascript\">");
                    out.println("alert('Passwords Didnt Match!!!');");
                    out.println("location='./AdminLogout';");
                    out.println("</script>");
            }
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
