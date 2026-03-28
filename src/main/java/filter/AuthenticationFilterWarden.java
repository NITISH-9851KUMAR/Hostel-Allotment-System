//package filter;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//
//@WebFilter("/*")
//public class AuthenticationFilterWarden implements Filter {
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response,
//                         FilterChain chain) throws IOException, ServletException {
//
//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse res = (HttpServletResponse) response;
//        String uri = req.getRequestURI();
//
//        // this all pages can be access without login user
//        if (
//                uri.endsWith("index.jsp")
//                || uri.endsWith("warden-login.jsp")
//                || uri.endsWith("student-login.jsp")
//                || uri.endsWith("student-login-dashboard.jsp")
//                || uri.endsWith("student-password-forgot.jsp")
//                || uri.endsWith("student-register.jsp")
//                || uri.endsWith("modal-code.jsp")
//                || uri.endsWith("error-page.jsp")
//                || uri.contains("/css/")
//                || uri.contains("/js/")
//                || uri.contains("/image/")) {
//
//            chain.doFilter(request, response);
//            return;
//        }
//
//        HttpSession session = req.getSession(false);
//
//        // Block if not logged in and send to the login page
//        if (session == null || session.getAttribute("current_warden") == null) {
//            res.sendRedirect("warden-login.jsp");
//            return;
//        }
//
//        // User authenticated
//        chain.doFilter(request, response);
//    }
//
//}