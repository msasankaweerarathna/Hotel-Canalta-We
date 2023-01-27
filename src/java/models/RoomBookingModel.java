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
public class RoomBookingModel {

    DbCon con = new DbCon();
    int state = 0;
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    public boolean book(String email, String name, String phone, String tid, String amount, String roomcat, String roomt, String roomid, String checkin, String days) throws ClassNotFoundException, SQLException {

        try {

            PreparedStatement ps = con.Connection().prepareStatement("insert into reservations(room_cat,room_type,price,customer,check_in, days,email, contact, t_id) values(?, ?, ?, ?,?,?,?,?,?)");

            ps.setString(1, roomcat);
            ps.setString(2, roomt);
            ps.setString(3, amount);
            ps.setString(4, name);
            ps.setString(5, checkin);
            ps.setString(6, days);
            ps.setString(7, email);
            ps.setString(8, phone);
            ps.setString(9, tid);
            state = ps.executeUpdate();

            if ("Classic Room".equals(roomt)) {
                GetAvailableClassicRoomsModel room = new GetAvailableClassicRoomsModel();
                room.roomBook();
            }
            if ("Grand Deluxe Room".equals(roomt)) {
                GetAvailableGDRModel room = new GetAvailableGDRModel();
                room.roomBook();
            }
            if ("Ultra Superior Room".equals(roomt)) {
                GetAvailableUSRModel room = new GetAvailableUSRModel();
                room.roomBook();
            }
            if ("Couple Room".equals(roomt)) {
                GetAvailableCoupleRoomsModel room = new GetAvailableCoupleRoomsModel();
                room.roomBook();
            }
            if ("Family Room".equals(roomt)) {
                GetAvailableFRModel room = new GetAvailableFRModel();
                room.roomBook();
            }
            if ("Grand Deluxe Conference Hall".equals(roomt)) {
                GetAvailableConGDCRModel room = new GetAvailableConGDCRModel();
                room.roomBook();
            }
            if ("Ultra Superior Conference Hall".equals(roomt)) {
                GetAvailableConUSCModel room = new GetAvailableConUSCModel();
                room.roomBook();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return state == 1;
    }
}
