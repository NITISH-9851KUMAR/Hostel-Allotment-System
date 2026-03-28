package servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/forgot-password")
@MultipartConfig
public class StudentPasswordRecover extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String prn = request.getParameter("prn");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");

//        check if user details is invalid
        String isValidDetails = dao.ValidDetails.getPassByPrn(prn, mobile, email);

        if (isValidDetails != null) {
            out.print("{\"status\":\"success\",\"message\":\"" + isValidDetails + "\"}");
            response.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        out.print("{\"status\":\"error\",\"message\":\"Invalid Details\"}");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);


    }

}
