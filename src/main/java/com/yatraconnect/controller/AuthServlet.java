package com.yatraconnect.controller;

import com.yatraconnect.dao.AgentDAO;
import com.yatraconnect.dao.TravellerDAO;
import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.model.HamroTraveller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth/*")
public class AuthServlet extends HttpServlet {
    private TravellerDAO travellerDAO;
    private AgentDAO agentDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        travellerDAO = new TravellerDAO();
        agentDAO = new AgentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo(); // e.g., /login or /register
        
        if (pathInfo == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        switch (pathInfo) {
            case "/login":
                handleLogin(request, response);
                break;
            case "/register":
                handleRegister(request, response);
                break;
            case "/logout":
                handleLogout(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if ("/logout".equals(pathInfo)) {
            handleLogout(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String redirect = request.getParameter("redirect");

        try {
            // Try admin login first (from Admins table)
            com.yatraconnect.dao.AdminDAO adminDAO = new com.yatraconnect.dao.AdminDAO();
            com.yatraconnect.model.Admin admin = adminDAO.loginAdmin(email, password);

            if (admin != null) {
                System.out.println("DEBUG: Admin found! Redirecting to dashboard...");
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                session.setAttribute("user", admin);
                session.setAttribute("adminId", admin.getId());
                session.setAttribute("adminName", admin.getFullName());
                session.setAttribute("role", "admin");
                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                return;
            } else {
                System.out.println("DEBUG: Admin NOT found for email: " + email);
            }

            // Try traveller login
            HamroTraveller traveller = travellerDAO.loginTraveller(email, password);

            if (traveller != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", traveller);
                session.setAttribute("role", traveller.getRole());

                if ("suspended".equals(traveller.getRole())) {
                    request.setAttribute("errorMessage", "Your account has been suspended. Contact support.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                    return;
                }

                if (redirect != null && !redirect.isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect(request.getContextPath() + "/traveller/dashboard.jsp");
                }
                return;
            }

            // Try agent login
            HamroAgent agent = agentDAO.loginAgent(email, password);

            if (agent != null) {
                // Allow login regardless of verification status
                HttpSession session = request.getSession();
                session.setAttribute("user", agent);
                session.setAttribute("role", "agent");
                session.setAttribute("agentId", agent.getId());
                session.setAttribute("companyName", agent.getCompanyName());
                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect(request.getContextPath() + "/agency/dashboard");
                return;
            }

            // Failed login
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An internal error occurred. Please try again later.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");
        String companyName = request.getParameter("companyName");
        String role = request.getParameter("role"); // 'traveller' or 'agent'

        // Basic validation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        try {
            if ("agent".equals(role)) {
                // Register as agent
                if (agentDAO.isEmailExists(email)) {
                    request.setAttribute("errorMessage", "Email is already registered.");
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                    return;
                }

                HamroAgent newAgent = new HamroAgent(fullName, email, password, companyName);
                newAgent.setPhoneNo(phone);

                boolean success = agentDAO.registerAgent(newAgent);

                if (success) {
                    request.setAttribute("successMessage", "Agent registration successful! Please login.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Agent registration failed. Please try again.");
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                }
            } else {
                // Register as traveller
                if (travellerDAO.isEmailExists(email)) {
                    request.setAttribute("errorMessage", "Email is already registered.");
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                    return;
                }

                HamroTraveller newTraveller = new HamroTraveller(null, fullName, email, password, phone, "traveller");

                boolean success = travellerDAO.registerTraveller(newTraveller);

                if (success) {
                    request.setAttribute("successMessage", "Registration successful! Please login.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An internal error occurred.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
