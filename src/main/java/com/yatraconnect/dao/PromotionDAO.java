package com.yatraconnect.dao;

import com.yatraconnect.model.Promotion;
import com.yatraconnect.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class PromotionDAO {

    /**
     * Retrieves all promotions ordered by creation date.
     */
    public List<Promotion> getAllPromotions() {
        List<Promotion> promotions = new ArrayList<>();
        String sql = "SELECT * FROM Promotions ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                promotions.add(mapResultSetToPromotion(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return promotions;
    }

    /**
     * Retrieves promotions by status.
     */
    public List<Promotion> getPromotionsByStatus(String status) {
        List<Promotion> promotions = new ArrayList<>();
        String sql = "SELECT * FROM Promotions WHERE status = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                promotions.add(mapResultSetToPromotion(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return promotions;
    }

    /**
     * Gets a promotion by ID.
     */
    public Promotion getPromotionById(String id) {
        String sql = "SELECT * FROM Promotions WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToPromotion(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Creates a new promotion.
     */
    public boolean createPromotion(Promotion promo) {
        String sql = "INSERT INTO Promotions (id, title, description, listingId, agentId, companyName, discountPercent, startDate, endDate, status, bannerImage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String id = UUID.randomUUID().toString();
            promo.setId(id);

            pstmt.setString(1, promo.getId());
            pstmt.setString(2, promo.getTitle());
            pstmt.setString(3, promo.getDescription());
            pstmt.setString(4, promo.getListingId());
            pstmt.setString(5, promo.getAgentId());
            pstmt.setString(6, promo.getCompanyName());
            pstmt.setBigDecimal(7, promo.getDiscountPercent());
            pstmt.setDate(8, promo.getStartDate());
            pstmt.setDate(9, promo.getEndDate());
            pstmt.setString(10, promo.getStatus() != null ? promo.getStatus() : "pending");
            pstmt.setString(11, promo.getBannerImage());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates promotion status (approve/reject).
     */
    public boolean updatePromotionStatus(String promotionId, String status) {
        String sql = "UPDATE Promotions SET status = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setString(2, promotionId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates promotion duration (start and end dates).
     */
    public boolean updatePromotionDuration(String promotionId, java.sql.Date startDate, java.sql.Date endDate) {
        String sql = "UPDATE Promotions SET startDate = ?, endDate = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            pstmt.setString(3, promotionId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Deletes a promotion.
     */
    public boolean deletePromotion(String promotionId) {
        String sql = "DELETE FROM Promotions WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, promotionId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Promotion mapResultSetToPromotion(ResultSet rs) throws SQLException {
        Promotion promo = new Promotion();
        promo.setId(rs.getString("id"));
        promo.setTitle(rs.getString("title"));
        promo.setDescription(rs.getString("description"));
        promo.setListingId(rs.getString("listingId"));
        promo.setAgentId(rs.getString("agentId"));
        promo.setCompanyName(rs.getString("companyName"));
        promo.setDiscountPercent(rs.getBigDecimal("discountPercent"));
        promo.setStartDate(rs.getDate("startDate"));
        promo.setEndDate(rs.getDate("endDate"));
        promo.setStatus(rs.getString("status"));
        promo.setBannerImage(rs.getString("bannerImage"));
        promo.setCreatedAt(rs.getTimestamp("createdAt"));
        promo.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return promo;
    }
}
