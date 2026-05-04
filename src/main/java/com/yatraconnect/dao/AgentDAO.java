package com.yatraconnect.dao;

import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.util.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class AgentDAO {

    /**
     * Registers a new agent into the database.
     * @param agent The agent object containing registration details.
     * @return boolean true if registration is successful, false otherwise.
     */
    public boolean registerAgent(HamroAgent agent) {
        String sql = "INSERT INTO HamroAgents (id, fullName, email, password, companyName, role, verificationStatus, verified) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Generate UUID for the new agent
            String id = UUID.randomUUID().toString();
            agent.setId(id);

            // Hash password using BCrypt
            String hashedPassword = BCrypt.hashpw(agent.getPassword(), BCrypt.gensalt());

            pstmt.setString(1, agent.getId());
            pstmt.setString(2, agent.getFullName());
            pstmt.setString(3, agent.getEmail());
            pstmt.setString(4, hashedPassword);
            pstmt.setString(5, agent.getCompanyName());
            pstmt.setString(6, "agent"); // Default role
            pstmt.setString(7, "pending"); // Default verification status
            pstmt.setBoolean(8, false); // Default verified status

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Authenticates an agent based on email and password.
     * @param email The agent's email.
     * @param password The agent's raw password.
     * @return HamroAgent object if authentication is successful, null otherwise.
     */
    public HamroAgent loginAgent(String email, String password) {
        String sql = "SELECT * FROM HamroAgents WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");

                // Verify the password using BCrypt
                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    HamroAgent agent = mapResultSetToAgent(rs);
                    return agent;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Checks if an email is already registered for agents.
     * @param email The email to check.
     * @return true if email exists, false otherwise.
     */
    public boolean isEmailExists(String email) {
        String sql = "SELECT id FROM HamroAgents WHERE email = ?";
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

    /**
     * Retrieves an agent by ID.
     * @param id The agent's ID.
     * @return HamroAgent object if found, null otherwise.
     */
    public HamroAgent getAgentById(String id) {
        String sql = "SELECT * FROM HamroAgents WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToAgent(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Updates agent profile information.
     * @param agent The agent object with updated information.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateAgent(HamroAgent agent) {
        String sql = "UPDATE HamroAgents SET fullName = ?, location = ?, phoneNo = ?, companyName = ?, bio = ?, profileImage = ?, coverImage = ?, website = ?, socialLinks = ?, panNumber = ?, legalCompanyName = ?, companyOwner = ?, ownerContactNo = ?, panImage = ?, citizenshipImage = ?, serviceTypes = ?, citizenshipNumber = ?, citizenshipDistrict = ?, citizenshipIssueDate = ?, gender = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agent.getFullName());
            pstmt.setString(2, agent.getLocation());
            pstmt.setString(3, agent.getPhoneNo());
            pstmt.setString(4, agent.getCompanyName());
            pstmt.setString(5, agent.getBio());
            pstmt.setString(6, agent.getProfileImage());
            pstmt.setString(7, agent.getCoverImage());
            pstmt.setString(8, agent.getWebsite());
            pstmt.setString(9, agent.getSocialLinks());
            pstmt.setString(10, agent.getPanNumber());
            pstmt.setString(11, agent.getLegalCompanyName());
            pstmt.setString(12, agent.getCompanyOwner());
            pstmt.setString(13, agent.getOwnerContactNo());
            pstmt.setString(14, agent.getPanImage());
            pstmt.setString(15, agent.getCitizenshipImage());
            pstmt.setString(16, agent.getServiceTypes());
            pstmt.setString(17, agent.getCitizenshipNumber());
            pstmt.setString(18, agent.getCitizenshipDistrict());
            pstmt.setString(19, agent.getCitizenshipIssueDate());
            pstmt.setString(20, agent.getGender());
            pstmt.setString(21, agent.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates agent verification status.
     * @param agentId The agent's ID.
     * @param verificationStatus The new verification status.
     * @param verified Whether the agent is verified.
     * @return boolean true if update is successful, false otherwise.
     */
    public boolean updateVerificationStatus(String agentId, String verificationStatus, boolean verified) {
        String sql = "UPDATE HamroAgents SET verificationStatus = ?, verified = ?, updatedAt = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, verificationStatus);
            pstmt.setBoolean(2, verified);
            pstmt.setString(3, agentId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves all agents (for admin purposes).
     * @return List of all agents.
     */
    public List<HamroAgent> getAllAgents() {
        List<HamroAgent> agents = new ArrayList<>();
        String sql = "SELECT * FROM HamroAgents ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                agents.add(mapResultSetToAgent(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return agents;
    }

    /**
     * Retrieves agents by verification status.
     * @param verificationStatus The verification status to filter by.
     * @return List of agents with the specified verification status.
     */
    public List<HamroAgent> getAgentsByVerificationStatus(String verificationStatus) {
        List<HamroAgent> agents = new ArrayList<>();
        String sql = "SELECT * FROM HamroAgents WHERE verificationStatus = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, verificationStatus);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                agents.add(mapResultSetToAgent(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return agents;
    }

    /**
     * Deletes an agent by ID.
     * @param agentId The agent's ID.
     * @return boolean true if deletion is successful.
     */
    public boolean deleteAgent(String agentId) {
        String sql = "DELETE FROM HamroAgents WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, agentId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Maps a ResultSet row to a HamroAgent object.
     * @param rs The ResultSet.
     * @return HamroAgent object.
     * @throws SQLException if an error occurs while reading from ResultSet.
     */
    private HamroAgent mapResultSetToAgent(ResultSet rs) throws SQLException {
        HamroAgent agent = new HamroAgent();
        agent.setId(rs.getString("id"));
        agent.setFullName(rs.getString("fullName"));
        agent.setEmail(rs.getString("email"));
        agent.setLocation(rs.getString("location"));
        agent.setPhoneNo(rs.getString("phoneNo"));
        agent.setCompanyName(rs.getString("companyName"));
        agent.setBio(rs.getString("bio"));
        agent.setProfileImage(rs.getString("profileImage"));
        agent.setCoverImage(rs.getString("coverImage"));
        agent.setWebsite(rs.getString("website"));
        agent.setSocialLinks(rs.getString("socialLinks"));
        agent.setVerified(rs.getBoolean("verified"));
        agent.setRole(rs.getString("role"));
        agent.setPanNumber(rs.getString("panNumber"));
        agent.setLegalCompanyName(rs.getString("legalCompanyName"));
        agent.setCompanyOwner(rs.getString("companyOwner"));
        agent.setOwnerContactNo(rs.getString("ownerContactNo"));
        agent.setPanImage(rs.getString("panImage"));
        agent.setCitizenshipImage(rs.getString("citizenshipImage"));
        agent.setServiceTypes(rs.getString("serviceTypes"));
        agent.setCitizenshipNumber(rs.getString("citizenshipNumber"));
        agent.setCitizenshipDistrict(rs.getString("citizenshipDistrict"));
        agent.setCitizenshipIssueDate(rs.getString("citizenshipIssueDate"));
        agent.setGender(rs.getString("gender"));
        agent.setVerificationStatus(rs.getString("verificationStatus"));
        agent.setParentAgentId(rs.getString("parentAgentId"));
        agent.setCreatedAt(rs.getTimestamp("createdAt"));
        agent.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return agent;
    }
}