package com.yatraconnect.dao;

import com.yatraconnect.model.Listing;
import com.yatraconnect.model.Wishlist;
import com.yatraconnect.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class WishlistDAO {

    public WishlistDAO() {
        createTableIfNotExists();
    }

    private void createTableIfNotExists() {
        String sql = "CREATE TABLE IF NOT EXISTS Wishlists (" +
                "id VARCHAR(36) PRIMARY KEY, " +
                "travellerId VARCHAR(36) NOT NULL, " +
                "listingId VARCHAR(36) NOT NULL, " +
                "createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                "FOREIGN KEY (travellerId) REFERENCES HamroTravellers(id) ON DELETE CASCADE, " +
                "FOREIGN KEY (listingId) REFERENCES Listings(id) ON DELETE CASCADE, " +
                "UNIQUE(travellerId, listingId))";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addWishlist(String travellerId, String listingId) {
        if (isWishlisted(travellerId, listingId)) {
            return false; // Already wishlisted
        }
        String sql = "INSERT INTO Wishlists (id, travellerId, listingId) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, UUID.randomUUID().toString());
            ps.setString(2, travellerId);
            ps.setString(3, listingId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeWishlist(String travellerId, String listingId) {
        String sql = "DELETE FROM Wishlists WHERE travellerId = ? AND listingId = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, travellerId);
            ps.setString(2, listingId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Listing> getWishlistsByTraveller(String travellerId) {
        List<Listing> listings = new ArrayList<>();
        String sql = "SELECT l.* FROM Listings l INNER JOIN Wishlists w ON l.id = w.listingId WHERE w.travellerId = ? ORDER BY w.createdAt DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, travellerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Listing l = new Listing();
                l.setId(rs.getString("id"));
                l.setAgentId(rs.getString("agentId"));
                l.setTitle(rs.getString("title"));
                l.setDescription(rs.getString("description"));
                l.setType(rs.getString("type"));
                l.setPrice(rs.getBigDecimal("price"));
                l.setOffers(rs.getString("offers"));
                l.setDuration(rs.getInt("duration"));
                l.setImages(rs.getString("images"));
                l.setDifficulty(rs.getString("difficulty"));
                l.setAvgRating(rs.getFloat("avgRating"));
                l.setReviewCount(rs.getInt("reviewCount"));
                l.setLocation(rs.getString("location"));
                l.setAmenities(rs.getString("amenities"));
                l.setHotelCategory(rs.getString("hotelCategory"));
                listings.add(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listings;
    }

    public boolean isWishlisted(String travellerId, String listingId) {
        String sql = "SELECT 1 FROM Wishlists WHERE travellerId = ? AND listingId = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, travellerId);
            ps.setString(2, listingId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
