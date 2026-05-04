package com.yatraconnect.dao;

import com.yatraconnect.model.Listing;
import com.yatraconnect.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ListingDAO {

    /**
     * Creates a new listing in the database.
     * @param listing The listing object containing listing details.
     * @return boolean true if creation is successful, false otherwise.
     */
    public boolean createListing(Listing listing) {
        String sql = "INSERT INTO Listings (id, agentId, title, description, type, price, offers, duration, images, totalRooms, acRooms, nonAcRooms, familyRooms, coupleRooms, isActive, companyName, amenities, itinerary, hotelCategory, acPrice, nonAcPrice, familyPrice, couplePrice, difficulty, bestSeasons, location, maxGroupSize, minAge, tags, avgRating, reviewCount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Generate UUID for the new listing
            String id = UUID.randomUUID().toString();
            listing.setId(id);

            pstmt.setString(1, listing.getId());
            pstmt.setString(2, listing.getAgentId());
            pstmt.setString(3, listing.getTitle());
            pstmt.setString(4, listing.getDescription());
            pstmt.setString(5, listing.getType());
            pstmt.setBigDecimal(6, listing.getPrice());
            pstmt.setString(7, listing.getOffers());
            pstmt.setInt(8, listing.getDuration());
            pstmt.setString(9, listing.getImages());
            pstmt.setInt(10, listing.getTotalRooms());
            pstmt.setInt(11, listing.getAcRooms());
            pstmt.setInt(12, listing.getNonAcRooms());
            pstmt.setInt(13, listing.getFamilyRooms());
            pstmt.setInt(14, listing.getCoupleRooms());
            pstmt.setBoolean(15, listing.isActive());
            pstmt.setString(16, listing.getCompanyName());
            pstmt.setString(17, listing.getAmenities());
            pstmt.setString(18, listing.getItinerary());
            pstmt.setString(19, listing.getHotelCategory());
            pstmt.setBigDecimal(20, listing.getAcPrice());
            pstmt.setBigDecimal(21, listing.getNonAcPrice());
            pstmt.setBigDecimal(22, listing.getFamilyPrice());
            pstmt.setBigDecimal(23, listing.getCouplePrice());
            pstmt.setString(24, listing.getDifficulty());
            pstmt.setString(25, listing.getBestSeasons());
            pstmt.setString(26, listing.getLocation());
            if (listing.getMaxGroupSize() != null) {
                pstmt.setInt(27, listing.getMaxGroupSize());
            } else {
                pstmt.setNull(27, java.sql.Types.INTEGER);
            }
            if (listing.getMinAge() != null) {
                pstmt.setInt(28, listing.getMinAge());
            } else {
                pstmt.setNull(28, java.sql.Types.INTEGER);
            }
            pstmt.setString(29, listing.getTags());
            pstmt.setFloat(30, listing.getAvgRating());
            pstmt.setInt(31, listing.getReviewCount());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves a listing by ID.
     * @param id The listing's ID.
     * @return Listing object if found, null otherwise.
     */
    public Listing getListingById(String id) {
        String sql = "SELECT * FROM Listings WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToListing(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Retrieves all active listings.
     * @return List of active listings.
     */
    public List<Listing> getAllActiveListings() {
        List<Listing> listings = new ArrayList<>();
        String sql = "SELECT * FROM Listings WHERE isActive = true ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("Database connection is null in getAllActiveListings");
                return listings;
            }
            try (PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    listings.add(mapResultSetToListing(rs));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in getAllActiveListings: " + e.getMessage());
            e.printStackTrace();
        }
        return listings;
    }

    /**
     * Retrieves listings by agent ID.
     * @param agentId The agent's ID.
     * @return List of listings for the agent.
     */
    public List<Listing> getListingsByAgentId(String agentId) {
        List<Listing> listings = new ArrayList<>();
        String sql = "SELECT * FROM Listings WHERE agentId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agentId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                listings.add(mapResultSetToListing(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listings;
    }

    /**
     * Retrieves listings by type.
     * @param type The listing type ('hotel', 'trekking', 'travel').
     * @return List of listings of the specified type.
     */
    public List<Listing> getListingsByType(String type) {
        List<Listing> listings = new ArrayList<>();
        String sql = "SELECT * FROM Listings WHERE type = ? AND isActive = true ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, type);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                listings.add(mapResultSetToListing(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listings;
    }

    /**
     * Searches listings by title or description.
     * @param searchTerm The search term.
     * @return List of matching listings.
     */
    public List<Listing> searchListings(String searchTerm) {
        List<Listing> listings = new ArrayList<>();
        String sql = "SELECT * FROM Listings WHERE (title LIKE ? OR description LIKE ?) AND isActive = true ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String searchPattern = "%" + searchTerm + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                listings.add(mapResultSetToListing(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listings;
    }

    /**
     * Updates a listing.
     * @param listing The listing object with updated information.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateListing(Listing listing) {
        String sql = "UPDATE Listings SET title = ?, description = ?, type = ?, price = ?, offers = ?, duration = ?, images = ?, totalRooms = ?, acRooms = ?, nonAcRooms = ?, familyRooms = ?, coupleRooms = ?, isActive = ?, companyName = ?, amenities = ?, itinerary = ?, hotelCategory = ?, acPrice = ?, nonAcPrice = ?, familyPrice = ?, couplePrice = ?, difficulty = ?, bestSeasons = ?, location = ?, maxGroupSize = ?, minAge = ?, tags = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, listing.getTitle());
            pstmt.setString(2, listing.getDescription());
            pstmt.setString(3, listing.getType());
            pstmt.setBigDecimal(4, listing.getPrice());
            pstmt.setString(5, listing.getOffers());
            pstmt.setInt(6, listing.getDuration());
            pstmt.setString(7, listing.getImages());
            pstmt.setInt(8, listing.getTotalRooms());
            pstmt.setInt(9, listing.getAcRooms());
            pstmt.setInt(10, listing.getNonAcRooms());
            pstmt.setInt(11, listing.getFamilyRooms());
            pstmt.setInt(12, listing.getCoupleRooms());
            pstmt.setBoolean(13, listing.isActive());
            pstmt.setString(14, listing.getCompanyName());
            pstmt.setString(15, listing.getAmenities());
            pstmt.setString(16, listing.getItinerary());
            pstmt.setString(17, listing.getHotelCategory());
            pstmt.setBigDecimal(18, listing.getAcPrice());
            pstmt.setBigDecimal(19, listing.getNonAcPrice());
            pstmt.setBigDecimal(20, listing.getFamilyPrice());
            pstmt.setBigDecimal(21, listing.getCouplePrice());
            pstmt.setString(22, listing.getDifficulty());
            pstmt.setString(23, listing.getBestSeasons());
            pstmt.setString(24, listing.getLocation());
            if (listing.getMaxGroupSize() != null) {
                pstmt.setInt(25, listing.getMaxGroupSize());
            } else {
                pstmt.setNull(25, java.sql.Types.INTEGER);
            }
            if (listing.getMinAge() != null) {
                pstmt.setInt(26, listing.getMinAge());
            } else {
                pstmt.setNull(26, java.sql.Types.INTEGER);
            }
            pstmt.setString(27, listing.getTags());
            pstmt.setString(28, listing.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates listing rating and review count.
     * @param listingId The listing's ID.
     * @param avgRating The new average rating.
     * @param reviewCount The new review count.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateListingRating(String listingId, float avgRating, int reviewCount) {
        String sql = "UPDATE Listings SET avgRating = ?, reviewCount = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setFloat(1, avgRating);
            pstmt.setInt(2, reviewCount);
            pstmt.setString(3, listingId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Deletes a listing (soft delete by setting isActive to false).
     * @param listingId The listing's ID.
     * @return boolean true if deletion is successful, false otherwise.
     */
    public boolean deleteListing(String listingId) {
        String sql = "UPDATE Listings SET isActive = false, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, listingId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Maps a ResultSet row to a Listing object.
     * @param rs The ResultSet.
     * @return Listing object.
     * @throws SQLException if an error occurs while reading from ResultSet.
     */
    private Listing mapResultSetToListing(ResultSet rs) throws SQLException {
        Listing listing = new Listing();
        listing.setId(rs.getString("id"));
        listing.setAgentId(rs.getString("agentId"));
        listing.setTitle(rs.getString("title"));
        listing.setDescription(rs.getString("description"));
        listing.setType(rs.getString("type"));
        listing.setPrice(rs.getBigDecimal("price"));
        listing.setOffers(rs.getString("offers"));
        listing.setDuration(rs.getInt("duration"));
        listing.setImages(rs.getString("images"));
        listing.setTotalRooms(rs.getInt("totalRooms"));
        listing.setAcRooms(rs.getInt("acRooms"));
        listing.setNonAcRooms(rs.getInt("nonAcRooms"));
        listing.setFamilyRooms(rs.getInt("familyRooms"));
        listing.setCoupleRooms(rs.getInt("coupleRooms"));
        listing.setActive(rs.getBoolean("isActive"));
        listing.setCompanyName(rs.getString("companyName"));
        listing.setAmenities(rs.getString("amenities"));
        listing.setItinerary(rs.getString("itinerary"));
        listing.setHotelCategory(rs.getString("hotelCategory"));
        listing.setAcPrice(rs.getBigDecimal("acPrice"));
        listing.setNonAcPrice(rs.getBigDecimal("nonAcPrice"));
        listing.setFamilyPrice(rs.getBigDecimal("familyPrice"));
        listing.setCouplePrice(rs.getBigDecimal("couplePrice"));
        listing.setDifficulty(rs.getString("difficulty"));
        listing.setBestSeasons(rs.getString("bestSeasons"));
        listing.setLocation(rs.getString("location"));
        listing.setMaxGroupSize(rs.getObject("maxGroupSize", Integer.class));
        listing.setMinAge(rs.getObject("minAge", Integer.class));
        listing.setTags(rs.getString("tags"));
        listing.setAvgRating(rs.getFloat("avgRating"));
        listing.setReviewCount(rs.getInt("reviewCount"));
        listing.setCreatedAt(rs.getTimestamp("createdAt"));
        listing.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return listing;
    }
}