package com.yatraconnect.dao;

import com.yatraconnect.model.Message;
import com.yatraconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class MessageDAO {

    public List<Message> getMessagesByAgentId(String agentId) {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM Messages WHERE agentId = ? ORDER BY createdAt DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agentId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                messages.add(mapResultSetToMessage(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    public Message getMessageById(String id) {
        String sql = "SELECT * FROM Messages WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToMessage(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean sendMessage(Message message) {
        String sql = "INSERT INTO Messages (id, companyName, travellerId, agentId, senderRole, customerName, customerEmail, subject, message, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            message.setId(UUID.randomUUID().toString());
            pstmt.setString(1, message.getId());
            pstmt.setString(2, message.getCompanyName());
            pstmt.setString(3, message.getTravellerId());
            pstmt.setString(4, message.getAgentId());
            pstmt.setString(5, message.getSenderRole());
            pstmt.setString(6, message.getCustomerName());
            pstmt.setString(7, message.getCustomerEmail());
            pstmt.setString(8, message.getSubject());
            pstmt.setString(9, message.getMessage());
            pstmt.setString(10, message.getStatus() != null ? message.getStatus() : "unread");

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateMessageStatus(String id, String status) {
        String sql = "UPDATE Messages SET status = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setString(2, id);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Message mapResultSetToMessage(ResultSet rs) throws SQLException {
        Message message = new Message();
        message.setId(rs.getString("id"));
        message.setCompanyName(rs.getString("companyName"));
        message.setTravellerId(rs.getString("travellerId"));
        message.setAgentId(rs.getString("agentId"));
        message.setSenderRole(rs.getString("senderRole"));
        message.setCustomerName(rs.getString("customerName"));
        message.setCustomerEmail(rs.getString("customerEmail"));
        message.setSubject(rs.getString("subject"));
        message.setMessage(rs.getString("message"));
        message.setStatus(rs.getString("status"));
        message.setCreatedAt(rs.getTimestamp("createdAt"));
        message.setUpdatedAt(rs.getTimestamp("updatedAt"));
        return message;
    }
}
