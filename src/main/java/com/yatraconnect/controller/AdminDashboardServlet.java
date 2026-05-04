package com.yatraconnect.controller;

import com.yatraconnect.dao.AdminDAO;
import com.yatraconnect.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            System.out.println("DEBUG: No session found for /admin/dashboard. Redirecting to login.");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            // Check if 'user' attribute exists and is an Admin
            Object user = session.getAttribute("user");
            if (user instanceof Admin) {
                admin = (Admin) user;
                session.setAttribute("admin", admin); // Sync it
            }
        }

        if (admin == null) {
            System.out.println("DEBUG: No admin object found in session. Attributes: " + java.util.Collections.list(session.getAttributeNames()));
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        System.out.println("ACCESS GRANTED: Admin dashboard visited by " + admin.getFullName());

        // Load dashboard statistics
        request.setAttribute("totalTravellers", adminDAO.countTravellers());
        request.setAttribute("totalAgencies", adminDAO.countAgencies());
        request.setAttribute("totalBookings", adminDAO.countBookings());
        request.setAttribute("totalListings", adminDAO.countListings());
        request.setAttribute("totalReviews", adminDAO.countReviews());
        request.setAttribute("pendingAgencies", adminDAO.countPendingAgencies());
        request.setAttribute("pendingReviews", adminDAO.countPendingReviews());
        request.setAttribute("activeBookings", adminDAO.countActiveBookings());
        request.setAttribute("totalRevenue", adminDAO.getTotalRevenue());

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
