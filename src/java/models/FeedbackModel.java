/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ManojKasun
 */
public class FeedbackModel {
    private String name;
    private String rate;
    private String comment;
private String c_id;
    
    DbCon con = new DbCon();
    int state = 0;
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    public FeedbackModel() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }
    
     public boolean addFeedback() throws ClassNotFoundException, SQLException{
  

        
        try {
         
            
            PreparedStatement ps = con.Connection().prepareStatement("insert into feedbacks(name,rate, comment,c_id ) values(?, ?, ?,?)");

	            ps.setString(1,getName());
	            ps.setString(2,getRate() );
	            ps.setString(3, getComment());
                    ps.setString(4, getC_id());
	              
            state = ps.executeUpdate();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return state == 1;
    }
    
}
