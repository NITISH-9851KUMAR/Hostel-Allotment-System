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

@WebServlet("/search-student")
@MultipartConfig
public class SearchStudent extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String prn = request.getParameter("prn");

//        check user details is correct, is yes then return user details and his roommates details
//        This list contain student roommates details

        Student student = dao.ValidDetails.studentDetailsByPrn(prn);
        if (student != null) {
            HttpSession session = request.getSession();
            session.setAttribute("search_student_details", student);
            session.setAttribute("prn_value", prn);

            response.setStatus(HttpServletResponse.SC_OK);
            out.print("{\"message\":\"Student Login successfully\"}");
            return;
        }

        out.print("{\"message\":\"Student Not Found\"}");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

    }
}
