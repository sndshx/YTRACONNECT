package com.yatraconnect.controller;

import com.yatraconnect.dao.AgentDAO;
import com.yatraconnect.model.HamroAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/agency/login")
public class AgencyLoginServlet extends HttpServlet {
    private AgentDAO agentDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        agentDAO = new AgentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If already logged in as agent, redirect to dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null
                && "agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/agency/dashboard");
            return;
        }
        request.getRequestDispatcher("/agency/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            HamroAgent agent = agentDAO.loginAgent(email, password);

            if (agent != null) {
                // Allow login regardless of verification status
                HttpSession session = request.getSession();
                session.setAttribute("user", agent);
                session.setAttribute("role", "agent");
                session.setAttribute("agentId", agent.getId());
                session.setAttribute("companyName", agent.getCompanyName());
                session.setMaxInactiveInterval(30 * 60); // 30 minutes

                response.sendRedirect(request.getContextPath() + "/agency/dashboard");
            }
 else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("/agency/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An internal error occurred. Please try again.");
            request.getRequestDispatcher("/agency/login.jsp").forward(request, response);
        }
    }
}
