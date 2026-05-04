package com.yatraconnect.controller;

import com.yatraconnect.dao.TravellerDAO;
import com.yatraconnect.model.HamroTraveller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/users", "/admin/users/*"})
public class AdminUserServlet extends HttpServlet {
    private TravellerDAO travellerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        travellerDAO = new TravellerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        List<HamroTraveller> users = travellerDAO.getAllTravellers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/manage-users.jsp").forward(request, response);
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
        String userId = request.getParameter("userId");

        boolean success = false;
        String message = "";

        switch (action) {
            case "delete":
                success = travellerDAO.deleteTraveller(userId);
                message = success ? "User deleted successfully." : "Failed to delete user.";
                break;
            case "suspend":
                success = travellerDAO.suspendTraveller(userId);
                message = success ? "User suspended." : "Failed to suspend user.";
                break;
            case "activate":
                success = travellerDAO.activateTraveller(userId);
                message = success ? "User activated." : "Failed to activate user.";
                break;
            default:
                message = "Invalid action.";
        }

        request.getSession().setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/users/");
    }
}
