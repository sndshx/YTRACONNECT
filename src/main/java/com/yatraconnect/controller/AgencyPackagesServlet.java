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
import java.util.List;

@WebServlet("/agency/packages")
public class AgencyPackagesServlet extends HttpServlet {
    private ListingDAO listingDAO;

    @Override
    public void init() throws ServletException {
        listingDAO = new ListingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Listing> listings = listingDAO.getListingsByAgentId(agent.getId());
        request.setAttribute("listings", listings);
        
        String successMessage = (String) session.getAttribute("successMessage");
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (successMessage != null) session.removeAttribute("successMessage");
        if (errorMessage != null) session.removeAttribute("errorMessage");
        
        request.setAttribute("successMessage", successMessage);
        request.setAttribute("errorMessage", errorMessage);

        request.getRequestDispatcher("/agency/manage-packages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = request.getParameter("action");
        if ("create".equals(action)) {
            try {
                Listing listing = new Listing();
                listing.setAgentId(agent.getId());
                listing.setCompanyName(agent.getCompanyName());
                listing.setTitle(request.getParameter("title"));
                listing.setDescription(request.getParameter("description"));
                listing.setType(request.getParameter("type"));
                listing.setPrice(new java.math.BigDecimal(request.getParameter("price")));
                listing.setDuration(Integer.parseInt(request.getParameter("duration")));
                listing.setLocation(request.getParameter("location"));
                listing.setDifficulty(request.getParameter("difficulty"));
                listing.setBestSeasons(request.getParameter("bestSeasons"));
                listing.setTags(request.getParameter("tags"));
                listing.setAmenities(request.getParameter("amenities"));
                
                String maxGroupSize = request.getParameter("maxGroupSize");
                if (maxGroupSize != null && !maxGroupSize.isEmpty()) {
                    listing.setMaxGroupSize(Integer.parseInt(maxGroupSize));
                }
                
                String minAge = request.getParameter("minAge");
                if (minAge != null && !minAge.isEmpty()) {
                    listing.setMinAge(Integer.parseInt(minAge));
                }

                listing.setActive(true);
                
                // Set some defaults
                listing.setImages("[\"https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=800\"]");
                listing.setAvgRating(0.0f);
                listing.setReviewCount(0);

                if (listingDAO.createListing(listing)) {
                    session.setAttribute("successMessage", "Package created successfully!");
                } else {
                    session.setAttribute("errorMessage", "Failed to create package.");
                }
            } catch (Exception e) {
                session.setAttribute("errorMessage", "Error: " + e.getMessage());
            }
        } else if ("delete".equals(action)) {
            String listingId = request.getParameter("listingId");
            if (listingDAO.deleteListing(listingId)) {
                session.setAttribute("successMessage", "Package deleted successfully.");
            } else {
                session.setAttribute("errorMessage", "Failed to delete package.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/agency/packages");
    }
}
