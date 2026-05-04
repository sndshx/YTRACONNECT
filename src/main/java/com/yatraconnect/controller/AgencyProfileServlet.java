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

@WebServlet("/agency/profile/*")
public class AgencyProfileServlet extends HttpServlet {
    private AgentDAO agentDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        agentDAO = new AgentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null
                || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/agency/login");
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        // Refresh agent data from DB
        HamroAgent freshAgent = agentDAO.getAgentById(agent.getId());
        if (freshAgent != null) {
            session.setAttribute("user", freshAgent);
        }

        request.getRequestDispatcher("/agency/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null
                || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/agency/login");
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");

        // Update profile fields
        agent.setFullName(request.getParameter("fullName"));
        agent.setCompanyName(request.getParameter("companyName"));
        agent.setPhoneNo(request.getParameter("phone"));
        agent.setLocation(request.getParameter("location"));
        agent.setBio(request.getParameter("bio"));
        agent.setWebsite(request.getParameter("website"));
        agent.setLegalCompanyName(request.getParameter("legalCompanyName"));
        agent.setCompanyOwner(request.getParameter("companyOwner"));
        agent.setOwnerContactNo(request.getParameter("ownerContactNo"));

        boolean success = agentDAO.updateAgent(agent);

        if (success) {
            session.setAttribute("user", agent);
            session.setAttribute("successMessage", "Profile updated successfully!");
        } else {
            session.setAttribute("errorMessage", "Failed to update profile.");
        }

        response.sendRedirect(request.getContextPath() + "/agency/profile/");
    }
}
