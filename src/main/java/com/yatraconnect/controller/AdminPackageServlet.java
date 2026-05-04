package com.yatraconnect.controller;

import com.yatraconnect.dao.ListingDAO;
import com.yatraconnect.model.Listing;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/packages", "/admin/packages/*"})
public class AdminPackageServlet extends HttpServlet {
    private ListingDAO listingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        listingDAO = new ListingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Listing> packages = listingDAO.getAllActiveListings();
        request.setAttribute("packages", packages);
        request.getRequestDispatcher("/admin/managePackages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String packageId = request.getParameter("packageId");
        boolean success = false;
        String message = "";

        if ("delete".equals(action)) {
            success = listingDAO.deleteListing(packageId);
            message = success ? "Package removed." : "Failed to remove package.";
        }

        session.setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/packages/");
    }
}
