package dao;

import helper.ConnectionProvider;
import model.Warden;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class WardenLoginDao {
    private static final Logger logger =
            Logger.getLogger(WardenLoginDao.class.getName());

    public static Warden authenticateWardenLogin(Long id, String password) {
        Warden warden= null;
        String query = "SELECT * FROM warden_details WHERE id = ? AND password = ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setLong(1, id);
            pstm.setString(2, password);

            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    warden= new Warden(id, password, resultSet.getString("name"));
                    return warden;
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while Fetching Details", e);
        }
        return warden;
    }

    public static void main(String[] args) {
        Warden w= authenticateWardenLogin(983577L, "nitish");
        System.out.println(w.getName());
    }

}
