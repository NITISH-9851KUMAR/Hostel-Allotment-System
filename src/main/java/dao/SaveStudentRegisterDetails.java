package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaveStudentRegisterDetails {
    private static final Logger logger =
            Logger.getLogger(SaveStudentRegisterDetails.class.getName());

    public static boolean saveDetails(String prn, String password){
        String query = "INSERT INTO student_register(prn, password) VALUES(?,?)";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);
            pstm.setString(2, password);

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
