package com.yatraconnect.dao;

import com.yatraconnect.model.Booking;
import com.yatraconnect.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class BookingDAO {

    /**
     * Retrieves all bookings (for admin panel).
     */
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Creates a new booking in the database.
     * @param booking The booking object containing booking details.
     * @return boolean true if creation is successful, false otherwise.
     */
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO Bookings (id, listingId, agentId, travellerId, guestName, guestEmail, guestPhone, bookingType, startDate, endDate, roomCount, roomType, roomSelection, guideName, totalAmount, advanceAmount, paymentStatus, idType, idNumber, otherIdType, serialId, status, notes, companyName, createdBy, tripStatus, checklist) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Generate UUID for the new booking
            String id = UUID.randomUUID().toString();
            booking.setId(id);

            pstmt.setString(1, booking.getId());
            pstmt.setString(2, booking.getListingId());
            pstmt.setString(3, booking.getAgentId());
            pstmt.setString(4, booking.getTravellerId());
            pstmt.setString(5, booking.getGuestName());
            pstmt.setString(6, booking.getGuestEmail());
            pstmt.setString(7, booking.getGuestPhone());
            pstmt.setString(8, booking.getBookingType());
            pstmt.setDate(9, booking.getStartDate());
            if (booking.getEndDate() != null) {
                pstmt.setDate(10, booking.getEndDate());
            } else {
                pstmt.setNull(10, java.sql.Types.DATE);
            }
            pstmt.setInt(11, booking.getRoomCount());
            pstmt.setString(12, booking.getRoomType());
            pstmt.setString(13, booking.getRoomSelection());
            pstmt.setString(14, booking.getGuideName());
            pstmt.setBigDecimal(15, booking.getTotalAmount());
            pstmt.setBigDecimal(16, booking.getAdvanceAmount());
            pstmt.setString(17, booking.getPaymentStatus());
            pstmt.setString(18, booking.getIdType());
            pstmt.setString(19, booking.getIdNumber());
            pstmt.setString(20, booking.getOtherIdType());
            pstmt.setString(21, booking.getSerialId());
            pstmt.setString(22, booking.getStatus());
            pstmt.setString(23, booking.getNotes());
            pstmt.setString(24, booking.getCompanyName());
            pstmt.setString(25, booking.getCreatedBy());
            pstmt.setString(26, booking.getTripStatus());
            pstmt.setString(27, booking.getChecklist());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves a booking by ID.
     * @param id The booking's ID.
     * @return Booking object if found, null otherwise.
     */
    public Booking getBookingById(String id) {
        String sql = "SELECT * FROM Bookings WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToBooking(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Retrieves bookings by traveller ID.
     * @param travellerId The traveller's ID.
     * @return List of bookings for the traveller.
     */
    public List<Booking> getBookingsByTravellerId(String travellerId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE travellerId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, travellerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Retrieves bookings by agent ID.
     * @param agentId The agent's ID.
     * @return List of bookings for the agent.
     */
    public List<Booking> getBookingsByAgentId(String agentId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE agentId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agentId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Retrieves bookings by listing ID.
     * @param listingId The listing's ID.
     * @return List of bookings for the listing.
     */
    public List<Booking> getBookingsByListingId(String listingId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE listingId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, listingId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Retrieves bookings by status.
     * @param status The booking status.
     * @return List of bookings with the specified status.
     */
    public List<Booking> getBookingsByStatus(String status) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE status = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Retrieves bookings by trip status.
     * @param tripStatus The trip status ('pending', 'active', 'completed').
     * @return List of bookings with the specified trip status.
     */
    public List<Booking> getBookingsByTripStatus(String tripStatus) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Bookings WHERE tripStatus = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tripStatus);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Updates booking status.
     * @param bookingId The booking's ID.
     * @param status The new status.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateBookingStatus(String bookingId, String status) {
        String sql = "UPDATE Bookings SET status = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setString(2, bookingId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates booking trip status.
     * @param bookingId The booking's ID.
     * @param tripStatus The new trip status.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateTripStatus(String bookingId, String tripStatus) {
        String sql = "UPDATE Bookings SET tripStatus = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tripStatus);
            pstmt.setString(2, bookingId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates payment status.
     * @param bookingId The booking's ID.
     * @param paymentStatus The new payment status.
     * @param advanceAmount The advance amount paid.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updatePaymentStatus(String bookingId, String paymentStatus, java.math.BigDecimal advanceAmount) {
        String sql = "UPDATE Bookings SET paymentStatus = ?, advanceAmount = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, paymentStatus);
            pstmt.setBigDecimal(2, advanceAmount);
            pstmt.setString(3, bookingId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates booking details.
     * @param booking The booking object with updated information.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateBooking(Booking booking) {
        String sql = "UPDATE Bookings SET guestName = ?, guestEmail = ?, guestPhone = ?, startDate = ?, endDate = ?, roomCount = ?, roomType = ?, roomSelection = ?, guideName = ?, totalAmount = ?, notes = ?, checklist = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, booking.getGuestName());
            pstmt.setString(2, booking.getGuestEmail());
            pstmt.setString(3, booking.getGuestPhone());
            pstmt.setDate(4, booking.getStartDate());
            if (booking.getEndDate() != null) {
                pstmt.setDate(5, booking.getEndDate());
            } else {
                pstmt.setNull(5, java.sql.Types.DATE);
            }
            pstmt.setInt(6, booking.getRoomCount());
            pstmt.setString(7, booking.getRoomType());
            pstmt.setString(8, booking.getRoomSelection());
            pstmt.setString(9, booking.getGuideName());
            pstmt.setBigDecimal(10, booking.getTotalAmount());
            pstmt.setString(11, booking.getNotes());
            pstmt.setString(12, booking.getChecklist());
            pstmt.setString(13, booking.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Cancels a booking.
     * @param bookingId The booking's ID.
     * @return boolean true if cancellation is successful, false otherwise.
     */
    public boolean cancelBooking(String bookingId) {
        String sql = "UPDATE Bookings SET status = 'cancelled', updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, bookingId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Maps a ResultSet row to a Booking object.
     * @param rs The ResultSet.
     * @return Booking object.
     * @throws SQLException if an error occurs while reading from ResultSet.
     */
    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setId(rs.getString("id"));
        booking.setListingId(rs.getString("listingId"));
        booking.setAgentId(rs.getString("agentId"));
        booking.setTravellerId(rs.getString("travellerId"));
        booking.setGuestName(rs.getString("guestName"));
        booking.setGuestEmail(rs.getString("guestEmail"));
        booking.setGuestPhone(rs.getString("guestPhone"));
        booking.setBookingType(rs.getString("bookingType"));
        booking.setStartDate(rs.getDate("startDate"));
        booking.setEndDate(rs.getDate("endDate"));
        booking.setRoomCount(rs.getInt("roomCount"));
        booking.setRoomType(rs.getString("roomType"));
        booking.setRoomSelection(rs.getString("roomSelection"));
        booking.setGuideName(rs.getString("guideName"));
        booking.setTotalAmount(rs.getBigDecimal("totalAmount"));
        booking.setAdvanceAmount(rs.getBigDecimal("advanceAmount"));
        booking.setPaymentStatus(rs.getString("paymentStatus"));
        booking.setIdType(rs.getString("idType"));
        booking.setIdNumber(rs.getString("idNumber"));
        booking.setOtherIdType(rs.getString("otherIdType"));
        booking.setSerialId(rs.getString("serialId"));
        booking.setStatus(rs.getString("status"));
        booking.setNotes(rs.getString("notes"));
        booking.setCompanyName(rs.getString("companyName"));
        booking.setCreatedBy(rs.getString("createdBy"));
        booking.setTripStatus(rs.getString("tripStatus"));
        booking.setChecklist(rs.getString("checklist"));
        booking.setCreatedAt(rs.getTimestamp("createdAt"));
        booking.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return booking;
    }
}