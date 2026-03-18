package controller;

import dal.ClassDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import models.ClassRoom;
import models.User;

public class TeacherClassServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"teacher".equals(user.getRole())) {
            response.sendRedirect("Login.jsp");
            return;
        }

        ClassDAO dao = new ClassDAO();
        List<ClassRoom> list = dao.getClassesByTeacher(user.getUserid());

        if (list == null || list.isEmpty()) {
            list = dao.getAllClasses();
            request.setAttribute("showAllClasses", true);
        }

        request.setAttribute("classList", list);
        request.getRequestDispatcher("teacher-classes.jsp").forward(request, response);
    }
}
