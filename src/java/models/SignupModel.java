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
public class SignupModel extends DbCon {
     
    
      DbCon con = new DbCon();
    int state = 0;
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
      
     public boolean signUp(String email,String name, String nic, String  phone, String country, String pass) throws ClassNotFoundException, SQLException{
  

        
        try {
          //  System.out.println("Name: "+name +"\nEmail: "+ email +"\nNIC:"+ nic + "\nPHONE:"+ phone +"\nCountry:"+ country + "\nPassword:"+ pass);
            
            PreparedStatement ps = con.Connection().prepareStatement("insert into customers(name,email,nic,phone,country,password ) values(?, ?, ?, ?,?,?)");

	            ps.setString(1, name);
	            ps.setString(2, email);
	            ps.setString(3, nic);
	            ps.setString (4, phone);
                    ps.setString(5, country);
                    ps.setString(6, pass);
	              
            state = ps.executeUpdate();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return state == 1;
    }
     
}
