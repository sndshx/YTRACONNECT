package com.yatraconnect.dao;

import com.yatraconnect.model.Review;
import com.yatraconnect.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ReviewDAO {

    /**
     * Retrieves all reviews (for admin panel).
     */
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                reviews.add(mapResultSetToReview(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Creates a new review in the database.
     * @param review The review object containing review details.
     * @return boolean true if creation is successful, false otherwise.
     */
    public boolean createReview(Review review) {
        String sql = "INSERT INTO Reviews (id, listingId, travellerId, customerName, rating, message, serviceType, status, companyName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Generate UUID for the new review
            String id = UUID.randomUUID().toString();
            review.setId(id);

            pstmt.setString(1, review.getId());
            pstmt.setString(2, review.getListingId());
            pstmt.setString(3, review.getTravellerId());
            pstmt.setString(4, review.getCustomerName());
            pstmt.setInt(5, review.getRating());
            pstmt.setString(6, review.getMessage());
            pstmt.setString(7, review.getServiceType());
            pstmt.setString(8, review.getStatus());
            pstmt.setString(9, review.getCompanyName());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves a review by ID.
     * @param id The review's ID.
     * @return Review object if found, null otherwise.
     */
    public Review getReviewById(String id) {
        String sql = "SELECT * FROM Reviews WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToReview(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Retrieves reviews by listing ID.
     * @param listingId The listing's ID.
     * @return List of reviews for the listing.
     */
    public List<Review> getReviewsByListingId(String listingId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews WHERE listingId = ? AND status = 'approved' ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, listingId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                reviews.add(mapResultSetToReview(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Retrieves reviews by traveller ID.
     * @param travellerId The traveller's ID.
     * @return List of reviews by the traveller.
     */
    public List<Review> getReviewsByTravellerId(String travellerId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews WHERE travellerId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, travellerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                reviews.add(mapResultSetToReview(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Retrieves all pending reviews (for admin approval).
     * @return List of pending reviews.
     */
    public List<Review> getPendingReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews WHERE status = 'pending' ORDER BY createdAt ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                reviews.add(mapResultSetToReview(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Updates review status (approve or reject).
     * @param reviewId The review's ID.
     * @param status The new status ('approved' or 'rejected').
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateReviewStatus(String reviewId, String status) {
        String sql = "UPDATE Reviews SET status = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setString(2, reviewId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates a review.
     * @param review The review object with updated information.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateReview(Review review) {
        String sql = "UPDATE Reviews SET rating = ?, message = ?, serviceType = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, review.getRating());
            pstmt.setString(2, review.getMessage());
            pstmt.setString(3, review.getServiceType());
            pstmt.setString(4, review.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Deletes a review.
     * @param reviewId The review's ID.
     * @return boolean true if deletion is successful, false otherwise.
     */
    public boolean deleteReview(String reviewId) {
        String sql = "DELETE FROM Reviews WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, reviewId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Calculates average rating for a listing.
     * @param listingId The listing's ID.
     * @return Average rating as float.
     */
    public float getAverageRatingForListing(String listingId) {
        String sql = "SELECT AVG(rating) as avg_rating FROM Reviews WHERE listingId = ? AND status = 'approved'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, listingId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                float avgRating = rs.getFloat("avg_rating");
                return rs.wasNull() ? 0.0f : avgRating;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0f;
    }

    /**
     * Counts approved reviews for a listing.
     * @param listingId The listing's ID.
     * @return Number of approved reviews.
     */
    public int getReviewCountForListing(String listingId) {
        String sql = "SELECT COUNT(*) as review_count FROM Reviews WHERE listingId = ? AND status = 'approved'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, listingId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("review_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Maps a ResultSet row to a Review object.
     * @param rs The ResultSet.
     * @return Review object.
     * @throws SQLException if an error occurs while reading from ResultSet.
     */
    private Review mapResultSetToReview(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setId(rs.getString("id"));
        review.setListingId(rs.getString("listingId"));
        review.setTravellerId(rs.getString("travellerId"));
        review.setCustomerName(rs.getString("customerName"));
        review.setRating(rs.getInt("rating"));
        review.setMessage(rs.getString("message"));
        review.setServiceType(rs.getString("serviceType"));
        review.setStatus(rs.getString("status"));
        review.setCompanyName(rs.getString("companyName"));
        review.setCreatedAt(rs.getTimestamp("createdAt"));
        review.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return review;
    }
}