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

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            System.out.println("Admin Login Attempt: " + email);
            Admin admin = adminDAO.loginAdmin(email, password);

            if (admin != null) {
                System.out.println("Admin Login SUCCESS: " + admin.getFullName());
                HttpSession session = request.getSession(true);
                session.setAttribute("admin", admin);
                session.setAttribute("user", admin);
                session.setAttribute("role", "admin");
                session.setAttribute("adminId", admin.getId());
                session.setAttribute("adminName", admin.getFullName());
                session.setMaxInactiveInterval(30 * 60);

                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                System.out.println("Admin Login FAILED for email: " + email);
                request.setAttribute("errorMessage", "Invalid admin credentials.");
                request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("CRITICAL ERROR in AdminLoginServlet:");
            e.printStackTrace();
            request.setAttribute("errorMessage", "An internal error occurred: " + e.getMessage());
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
