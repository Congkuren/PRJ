package controller;

import dal.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import models.ClassOffer;
import models.User;

public class CoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }

        CourseDAO dao = new CourseDAO();
        List<ClassOffer> classes = dao.getAvailableClasses(user.getUserid());

        request.setAttribute("availableClasses", classes);
        request.setAttribute("status", request.getParameter("status"));
        request.getRequestDispatcher("courses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }

        int classId;
        try {
            classId = Integer.parseInt(request.getParameter("classId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("CoursesServlet?status=invalid");
            return;
        }

        CourseDAO dao = new CourseDAO();
        boolean success = dao.enrollStudent(user.getUserid(), classId);
        response.sendRedirect("CoursesServlet?status=" + (success ? "enrolled" : "exists"));
    }
}
