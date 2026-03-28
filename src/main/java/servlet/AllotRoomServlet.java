package servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Room;
import model.Student;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/allot-room-servlet")
@MultipartConfig
public class AllotRoomServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String student_name = request.getParameter("studentName").trim();
        String student_prn = request.getParameter("prnNumber").trim();
        String student_email = request.getParameter("email").trim();
        String student_phone= request.getParameter("phone").trim();
        String student_course = request.getParameter("course").trim();
        String student_branch = request.getParameter("branch").trim();
        String current_year = request.getParameter("year").trim();
        String room_number= request.getParameter("room_number").trim();
        String current_date= fun.CurrentDate.currentDate();

//        Check if room is full then, choose another room
        boolean roomCheck= dao.CountValue.checkIfRoomIsFull(room_number);
        if(roomCheck){
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("Room is Full, Select Another Room");
            return;
        }

//        check if prn is already exists , if exists means student has already allotment his room
        boolean flagPrnExists= dao.CheckPrnExists.checkPrn(student_prn);
//        flagPrnExists is true means prn exists
        if(flagPrnExists){
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("PRN Already Exists");
            return;
        }

//        Save details in student table
        Student student= new Student(student_name, student_prn, student_email, student_phone,
                student_course, student_branch, current_year, room_number, current_date);

        boolean flag_student= dao.AllotStudentDetails.allotStudent(student);

//        Save some student details for room_details
        Room room_details = new Room(student_prn, room_number, current_date);
        boolean flag_room= dao.AllotRoom.allotRoom(room_details);

        if(flag_student && flag_room){
            response.setStatus(HttpServletResponse.SC_OK);
        }else{
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("Check Credential Details");
        }
    }
}
