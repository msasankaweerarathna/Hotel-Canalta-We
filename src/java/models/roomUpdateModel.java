/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ManojKasun
 */
public class roomUpdateModel {
    int state = 0;
    
    public boolean updateAvailability(int id, int count) throws ClassNotFoundException, SQLException{
        DbCon con = new DbCon();
         PreparedStatement pst=null;
         try{
              String sql="UPDATE rooms SET count='"+count+"' where id='"+id+"'";
           pst=con.Connection().prepareStatement(sql);
                 state =   pst.executeUpdate();
         }
        
       catch (Exception e) {
            e.printStackTrace();
        }
        
        return state == 1;
    }
}
