package dao;

import helper.ConnectionProvider;
import model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AllotRoom {

    private static final Logger logger =
            Logger.getLogger(AllotRoom.class.getName());

    public static boolean allotRoom(Room room) {
        String query = "INSERT INTO room_allotment(prn, room_number, allotment_date) VALUES(?,?,?)";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, room.getPrn());
            pstm.setString(2, room.getRoom_number());
            pstm.setString(3, room.getAllot_date());

            int rowAffected= pstm.executeUpdate();
            if(rowAffected>0){
                return true;
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return false;
    }

}
