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

public class GetStudentDetails {
    private static final Logger logger =
            Logger.getLogger(GetStudentDetails.class.getName());
    public static List<Student> getRecentFiveStudent() {

        List<Student> studentList = new ArrayList<>();
        String query = "SELECT * FROM students ORDER BY allotment_date DESC LIMIT 5";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query);
             ResultSet resultSet = pstm.executeQuery()) {

            while (resultSet.next()) {
                Student student = new Student();
                student.setName(resultSet.getString("name"));
                student.setRoom_number(resultSet.getString("room_number"));
                student.setAllot_date(resultSet.getString("allotment_date"));
                student.setBranch(resultSet.getString("branch"));
                student.setCourse(resultSet.getString("course"));
                student.setYear(resultSet.getString("year"));
                studentList.add(student);
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return studentList;
    }

    public static Student getStudentDetails(String prn) {
        Student student = new Student();
        String query = "SELECT * FROM students WHERE prn= ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, prn);
            ResultSet resultSet = pstm.executeQuery();
            if (resultSet.next()) {
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

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while opening account", e);
        }
        return student;
    }
//
//    public static void main(String[] args) {
//
//            Student st= getStudentDetails("220205131004");
//            System.out.print(st.getName()+" ");
//            System.out.print(st.getBranch()+" ");
//            System.out.print(st.getRoom_number()+" ");
//            System.out.print(st.getAllot_date()+" ");
//            System.out.print(st.getCourse()+" ");
//            System.out.println(st.getYear());
//        }

}
