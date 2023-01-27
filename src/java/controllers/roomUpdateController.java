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
import models.roomUpdateModel;

/**
 *
 * @author ManojKasun
 */
@WebServlet(name = "roomUpdateController", urlPatterns = {"/roomUpdateController"})
public class roomUpdateController extends HttpServlet {


 
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int room_id=Integer.parseInt(request.getParameter("id"));
        int  count=Integer.parseInt(request.getParameter("count"));
        
        roomUpdateModel  rm = new roomUpdateModel ();
        try {
            if(rm.updateAvailability(room_id, count)){
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('updated');");
                    out.println("</script>");
                    response.sendRedirect("./admin");
            }
            else{
                 out.println("<script type=\"text/javascript\">");
                    out.println("alert('Something Wrong');");
                    out.println("</script>");
                    response.sendRedirect("./admin");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(roomUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(roomUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
