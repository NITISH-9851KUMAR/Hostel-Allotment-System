package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class getRoomNumber {

    private static final Logger logger =
            Logger.getLogger(WardenLoginDao.class.getName());

    public static List<String> getStudentRoomName() {
        List<String> roomNumberList= new ArrayList<>();
        String query = "select room_number from rooms";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    String rN = resultSet.getString("room_number");
                    roomNumberList.add(rN);
                    while (resultSet.next()) {
                        rN = resultSet.getString("room_number");
                        roomNumberList.add(rN);
                    }
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return roomNumberList;
    }

}
