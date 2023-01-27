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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ClientModel;
import models.DbCon;
import models.customerLoginModel;

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "customerLoginController", urlPatterns = {"/customerLoginController"})
public class customerLoginController extends HttpServlet {

    private String email;
    private String pass;
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
             Connection con=null;
              PreparedStatement pst=null;
              ResultSet rs=null;
              
              
           try{
           
             Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelcanalta","root",""); 
           
            String email=request.getParameter("email");
            String password=request.getParameter("pass");
            
            
             String sql="SELECT * FROM customers WHERE email='"+email+"'";
         
               pst=con.prepareStatement(sql);
                rs = pst.executeQuery();
                
                 while(rs.next()){
                    
                
                if(rs.getString("password").equals(password)){
                    
                    if("password".equals(password)){
                    
                    Cookie c1=new Cookie("email",email);
                    Cookie c2=new Cookie("pass",password);
                    
                    
                    
                    response.addCookie(c1);
                    response.addCookie(c2);
                    }
                    
                     HttpSession session1=request.getSession(true);  
                     session1.setAttribute("c_id",rs.getString(1));  
                     
                     
                     HttpSession session2=request.getSession(true);  
                     session2.setAttribute("c_name",rs.getString(2));  
                       HttpSession session3=request.getSession(true);  
                     session3.setAttribute("c_phone",rs.getString(5)); 
                    
                      HttpSession session4=request.getSession(true);  
                     session4.setAttribute("c_email",rs.getString(3)); 
                     
                    String name = rs.getString(2);
                  
                 //   response.sendRedirect("../customer/dashboard.jsp");
                    if(name!= null){
                       out.println("<script type=\"text/javascript\">");
                    out.println("alert('Logging Success');");
                    out.println("</script>");
                    response.sendRedirect("./customer/dashboard.jsp");
                       
                                }
                  
                   
                }
                 
           
                 else   {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your Password or Email were wrong!! Recheck And try Again ..')");
                    out.println("location='./customer/login.jsp';");
                    out.println("</script>");
                     
               
                
                
                 }
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Auth Failed try Again ..')");
                    out.println("location='./customer/login.jsp';");
                    out.println("</script>");
                 }
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Auth Failed try Again ..')");
                    out.println("location='./customer/login.jsp';");
                    out.println("</script>"); 
           }
           catch(Exception e){
               out.println(e);
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Auth Failed try Again ..')");
                    out.println("location='./customer/login.jsp';");
                    out.println("</script>");
           }
            
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
