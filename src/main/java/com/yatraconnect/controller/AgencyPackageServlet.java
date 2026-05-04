package com.yatraconnect.controller;

import com.yatraconnect.dao.ListingDAO;
import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.model.Listing;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/agency/packages/*")
public class AgencyPackageServlet extends HttpServlet {
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
        if (session == null || session.getAttribute("user") == null
                || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/agency/login");
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || "/".equals(pathInfo) || "/list".equals(pathInfo)) {
            // List all packages for this agency
            List<Listing> packages = listingDAO.getListingsByAgentId(agent.getId());
            request.setAttribute("packages", packages);
            request.getRequestDispatcher("/agency/manage-packages.jsp").forward(request, response);

        } else if ("/add".equals(pathInfo)) {
            // Show add package form
            request.getRequestDispatcher("/agency/addPackage.jsp").forward(request, response);

        } else if ("/edit".equals(pathInfo)) {
            // Show edit package form
            String packageId = request.getParameter("id");
            Listing pkg = listingDAO.getListingById(packageId);

            if (pkg != null && pkg.getAgentId().equals(agent.getId())) {
                request.setAttribute("package", pkg);
                request.getRequestDispatcher("/agency/editPackage.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/agency/packages/");
            }
        }
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
        String action = request.getParameter("action");

        boolean success = false;
        String message = "";

        switch (action) {
            case "add":
                success = handleAddPackage(request, agent);
                message = success ? "Package created successfully!" : "Failed to create package.";
                break;
            case "edit":
                success = handleEditPackage(request, agent);
                message = success ? "Package updated successfully!" : "Failed to update package.";
                break;
            case "delete":
                String deleteId = request.getParameter("packageId");
                Listing toDelete = listingDAO.getListingById(deleteId);
                if (toDelete != null && toDelete.getAgentId().equals(agent.getId())) {
                    success = listingDAO.deleteListing(deleteId);
                }
                message = success ? "Package deleted." : "Failed to delete package.";
                break;
            default:
                message = "Invalid action.";
        }

        session.setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/agency/packages/");
    }

    private boolean handleAddPackage(HttpServletRequest request, HamroAgent agent) {
        try {
            Listing listing = new Listing();
            listing.setAgentId(agent.getId());
            listing.setCompanyName(agent.getCompanyName());
            listing.setTitle(request.getParameter("title"));
            listing.setDescription(request.getParameter("description"));
            listing.setType(request.getParameter("type"));
            listing.setLocation(request.getParameter("location"));

            String priceStr = request.getParameter("price");
            listing.setPrice(priceStr != null && !priceStr.isEmpty() ? new BigDecimal(priceStr) : BigDecimal.ZERO);

            String durationStr = request.getParameter("duration");
            listing.setDuration(durationStr != null && !durationStr.isEmpty() ? Integer.parseInt(durationStr) : 1);

            String difficulty = request.getParameter("difficulty");
            if (difficulty != null && !difficulty.isEmpty()) {
                listing.setDifficulty(difficulty);
            }

            listing.setActive(true);
            listing.setAvgRating(0.0f);
            listing.setReviewCount(0);

            return listingDAO.createListing(listing);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean handleEditPackage(HttpServletRequest request, HamroAgent agent) {
        try {
            String packageId = request.getParameter("packageId");
            Listing listing = listingDAO.getListingById(packageId);

            if (listing == null || !listing.getAgentId().equals(agent.getId())) {
                return false;
            }

            listing.setTitle(request.getParameter("title"));
            listing.setDescription(request.getParameter("description"));
            listing.setType(request.getParameter("type"));
            listing.setLocation(request.getParameter("location"));

            String priceStr = request.getParameter("price");
            listing.setPrice(priceStr != null && !priceStr.isEmpty() ? new BigDecimal(priceStr) : listing.getPrice());

            String durationStr = request.getParameter("duration");
            listing.setDuration(durationStr != null && !durationStr.isEmpty() ? Integer.parseInt(durationStr) : listing.getDuration());

            String difficulty = request.getParameter("difficulty");
            if (difficulty != null && !difficulty.isEmpty()) {
                listing.setDifficulty(difficulty);
            }

            return listingDAO.updateListing(listing);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
