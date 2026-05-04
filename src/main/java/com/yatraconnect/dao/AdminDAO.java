package com.yatraconnect.dao;

import com.yatraconnect.model.Admin;
import com.yatraconnect.util.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

public class AdminDAO {

    /**
     * Authenticates an admin based on email and password.
     */
    public Admin loginAdmin(String email, String password) {
        System.out.println("DEBUG: AdminDAO.loginAdmin started for email: [" + email + "]");
        String sql = "SELECT * FROM Admins WHERE email = ? AND isActive = true";

        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                System.err.println("DEBUG: DATABASE CONNECTION FAILED in AdminDAO.loginAdmin");
                return null;
            }
            
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email);
                System.out.println("DEBUG: Executing query: " + sql + " with email: " + email);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    System.out.println("DEBUG: Admin record found in database for email: " + email);
                    String storedHash = rs.getString("password");
                    System.out.println("DEBUG: Stored hash from DB: [" + storedHash + "]");

                    try {
                        // Emergency Bypass for Sandesh@gmail.com
                        if (org.mindrot.jbcrypt.BCrypt.checkpw(password, storedHash) || 
                           (email.equalsIgnoreCase("Sandesh@gmail.com") && password.equals("asdf@123"))) {
                            System.out.println("DEBUG: Password check SUCCESSFUL for " + email);
                            Admin admin = mapResultSetToAdmin(rs);
                            updateLastLogin(admin.getId());
                            return admin;
                        } else {
                            System.err.println("DEBUG: Password check FAILED (Mismatch) for " + email);
                        }
                    } catch (Exception e) {
                        System.err.println("DEBUG: BCRYPT ERROR for " + email + ": " + e.getMessage());
                        e.printStackTrace();
                    }
                } else {
                    System.err.println("DEBUG: Admin record NOT FOUND in database for email: " + email);
                }
            }
        } catch (SQLException e) {
            System.err.println("DEBUG: SQL EXCEPTION in AdminDAO.loginAdmin:");
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Creates a new admin (for initial setup).
     */
    public boolean createAdmin(Admin admin) {
        String sql = "INSERT INTO Admins (id, fullName, email, password, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String id = UUID.randomUUID().toString();
            admin.setId(id);

            String hashedPassword = BCrypt.hashpw(admin.getPassword(), BCrypt.gensalt());

            pstmt.setString(1, admin.getId());
            pstmt.setString(2, admin.getFullName());
            pstmt.setString(3, admin.getEmail());
            pstmt.setString(4, hashedPassword);
            pstmt.setString(5, "admin");

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates the last login timestamp.
     */
    private void updateLastLogin(String adminId) {
        String sql = "UPDATE Admins SET lastLogin = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, adminId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Gets an admin by ID.
     */
    public Admin getAdminById(String id) {
        String sql = "SELECT * FROM Admins WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToAdmin(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // =====================================================
    // DASHBOARD STATISTICS
    // =====================================================

    public int countTravellers() {
        return countFromTable("SELECT COUNT(*) FROM HamroTravellers");
    }

    public int countAgencies() {
        return countFromTable("SELECT COUNT(*) FROM HamroAgents");
    }

    public int countBookings() {
        return countFromTable("SELECT COUNT(*) FROM Bookings");
    }

    public int countListings() {
        return countFromTable("SELECT COUNT(*) FROM Listings WHERE isActive = true");
    }

    public int countReviews() {
        return countFromTable("SELECT COUNT(*) FROM Reviews");
    }

    public int countPendingAgencies() {
        return countFromTable("SELECT COUNT(*) FROM HamroAgents WHERE verificationStatus = 'pending'");
    }

    public int countPendingReviews() {
        return countFromTable("SELECT COUNT(*) FROM Reviews WHERE status = 'pending'");
    }

    public int countActiveBookings() {
        return countFromTable("SELECT COUNT(*) FROM Bookings WHERE status = 'confirmed'");
    }

    private int countFromTable(String sql) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Gets total revenue from bookings.
     */
    public double getTotalRevenue() {
        String sql = "SELECT COALESCE(SUM(totalAmount), 0) FROM Bookings WHERE status != 'cancelled'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Admin mapResultSetToAdmin(ResultSet rs) throws SQLException {
        Admin admin = new Admin();
        admin.setId(rs.getString("id"));
        admin.setFullName(rs.getString("fullName"));
        admin.setEmail(rs.getString("email"));
        admin.setRole(rs.getString("role"));
        admin.setProfileImage(rs.getString("profileImage"));
        admin.setLastLogin(rs.getTimestamp("lastLogin"));
        admin.setActive(rs.getBoolean("isActive"));
        admin.setCreatedAt(rs.getTimestamp("createdAt"));
        admin.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return admin;
    }
}
