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

        if (action == null || action.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Invalid request: no action specified.");
            response.sendRedirect(request.getContextPath() + "/agency/packages/");
            return;
        }

        boolean success = false;
        String message = "";

        switch (action) {
            case "add":
                String addError = handleAddPackage(request, agent);
                success = (addError == null);
                message = success ? "Package created successfully!" : addError;
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

    /**
     * Returns null on success, or the error message string on failure.
     */
    private String handleAddPackage(HttpServletRequest request, HamroAgent agent) {
        try {
            Listing listing = new Listing();
            listing.setAgentId(agent.getId());
            listing.setCompanyName(agent.getCompanyName());
            listing.setTitle(request.getParameter("title"));
            listing.setDescription(request.getParameter("description"));

            // Normalize type to lowercase to match DB ENUM('hotel','trekking','travel')
            String typeParam = request.getParameter("type");
            listing.setType(typeParam != null ? typeParam.toLowerCase().trim() : "travel");

            listing.setLocation(request.getParameter("location"));

            String priceStr = request.getParameter("price");
            listing.setPrice(priceStr != null && !priceStr.isEmpty() ? new BigDecimal(priceStr) : BigDecimal.ZERO);

            String durationStr = request.getParameter("duration");
            listing.setDuration(durationStr != null && !durationStr.isEmpty() ? Integer.parseInt(durationStr) : 1);

            // Normalize difficulty to lowercase to match DB ENUM('easy','moderate','hard','extreme')
            String difficulty = request.getParameter("difficulty");
            if (difficulty != null && !difficulty.isEmpty()) {
                listing.setDifficulty(difficulty.toLowerCase().trim());
            } else {
                listing.setDifficulty(null);
            }

            // Required BigDecimal fields — default to ZERO to satisfy DB constraints
            listing.setAcPrice(BigDecimal.ZERO);
            listing.setNonAcPrice(BigDecimal.ZERO);
            listing.setFamilyPrice(BigDecimal.ZERO);
            listing.setCouplePrice(BigDecimal.ZERO);

            // Required int fields — default to 0
            listing.setTotalRooms(0);
            listing.setAcRooms(0);
            listing.setNonAcRooms(0);
            listing.setFamilyRooms(0);
            listing.setCoupleRooms(0);

            // Optional nullable fields
            listing.setOffers(null);
            listing.setImages(null);
            listing.setItinerary(null);
            // hotelCategory ENUM('hotel','homestay') — only meaningful for hotel type
            listing.setHotelCategory("hotel".equals(listing.getType()) ? "hotel" : null);

            // Parse extra fields — DB columns are JSON type, so convert CSV → JSON array
            String amenitiesRaw = request.getParameter("amenities");
            listing.setAmenities(toJsonArray(amenitiesRaw));

            String tagsRaw = request.getParameter("tags");
            listing.setTags(toJsonArray(tagsRaw));

            String bestSeasonsRaw = request.getParameter("bestSeasons");
            listing.setBestSeasons(toJsonArray(bestSeasonsRaw));

            String maxGroupStr = request.getParameter("maxGroupSize");
            listing.setMaxGroupSize((maxGroupStr != null && !maxGroupStr.isEmpty()) ? Integer.parseInt(maxGroupStr) : null);

            String minAgeStr = request.getParameter("minAge");
            listing.setMinAge((minAgeStr != null && !minAgeStr.isEmpty()) ? Integer.parseInt(minAgeStr) : null);

            listing.setActive(true);
            listing.setAvgRating(0.0f);
            listing.setReviewCount(0);

            System.out.println("[ADD-PACKAGE] agentId=" + agent.getId()
                + " title=" + listing.getTitle()
                + " type=" + listing.getType()
                + " difficulty=" + listing.getDifficulty()
                + " hotelCategory=" + listing.getHotelCategory());

            boolean result = listingDAO.createListing(listing);
            System.out.println("[ADD-PACKAGE] createListing result=" + result);
            return result ? null : "DB insert returned 0 rows — check Tomcat console for SQL error.";

        } catch (Exception e) {
            System.err.println("[ADD-PACKAGE] EXCEPTION: " + e.getMessage());
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }

    /**
     * Converts a comma-separated string into a valid JSON array string.
     * e.g. "Wifi, Guide, Porter" -> ["Wifi","Guide","Porter"]
     * Returns null if input is null or blank (so the DB column stays NULL).
     */
    private String toJsonArray(String csv) {
        if (csv == null || csv.trim().isEmpty()) {
            return null;
        }
        String[] parts = csv.split(",");
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < parts.length; i++) {
            String item = parts[i].trim()
                .replace("\\", "\\\\")   // escape backslashes
                .replace("\"", "\\\"");  // escape double quotes
            sb.append("\"").append(item).append("\"");
            if (i < parts.length - 1) sb.append(",");
        }
        sb.append("]");
        return sb.toString();
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
