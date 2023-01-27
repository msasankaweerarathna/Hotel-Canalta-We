/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ManojKasun
 */
public class customerLoginModel {
    
    
    public boolean customerLogin(String email, String pass) throws IOException, ClassNotFoundException, SQLException{
HttpServletResponse response = null;
HttpServletRequest request= null;
    PrintWriter out = response.getWriter();
    DbCon con = new DbCon();
    int state = 0;

              PreparedStatement pst=null;
              ResultSet rs=null;
              
              
           try{

             String sql="SELECT * FROM users WHERE email='"+email+"'";
         
               pst=con.Connection().prepareStatement(sql);
                rs = pst.executeQuery();
                
                 while(rs.next()){
                    
                
                if(rs.getString("password").equals(pass)){
                    
                    if("password".equals(pass)){
                    
                    Cookie c1=new Cookie("customerEmail",email);
                    Cookie c2=new Cookie("customerPass",pass);
                    
                    
                    
                    response.addCookie(c1);
                    response.addCookie(c2);
                    }
                    
                     HttpSession session1=request.getSession(true);  
                     session1.setAttribute("name",rs.getString("name"));  
                     
                     
                     HttpSession session2=request.getSession(true);  
                     session2.setAttribute("customer_phone",rs.getString("phone"));  
                     
                    HttpSession session3=request.getSession(true);  
                     session3.setAttribute("country",rs.getString("country")); 
                      HttpSession session4=request.getSession(true);  
                     session4.setAttribute("nic",rs.getString("nic")); 
                    String type = rs.getString(4);
                    
                   
                     return true;
                       
     
                  
                }
                 
           
                 else   {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your Password or Email were wrong!! Recheck And try Again ..')");
                    out.println("location='./customer/login.jsp';");
                    out.println("</script>");
                     
               
                
                
                 }
              
           }
           }
           catch(Exception e){
               out.println(e);
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Auth Failed try Again ..')");
                    out.println("location='./customer/login.jsp';");
                    out.println("</script>");
           }
        return false;
            

    }
    }
    

