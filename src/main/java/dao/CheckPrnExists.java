package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CheckPrnExists {
    private static final Logger logger =
            Logger.getLogger(CheckPrnExists.class.getName());

    public static boolean checkPrn(String prn) {

        String query = "SELECT prn FROM room_allotment WHERE prn = ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);

            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return false;
    }

    public static boolean checkPrnByStudentRegister(String prn) {
            String query = "SELECT prn FROM student_register WHERE prn = ?";
            try (Connection connection = ConnectionProvider.getConnection();
                 PreparedStatement pstm = connection.prepareStatement(query)) {
                pstm.setString(1, prn);

                try (ResultSet resultSet = pstm.executeQuery()) {
                    if (resultSet.next()) {
                        return true;
                    }
                }
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Error while opening account", e);
            }
            return false;
    }
}
