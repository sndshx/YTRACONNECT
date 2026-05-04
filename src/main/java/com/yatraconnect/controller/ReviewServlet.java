package com.yatraconnect.controller;

import com.google.gson.Gson;
import com.yatraconnect.dao.ListingDAO;
import com.yatraconnect.dao.ReviewDAO;
import com.yatraconnect.model.HamroTraveller;
import com.yatraconnect.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/api/reviews/*")
public class ReviewServlet extends HttpServlet {
    private ReviewDAO reviewDAO;
    private ListingDAO listingDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        reviewDAO = new ReviewDAO();
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
                // Get all approved reviews (for admin or public viewing)
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Please specify a listing ID\"}");
            } else {
                // Get reviews for a specific listing
                String listingId = pathInfo.substring(1); // Remove leading "/"
                List<Review> reviews = reviewDAO.getReviewsByListingId(listingId);
                out.print(gson.toJson(reviews));
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

        HamroTraveller traveller = (HamroTraveller) session.getAttribute("user");
        if (traveller == null || !"traveller".equals(traveller.getRole())) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            String listingId = request.getParameter("listingId");
            String ratingStr = request.getParameter("rating");
            String message = request.getParameter("message");

            if (listingId == null || ratingStr == null || message == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Missing required fields: listingId, rating, message\"}");
                return;
            }

            int rating = Integer.parseInt(ratingStr);
            if (rating < 1 || rating > 5) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Rating must be between 1 and 5\"}");
                return;
            }

            Review review = new Review(listingId, traveller.getId(), traveller.getFullName(), rating, message);

            // Optional fields
            String serviceType = request.getParameter("serviceType");
            String companyName = request.getParameter("companyName");

            if (serviceType != null) review.setServiceType(serviceType);
            if (companyName != null) review.setCompanyName(companyName);

            boolean success = reviewDAO.createReview(review);

            if (success) {
                // Update listing rating and review count
                float avgRating = reviewDAO.getAverageRatingForListing(listingId);
                int reviewCount = reviewDAO.getReviewCountForListing(listingId);
                listingDAO.updateListingRating(listingId, avgRating, reviewCount);

                out.print("{\"success\": true, \"message\": \"Review submitted successfully and awaiting approval\", \"id\": \"" + review.getId() + "\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Failed to submit review\"}");
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

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String reviewId = pathInfo.substring(1); // Remove leading "/"
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Review existingReview = reviewDAO.getReviewById(reviewId);
            if (existingReview == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\": \"Review not found\"}");
                return;
            }

            Object user = session.getAttribute("user");
            String role = (String) session.getAttribute("role");

            String action = request.getParameter("action");

            if ("approve".equals(action) && "admin".equals(role)) {
                // Admin approving review
                boolean success = reviewDAO.updateReviewStatus(reviewId, "approved");
                if (success) {
                    // Update listing rating and review count
                    String listingId = existingReview.getListingId();
                    float avgRating = reviewDAO.getAverageRatingForListing(listingId);
                    int reviewCount = reviewDAO.getReviewCountForListing(listingId);
                    listingDAO.updateListingRating(listingId, avgRating, reviewCount);

                    out.print("{\"success\": true, \"message\": \"Review approved successfully\"}");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print("{\"error\": \"Failed to approve review\"}");
                }
            } else if ("reject".equals(action) && "admin".equals(role)) {
                // Admin rejecting review
                boolean success = reviewDAO.updateReviewStatus(reviewId, "rejected");
                if (success) {
                    out.print("{\"success\": true, \"message\": \"Review rejected successfully\"}");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print("{\"error\": \"Failed to reject review\"}");
                }
            } else if ("update".equals(action)) {
                // Traveller updating their own review
                HamroTraveller traveller = (HamroTraveller) user;
                if (!existingReview.getTravellerId().equals(traveller.getId())) {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    out.print("{\"error\": \"You can only update your own reviews\"}");
                    return;
                }

                String ratingStr = request.getParameter("rating");
                String message = request.getParameter("message");

                if (ratingStr != null) {
                    int rating = Integer.parseInt(ratingStr);
                    if (rating < 1 || rating > 5) {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        out.print("{\"error\": \"Rating must be between 1 and 5\"}");
                        return;
                    }
                    existingReview.setRating(rating);
                }

                if (message != null) existingReview.setMessage(message);

                boolean success = reviewDAO.updateReview(existingReview);
                if (success) {
                    out.print("{\"success\": true, \"message\": \"Review updated successfully\"}");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print("{\"error\": \"Failed to update review\"}");
                }
            } else {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\": \"Invalid action or insufficient permissions\"}");
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

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String reviewId = pathInfo.substring(1); // Remove leading "/"
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Review review = reviewDAO.getReviewById(reviewId);
            if (review == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\": \"Review not found\"}");
                return;
            }

            Object user = session.getAttribute("user");
            String role = (String) session.getAttribute("role");

            boolean hasPermission = false;
            if ("admin".equals(role)) {
                hasPermission = true;
            } else if ("traveller".equals(role)) {
                HamroTraveller traveller = (HamroTraveller) user;
                hasPermission = review.getTravellerId().equals(traveller.getId());
            }

            if (!hasPermission) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\": \"You don't have permission to delete this review\"}");
                return;
            }

            boolean success = reviewDAO.deleteReview(reviewId);

            if (success) {
                out.print("{\"success\": true, \"message\": \"Review deleted successfully\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Failed to delete review\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }
}