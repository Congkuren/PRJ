package controller;

import dal.ClassDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import models.ClassInfo;
import models.User;

public class StudentClassesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }

        ClassDAO dao = new ClassDAO();
        List<ClassInfo> classes = dao.getRegisteredClasses(user.getUserid());

        request.setAttribute("registeredClasses", classes);
        request.setAttribute("classesLoaded", true);
        request.setAttribute("status", request.getParameter("status"));

        request.getRequestDispatcher("student.jsp").forward(request, response);
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

        String action = request.getParameter("action");
        if (!"leave".equals(action)) {
            response.sendRedirect("StudentClassesServlet");
            return;
        }

        int classId;
        try {
            classId = Integer.parseInt(request.getParameter("classId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("StudentClassesServlet?status=invalid");
            return;
        }

        ClassDAO dao = new ClassDAO();
        boolean success = dao.leaveClass(user.getUserid(), classId);

        response.sendRedirect("StudentClassesServlet?status=" + (success ? "left" : "fail"));
    }
}
