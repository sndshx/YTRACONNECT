package com.yatraconnect.controller;

import com.google.gson.Gson;
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
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/api/listings/*")
public class ListingServlet extends HttpServlet {
    private ListingDAO listingDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        listingDAO = new ListingDAO();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Get all active listings
                List<Listing> listings = listingDAO.getAllActiveListings();
                out.print(gson.toJson(listings));
            } else if (pathInfo.startsWith("/type/")) {
                // Get listings by type
                String type = pathInfo.substring(6); // Remove "/type/"
                List<Listing> listings = listingDAO.getListingsByType(type);
                out.print(gson.toJson(listings));
            } else if (pathInfo.startsWith("/agent/")) {
                // Get listings by agent
                String agentId = pathInfo.substring(7); // Remove "/agent/"
                List<Listing> listings = listingDAO.getListingsByAgentId(agentId);
                out.print(gson.toJson(listings));
            } else if (pathInfo.startsWith("/search")) {
                // Search listings
                String query = request.getParameter("q");
                if (query != null && !query.trim().isEmpty()) {
                    List<Listing> listings = listingDAO.searchListings(query.trim());
                    out.print(gson.toJson(listings));
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print("{\"error\": \"Search query parameter 'q' is required\"}");
                }
            } else {
                // Get specific listing by ID
                String listingId = pathInfo.substring(1); // Remove leading "/"
                Listing listing = listingDAO.getListingById(listingId);
                if (listing != null) {
                    out.print(gson.toJson(listing));
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    out.print("{\"error\": \"Listing not found\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        if (agent == null || !"agent".equals(agent.getRole())) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String type = request.getParameter("type");
            String priceStr = request.getParameter("price");

            if (title == null || description == null || type == null || priceStr == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Missing required fields: title, description, type, price\"}");
                return;
            }

            BigDecimal price = new BigDecimal(priceStr);
            Listing listing = new Listing(agent.getId(), title, description, type, price);

            // Optional fields
            String offers = request.getParameter("offers");
            String durationStr = request.getParameter("duration");
            String location = request.getParameter("location");
            String companyName = request.getParameter("companyName");

            if (offers != null) listing.setOffers(offers);
            if (durationStr != null) listing.setDuration(Integer.parseInt(durationStr));
            if (location != null) listing.setLocation(location);
            if (companyName != null) listing.setCompanyName(companyName);

            // Room details for hotels
            if ("hotel".equals(type)) {
                String totalRoomsStr = request.getParameter("totalRooms");
                String acRoomsStr = request.getParameter("acRooms");
                String nonAcRoomsStr = request.getParameter("nonAcRooms");
                String acPriceStr = request.getParameter("acPrice");
                String nonAcPriceStr = request.getParameter("nonAcPrice");

                if (totalRoomsStr != null) listing.setTotalRooms(Integer.parseInt(totalRoomsStr));
                if (acRoomsStr != null) listing.setAcRooms(Integer.parseInt(acRoomsStr));
                if (nonAcRoomsStr != null) listing.setNonAcRooms(Integer.parseInt(nonAcRoomsStr));
                if (acPriceStr != null) listing.setAcPrice(new BigDecimal(acPriceStr));
                if (nonAcPriceStr != null) listing.setNonAcPrice(new BigDecimal(nonAcPriceStr));
            }

            boolean success = listingDAO.createListing(listing);

            if (success) {
                out.print("{\"success\": true, \"message\": \"Listing created successfully\", \"id\": \"" + listing.getId() + "\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Failed to create listing\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        if (agent == null || !"agent".equals(agent.getRole())) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String listingId = pathInfo.substring(1); // Remove leading "/"
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Listing existingListing = listingDAO.getListingById(listingId);
            if (existingListing == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\": \"Listing not found\"}");
                return;
            }

            if (!existingListing.getAgentId().equals(agent.getId())) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\": \"You can only update your own listings\"}");
                return;
            }

            // Update fields from request parameters
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");

            if (title != null) existingListing.setTitle(title);
            if (description != null) existingListing.setDescription(description);
            if (priceStr != null) existingListing.setPrice(new BigDecimal(priceStr));

            // Update other fields as needed...

            boolean success = listingDAO.updateListing(existingListing);

            if (success) {
                out.print("{\"success\": true, \"message\": \"Listing updated successfully\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Failed to update listing\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        if (agent == null || !"agent".equals(agent.getRole())) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String listingId = pathInfo.substring(1); // Remove leading "/"
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Listing listing = listingDAO.getListingById(listingId);
            if (listing == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\": \"Listing not found\"}");
                return;
            }

            if (!listing.getAgentId().equals(agent.getId())) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\": \"You can only delete your own listings\"}");
                return;
            }

            boolean success = listingDAO.deleteListing(listingId);

            if (success) {
                out.print("{\"success\": true, \"message\": \"Listing deleted successfully\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Failed to delete listing\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }
}