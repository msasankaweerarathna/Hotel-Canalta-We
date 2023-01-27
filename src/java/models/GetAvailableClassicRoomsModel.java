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
public class GetAvailableClassicRoomsModel {
    DbCon db = new DbCon();
     PreparedStatement ps = null;
      Statement st = null;
      ResultSet rs = null;
      public boolean isAvalable;
      private int count;

    public GetAvailableClassicRoomsModel() {
       try {
         
         String query = "select * from rooms where type LIKE 'Classic Room'";
         st = db.Connection().createStatement();
         rs = st.executeQuery(query);
         while (rs.next()) {
             count = rs.getInt(5);
             if(rs.getInt(5) <1)
             {
                 isAvalable = false;
             }else{
                 isAvalable = true;
             }
           
            System.out.println("Rooms=" + rs.getString(5));
         }
      }
      catch (Exception e) {
         e.printStackTrace();
      }
     
    }
    
    public boolean roomBook() throws ClassNotFoundException, SQLException{
        PreparedStatement pst=null;
        int state;
        count = count-1;
         try{
              String sql="UPDATE rooms SET count='"+count+"' where type LIKE 'Classic Room'";
               pst=db.Connection().prepareStatement(sql);
                 state =   pst.executeUpdate();
         }
        
       catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Room count triggered");
        return true;
    }
    
    
}
