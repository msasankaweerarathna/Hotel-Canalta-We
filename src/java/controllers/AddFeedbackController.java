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
import models.FeedbackModel;

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "AddFeedbackController", urlPatterns = {"/AddFeedbackController"})
public class AddFeedbackController extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
      String name = request.getParameter("name");
      String rate = request.getParameter("rate");
      String com = request.getParameter("comm");
      String cId = request.getParameter("c_id");
      
      // System.out.println(com + rate + name);
      FeedbackModel fm = new FeedbackModel();
      fm.setName(name);
      fm.setRate(rate);
      fm.setComment(com);
      fm.setC_id(cId);
        try {
            if(fm.addFeedback()){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Feedback added success..');");
                out.println("</script>");
                response.sendRedirect("./customer/my_feedbacks.jsp");
            }
        
            else{
                 out.println("<script type=\"text/javascript\">");
                out.println("alert('Feedback added Failrd..');");
                out.println("</script>");
                response.sendRedirect("./customer/add_feedback.jsp");
            }} catch (ClassNotFoundException ex) {
            Logger.getLogger(AddFeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddFeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
