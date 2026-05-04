package com.yatraconnect.dao;

import com.yatraconnect.model.HamroTraveller;
import com.yatraconnect.util.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class TravellerDAO {

    /**
     * Retrieves all travellers (for admin panel).
     */
    public List<HamroTraveller> getAllTravellers() {
        List<HamroTraveller> travellers = new ArrayList<>();
        String sql = "SELECT * FROM HamroTravellers ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                HamroTraveller t = new HamroTraveller();
                t.setId(rs.getString("id"));
                t.setFullName(rs.getString("fullName"));
                t.setEmail(rs.getString("email"));
                t.setContactNumber(rs.getString("contactNumber"));
                t.setRole(rs.getString("role"));
                t.setCreatedAt(rs.getTimestamp("createdAt"));
                t.setUpdatedAt(rs.getTimestamp("updatedAt"));
                travellers.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return travellers;
    }

    /**
     * Gets a traveller by ID.
     */
    public HamroTraveller getTravellerById(String id) {
        String sql = "SELECT * FROM HamroTravellers WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                HamroTraveller t = new HamroTraveller();
                t.setId(rs.getString("id"));
                t.setFullName(rs.getString("fullName"));
                t.setEmail(rs.getString("email"));
                t.setContactNumber(rs.getString("contactNumber"));
                t.setRole(rs.getString("role"));
                t.setCreatedAt(rs.getTimestamp("createdAt"));
                t.setUpdatedAt(rs.getTimestamp("updatedAt"));
                return t;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Deletes a traveller by ID.
     */
    public boolean deleteTraveller(String id) {
        String sql = "DELETE FROM HamroTravellers WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Suspends a traveller account.
     */
    public boolean suspendTraveller(String id) {
        String sql = "UPDATE HamroTravellers SET role = 'suspended', updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Activates a suspended traveller account.
     */
    public boolean activateTraveller(String id) {
        String sql = "UPDATE HamroTravellers SET role = 'traveller', updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Registers a new traveller into the database.
     * @param traveller The traveller object containing registration details.
     * @return boolean true if registration is successful, false otherwise.
     */
    public boolean registerTraveller(HamroTraveller traveller) {
        String sql = "INSERT INTO HamroTravellers (id, fullName, email, password, contactNumber, role) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            // Generate UUID for the new user
            String id = UUID.randomUUID().toString();
            traveller.setId(id);
            
            // Hash password using BCrypt
            String hashedPassword = BCrypt.hashpw(traveller.getPassword(), BCrypt.gensalt());
            
            pstmt.setString(1, traveller.getId());
            pstmt.setString(2, traveller.getFullName());
            pstmt.setString(3, traveller.getEmail());
            pstmt.setString(4, hashedPassword);
            pstmt.setString(5, traveller.getContactNumber());
            pstmt.setString(6, "traveller"); // Default role
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Authenticates a traveller based on email and password.
     * @param email The traveller's email.
     * @param password The traveller's raw password.
     * @return HamroTraveller object if authentication is successful, null otherwise.
     */
    public HamroTraveller loginTraveller(String email, String password) {
        String sql = "SELECT * FROM HamroTravellers WHERE email = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");
                
                // Verify the password using BCrypt
                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    HamroTraveller traveller = new HamroTraveller();
                    traveller.setId(rs.getString("id"));
                    traveller.setFullName(rs.getString("fullName"));
                    traveller.setEmail(rs.getString("email"));
                    traveller.setContactNumber(rs.getString("contactNumber"));
                    traveller.setRole(rs.getString("role"));
                    // Do not map the password back to the object for security
                    return traveller;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * Checks if an email is already registered.
     * @param email The email to check.
     * @return true if email exists, false otherwise.
     */
    public boolean isEmailExists(String email) {
        String sql = "SELECT id FROM HamroTravellers WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
