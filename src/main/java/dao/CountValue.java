package dao;

import helper.ConnectionProvider;
import model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CountValue {

    private static final Logger logger =
            Logger.getLogger(CountValue.class.getName());

    //    Count Allotment Room
    public static int countAllotRoom() {
        int count = 0;
        String query = "SELECT count(room_number) FROM room_allotment";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {

            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    count = resultSet.getInt(1);
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return count;
    }

    // count Room Name and Space available in room each room
    public static Map<String, Integer> countRoomSpace() {
        int count = 0;
        Map<String, Integer> roomMap = new HashMap<>();
        String query = "SELECT room_number, count(room_number) FROM room_allotment group by room_number";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query);
             ResultSet resultSet = pstm.executeQuery()) {

            while (resultSet.next()) {
                String roomNumber = resultSet.getString(1);
                count = resultSet.getInt(2);
                roomMap.put(roomNumber, count);
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while Count Room Number with Room Space", e);
        }
        return roomMap;
    }

    //    return the room name which is empty
    public static List<String> getEmptyRoom() {
        List<String> emptyRoom = new ArrayList<>();
        Map<String, Integer> mapRoom = countRoomSpace();
        List<String> roomNameList = getRoomNumber.getStudentRoomName();

        for (String roomName : roomNameList) {
            int count = mapRoom.getOrDefault(roomName, 0);
            if (roomName.equals("R-412") && count == 8) {
                emptyRoom.add("R-412 Room is Full");
            }
            if (count != 8) {
                emptyRoom.add(roomName);
            }
        }
        return emptyRoom;
    }

    // count room space be room name
    public static boolean checkIfRoomIsFull(String room_number) {
        int count = 0;
        String query = "SELECT count(*) FROM room_allotment WHERE room_number= ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, room_number);
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            if (count == 8) {
                return true;
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return false;
    }

//    Get percentage value for room space
    public static int getPercentageValue() {
        int val= countAllotRoom();
        return (int) ((val*100)/200.0);
    }

//    count room space by room number
    public static String countRoomSpace(String roomNumber) {
        String msg= null;
        String query = "SELECT count(*) FROM room_allotment where room_number= ? GROUP BY room_number;";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {

            pstm.setString(1, roomNumber);
            try(ResultSet resultSet= pstm.executeQuery()){
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    if(count==8){
                        msg= "Available Space : No Space";
                    }
                    else{
                        msg= "Available Space : "+(8-count);
                    }
                }
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while Count Room Number with Room Space", e);
        }

        return msg;
    }

//    public static void main(String[] args) {
//        System.out.println(countRoomSpace("R-412"));
//
//
//    }

}
