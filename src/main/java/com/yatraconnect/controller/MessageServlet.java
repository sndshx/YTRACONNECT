package com.yatraconnect.controller;

import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet("/agency/messages/*")
public class MessageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null
                || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/agency/login");
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        String companyName = agent.getCompanyName();

        // Load conversations for this agency
        List<Map<String, String>> conversations = getConversations(companyName);
        request.setAttribute("conversations", conversations);

        // Load selected conversation messages
        String selectedTravellerId = request.getParameter("travellerId");
        if (selectedTravellerId != null) {
            List<Map<String, String>> messages = getMessages(companyName, selectedTravellerId);
            request.setAttribute("messages", messages);
            request.setAttribute("selectedTravellerId", selectedTravellerId);
        }

        request.getRequestDispatcher("/agency/messages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null
                || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/agency/login");
            return;
        }

        HamroAgent agent = (HamroAgent) session.getAttribute("user");
        String travellerId = request.getParameter("travellerId");
        String messageText = request.getParameter("message");

        if (messageText != null && !messageText.trim().isEmpty()) {
            sendMessage(agent.getCompanyName(), agent.getId(), travellerId,
                       "agent", agent.getFullName(), agent.getEmail(), messageText);
        }

        response.sendRedirect(request.getContextPath() + "/agency/messages/?travellerId=" + travellerId);
    }

    private List<Map<String, String>> getConversations(String companyName) {
        List<Map<String, String>> conversations = new ArrayList<>();
        String sql = "SELECT DISTINCT customerName, customerEmail, travellerId, " +
                     "MAX(createdAt) as lastMessage FROM Messages WHERE companyName = ? " +
                     "GROUP BY customerName, customerEmail, travellerId ORDER BY lastMessage DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, companyName);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, String> conv = new HashMap<>();
                conv.put("customerName", rs.getString("customerName"));
                conv.put("customerEmail", rs.getString("customerEmail"));
                conv.put("travellerId", rs.getString("travellerId"));
                conv.put("lastMessage", rs.getTimestamp("lastMessage").toString());
                conversations.add(conv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conversations;
    }

    private List<Map<String, String>> getMessages(String companyName, String travellerId) {
        List<Map<String, String>> messages = new ArrayList<>();
        String sql = "SELECT * FROM Messages WHERE companyName = ? AND travellerId = ? ORDER BY createdAt ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, companyName);
            pstmt.setString(2, travellerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, String> msg = new HashMap<>();
                msg.put("id", rs.getString("id"));
                msg.put("senderRole", rs.getString("senderRole"));
                msg.put("customerName", rs.getString("customerName"));
                msg.put("message", rs.getString("message"));
                msg.put("createdAt", rs.getTimestamp("createdAt").toString());
                messages.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    private void sendMessage(String companyName, String agentId, String travellerId,
                             String senderRole, String senderName, String senderEmail, String message) {
        String sql = "INSERT INTO Messages (id, companyName, agentId, travellerId, senderRole, " +
                     "customerName, customerEmail, message, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'sent')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, UUID.randomUUID().toString());
            pstmt.setString(2, companyName);
            pstmt.setString(3, agentId);
            pstmt.setString(4, travellerId);
            pstmt.setString(5, senderRole);
            pstmt.setString(6, senderName);
            pstmt.setString(7, senderEmail);
            pstmt.setString(8, message);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
