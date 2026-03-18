package controller;

import dal.AttendanceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import models.AttendanceRecord;
import models.User;

public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }

        AttendanceDAO dao = new AttendanceDAO();
        List<AttendanceRecord> records = dao.getAttendanceByStudent(user.getUserid());

        int present = 0;
        int absent = 0;
        int late = 0;
        for (AttendanceRecord record : records) {
            String status = record.getStatus();
            if ("Present".equalsIgnoreCase(status)) {
                present++;
            } else if ("Absent".equalsIgnoreCase(status)) {
                absent++;
            } else if ("Late".equalsIgnoreCase(status)) {
                late++;
            }
        }

        request.setAttribute("attendanceRecords", records);
        request.setAttribute("attendanceLoaded", true);
        request.setAttribute("attendanceTotal", records.size());
        request.setAttribute("attendancePresent", present);
        request.setAttribute("attendanceAbsent", absent);
        request.setAttribute("attendanceLate", late);

        request.getRequestDispatcher("student.jsp").forward(request, response);
    }
}
