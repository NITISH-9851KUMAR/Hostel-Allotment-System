package servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/student-login")
@MultipartConfig
public class StudentLogin extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String prn = request.getParameter("prn");
        String password = request.getParameter("password");

//        This student contains current_login student details
        Student student = dao.GetStudentDetails.getStudentDetails(prn);

//        check user details is correct, is yes then return user details and his roommates details
//        This list contain student roommates details

        List<Student> list = dao.ValidDetails.ByStudentRegisterDetails(prn, password);
        if (list != null) {
            HttpSession session = request.getSession();
            session.setAttribute("student_roommate_list", list);
            session.setAttribute("current_login_student", student);

            response.setStatus(HttpServletResponse.SC_OK);
            out.print("{\"message\":\"Student Login successfully\"}");
            out.flush();
            return;
        }

        out.print("{\"message\":\"Invalid Details\"}");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

    }

}
