package servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/student-register")
@MultipartConfig
public class StudentRegister extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String prn = request.getParameter("prn");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

//        Check this prn is already register his details, use student_register table
        boolean isRegister = dao.CheckPrnExists.checkPrnByStudentRegister(prn);
        if (isRegister) {
            out.print("{\"status\":\"error\",\"message\":\"Student is Already Registered!\"}");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

//        check if user details is invalid
        boolean isValidDetails = dao.ValidDetails.ByStudentDetails(prn, mobile, email);
        if (!isValidDetails) {
            out.print("{\"status\":\"error\",\"message\":\"Invalid Details\"}");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

//        If all details is correct then save its student_register details
        boolean isSaved= dao.SaveStudentRegisterDetails.saveDetails(prn, password);
        if (isSaved) {
            out.print("{\"status\":\"success\",\"message\":\"Student registered successfully\"}");
            response.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        out.print("{\"status\":\"error\",\"message\":\"Server Errors Register After Sometimes \"}");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

    }

}
