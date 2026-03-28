package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout-student")
public class StudentLogout extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();   // destroy session
        }

        // disable browser cache
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        response.setStatus(HttpServletResponse.SC_OK);
    }
}
