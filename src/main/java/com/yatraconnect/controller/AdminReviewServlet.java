package com.yatraconnect.controller;

import com.yatraconnect.dao.ReviewDAO;
import com.yatraconnect.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/reviews", "/admin/reviews/*"})
public class AdminReviewServlet extends HttpServlet {
    private ReviewDAO reviewDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        reviewDAO = new ReviewDAO();
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

        List<Review> reviews;
        if ("pending".equals(filter)) {
            reviews = reviewDAO.getPendingReviews();
        } else {
            reviews = reviewDAO.getAllReviews();
        }

        request.setAttribute("reviews", reviews);
        request.setAttribute("currentFilter", filter != null ? filter : "all");
        request.getRequestDispatcher("/admin/manage-reviews.jsp").forward(request, response);
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
        String reviewId = request.getParameter("reviewId");

        boolean success = false;
        String message = "";

        switch (action) {
            case "approve":
                success = reviewDAO.updateReviewStatus(reviewId, "approved");
                message = success ? "Review approved." : "Failed to approve review.";
                break;
            case "reject":
                success = reviewDAO.updateReviewStatus(reviewId, "rejected");
                message = success ? "Review rejected." : "Failed to reject review.";
                break;
            case "delete":
                success = reviewDAO.deleteReview(reviewId);
                message = success ? "Review deleted." : "Failed to delete review.";
                break;
            default:
                message = "Invalid action.";
        }

        request.getSession().setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/reviews/");
    }
}
