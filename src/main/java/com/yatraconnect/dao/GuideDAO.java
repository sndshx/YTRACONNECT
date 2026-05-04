package com.yatraconnect.dao;

import com.yatraconnect.model.Guide;
import com.yatraconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class GuideDAO {

    public List<Guide> getGuidesByAgent(String agentId) {
        List<Guide> guides = new ArrayList<>();
        String sql = "SELECT * FROM Guides WHERE agentId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agentId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                guides.add(mapResultSetToGuide(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guides;
    }

    public boolean addGuide(Guide guide) {
        String sql = "INSERT INTO Guides (id, fullName, email, phoneNo, experienceYears, profileImage, certificateImage, certificateExpiry, agentId, companyName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            guide.setId(UUID.randomUUID().toString());
            pstmt.setString(1, guide.getId());
            pstmt.setString(2, guide.getFullName());
            pstmt.setString(3, guide.getEmail());
            pstmt.setString(4, guide.getPhoneNo());
            pstmt.setInt(5, guide.getExperienceYears());
            pstmt.setString(6, guide.getProfileImage());
            pstmt.setString(7, guide.getCertificateImage());
            pstmt.setDate(8, new java.sql.Date(guide.getCertificateExpiry().getTime()));
            pstmt.setString(9, guide.getAgentId());
            pstmt.setString(10, guide.getCompanyName());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteGuide(String guideId, String agentId) {
        String sql = "DELETE FROM Guides WHERE id = ? AND agentId = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, guideId);
            pstmt.setString(2, agentId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Guide mapResultSetToGuide(ResultSet rs) throws SQLException {
        Guide guide = new Guide();
        guide.setId(rs.getString("id"));
        guide.setFullName(rs.getString("fullName"));
        guide.setEmail(rs.getString("email"));
        guide.setPhoneNo(rs.getString("phoneNo"));
        guide.setExperienceYears(rs.getInt("experienceYears"));
        guide.setProfileImage(rs.getString("profileImage"));
        guide.setCertificateImage(rs.getString("certificateImage"));
        guide.setCertificateExpiry(rs.getDate("certificateExpiry"));
        guide.setAgentId(rs.getString("agentId"));
        guide.setCompanyName(rs.getString("companyName"));
        guide.setLastAlertSent(rs.getDate("lastAlertSent"));
        guide.setCreatedAt(rs.getTimestamp("createdAt"));
        guide.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return guide;
    }
}
