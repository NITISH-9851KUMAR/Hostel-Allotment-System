package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/student/*")
public class AuthenticationFilterStudent implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        // this all pages can be access without login user
        if (
                        uri.endsWith("/student/student-login.jsp")
                        || uri.endsWith("/student/student-error-page.jsp")
                        || uri.endsWith("/student/student-register.jsp")
                        || uri.endsWith("/student/student-password-forgot.jsp")
                        || uri.contains("/student/css/")
                        || uri.contains("/student/js/")
                        || uri.contains("/student/image/")) {

            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);

        // Block if not logged in and send to the login page
        if (session == null || session.getAttribute("current_login_student") == null) {
            res.sendRedirect(req.getContextPath() + "/student/student-login.jsp");
            return;
        }

        // User authenticated
        chain.doFilter(request, response);
    }

}