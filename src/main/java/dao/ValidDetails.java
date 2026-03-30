package dao;

import helper.ConnectionProvider;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ValidDetails {

    private static final Logger logger =
            Logger.getLogger(ValidDetails.class.getName());

    public static boolean ByStudentDetails(String prn, String mobile, String email) {
        String query = "SELECT prn FROM students WHERE prn = ? AND email= ? AND phone= ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);
            pstm.setString(2, email);
            pstm.setString(3, mobile);

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

    public static List<Student> ByStudentRegisterDetails(String prn, String password) {
        List<Student> studentList = null;
        String query = "SELECT prn FROM student_register WHERE prn = ? AND password= ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);
            pstm.setString(2, password);

            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    String query2 = "SELECT * FROM students WHERE room_number = (SELECT room_number FROM students WHERE PRN= ?)";
                    PreparedStatement pstm2 = connection.prepareStatement(query2);
                    pstm2.setString(1, prn);
                    ResultSet resultSet2 = pstm2.executeQuery();
                    studentList= new ArrayList<>();
                    while (resultSet2.next()) {
                        Student student = new Student();
                        if(!resultSet2.getString("prn").equals(prn)){
                            student.setName(resultSet2.getString("name"));
                            student.setPrn(resultSet2.getString("prn"));
                            student.setEmail(resultSet2.getString("email"));
                            student.setPhone(resultSet2.getString("phone"));
                            student.setCourse(resultSet2.getString("course"));
                            student.setBranch(resultSet2.getString("branch"));
                            student.setYear(resultSet2.getString("year"));
                            student.setRoom_number(resultSet2.getString("room_number"));
                            student.setAllot_date(resultSet2.getString("allotment_date"));
                            studentList.add(student);
                        }
                    }
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return studentList;
    }

    public static String getPassByPrn(String prn, String mobile, String email) {
        String query = "SELECT prn FROM students WHERE prn = ? AND email= ? AND phone= ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);
            pstm.setString(2, email);
            pstm.setString(3, mobile);

            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    String query2 = "SELECT password FROM student_register WHERE prn = ?";
                    PreparedStatement pstm2 = connection.prepareStatement(query2);
                    pstm2.setString(1, prn);
                    ResultSet resultSet2 = pstm2.executeQuery();
                    if(resultSet2.next()){
                        return resultSet2.getString("password");
                    }
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return null;
    }

    public static Student studentDetailsByPrn(String prn) {
        Student student = null;
        String query = "SELECT * FROM students WHERE prn = ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);
            try (ResultSet resultSet = pstm.executeQuery()) {
                if (resultSet.next()) {
                    student= new Student();
                    student.setName(resultSet.getString("name"));
                    student.setPrn(resultSet.getString("prn"));
                    student.setEmail(resultSet.getString("email"));
                    student.setPhone(resultSet.getString("phone"));
                    student.setCourse(resultSet.getString("course"));
                    student.setBranch(resultSet.getString("branch"));
                    student.setYear(resultSet.getString("year"));
                    student.setRoom_number(resultSet.getString("room_number"));
                    student.setAllot_date(resultSet.getString("allotment_date"));
                }
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while fetching Details", e);
        }
        return student;
    }
}
