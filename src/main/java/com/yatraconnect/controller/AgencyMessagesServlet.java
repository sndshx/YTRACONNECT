package com.yatraconnect.controller;

import com.yatraconnect.dao.MessageDAO;
import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.model.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/agency/messages")
public class AgencyMessagesServlet extends HttpServlet {
    private MessageDAO messageDAO;

    @Override
    public void init() throws ServletException {
        messageDAO = new MessageDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Message> messages = messageDAO.getMessagesByAgentId(agent.getId());
        request.setAttribute("messages", messages);
        
        String selectedMessageId = request.getParameter("id");
        if (selectedMessageId != null) {
            Message selectedMessage = messageDAO.getMessageById(selectedMessageId);
            if (selectedMessage != null && selectedMessage.getAgentId().equals(agent.getId())) {
                request.setAttribute("selectedMessage", selectedMessage);
                // Mark as read if it's from traveller
                if ("traveller".equals(selectedMessage.getSenderRole())) {
                    messageDAO.updateMessageStatus(selectedMessageId, "read");
                }
            }
        } else if (messages != null && !messages.isEmpty()) {
            request.setAttribute("selectedMessage", messages.get(0));
        }

        request.getRequestDispatcher("/agency/messages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = request.getParameter("action");
        if ("reply".equals(action)) {
            String originalMessageId = request.getParameter("messageId");
            String replyText = request.getParameter("replyText");
            
            Message original = messageDAO.getMessageById(originalMessageId);
            if (original != null && original.getAgentId().equals(agent.getId())) {
                Message reply = new Message();
                reply.setAgentId(agent.getId());
                reply.setTravellerId(original.getTravellerId());
                reply.setCompanyName(agent.getCompanyName());
                reply.setCustomerName(agent.getFullName());
                reply.setCustomerEmail(agent.getEmail());
                reply.setSenderRole("agent");
                reply.setSubject("Re: " + original.getSubject());
                reply.setMessage(replyText);
                
                boolean success = messageDAO.sendMessage(reply);
                if (success) {
                    request.getSession().setAttribute("successMessage", "Reply sent.");
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/agency/messages?id=" + request.getParameter("messageId"));
    }
}
