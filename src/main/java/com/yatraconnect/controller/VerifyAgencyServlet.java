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
import java.util.List;

@WebServlet({"/admin/agencies", "/admin/agencies/*"})
public class VerifyAgencyServlet extends HttpServlet {
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
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String filter = request.getParameter("filter");

        List<HamroAgent> agencies;
        if (filter != null && !filter.isEmpty()) {
            agencies = agentDAO.getAgentsByVerificationStatus(filter);
        } else {
            agencies = agentDAO.getAllAgents();
        }

        request.setAttribute("agencies", agencies);
        request.setAttribute("currentFilter", filter != null ? filter : "all");
        request.getRequestDispatcher("/admin/verifyAgencies.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");
        String agentId = request.getParameter("agentId");

        boolean success = false;
        String message = "";

        switch (action) {
            case "approve":
                success = agentDAO.updateVerificationStatus(agentId, "verified", true);
                message = success ? "Agency approved successfully." : "Failed to approve agency.";
                break;
            case "reject":
                success = agentDAO.updateVerificationStatus(agentId, "rejected", false);
                message = success ? "Agency rejected." : "Failed to reject agency.";
                break;
            case "delete":
                success = agentDAO.deleteAgent(agentId);
                message = success ? "Agency deleted." : "Failed to delete agency.";
                break;
            default:
                message = "Invalid action.";
        }

        request.getSession().setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/agencies/");
    }
}
