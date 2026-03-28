package dao;

import helper.ConnectionProvider;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AllotStudentDetails {
    private static final Logger logger =
            Logger.getLogger(AllotStudentDetails.class.getName());

    public static boolean allotStudent(Student student) {
        String query = "INSERT INTO students(name, prn, email, phone, course, branch, year, room_number, allotment_date) VALUES(?,?,?,?,?,?,?,?,?)";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
                pstm.setString(1, student.getName());
                pstm.setString(2, student.getPrn());
                pstm.setString(3, student.getEmail());
                pstm.setString(4, student.getPhone());
                pstm.setString(5, student.getCourse());
                pstm.setString(6, student.getBranch());
                pstm.setString(7, student.getYear());
                pstm.setString(8, student.getRoom_number());
                pstm.setString(9, student.getAllot_date());

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
