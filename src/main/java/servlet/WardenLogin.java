package servlet;

import com.mysql.cj.Session;
import dao.WardenLoginDao;
import dao.WardenLoginDao.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Warden;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/warden-login")
@MultipartConfig
public class WardenLogin extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String string_warden_id = request.getParameter("userid").trim();
        Long warden_id= Long.parseLong(string_warden_id);
        String warden_password = request.getParameter("password").trim();

        Warden current_warden= WardenLoginDao.authenticateWardenLogin(warden_id, warden_password);
        if(current_warden!=null){
            response.setStatus(HttpServletResponse.SC_OK);
            HttpSession session= request.getSession();
            session.setAttribute("current_warden", current_warden);
            return;
        }
        out.println("<h1>Invalid Warden Details</h2>");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

    }

}
