/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ClientModel;
import models.SignupModel;

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "CustomerSignupController", urlPatterns = {"/CustomerSignupController"})
public class CustomerSignupController extends HttpServlet {

    private String c_name;
    private String c_email;
    private String nic;
    private String phone_n;
    private String country;
    private String password;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        c_name = request.getParameter("name");
        c_email = request.getParameter("email");
        nic = request.getParameter("nic");
        phone_n = "+94"+request.getParameter("phone");
        country = request.getParameter("country");
        password = request.getParameter("pass");
        
        
        ClientModel cm = new ClientModel();
        cm.setC_email(c_email);
        cm.setC_name(c_name);
        cm.setNic(nic);
        cm.setPhone_n(phone_n);
        cm.setCountry(country);
        cm.setPassword(password);
        
        SignupModel sm = new SignupModel();
        try {
            if(sm.signUp(c_email, c_name, nic, phone_n, country, password)){
                 out.println("<script type=\"text/javascript\">");
                    out.println("alert('Account Creation Success!!! Pleace login using your Email and password..');");
                    out.println("</script>");
                    response.sendRedirect("./customer/login.jsp");
            }else{
                   out.println("<script type=\"text/javascript\">");
                    out.println("alert('Registration Faild ... Please try again!...');");
                    out.println("</script>");
                    response.sendRedirect("./customer/signup.jsp");
            }
                    
                    } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CustomerSignupController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
