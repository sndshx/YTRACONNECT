package com.yatraconnect.controller;

import com.yatraconnect.dao.BookingDAO;
import com.yatraconnect.model.Booking;
import com.yatraconnect.model.HamroAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/agency/bookings")
public class AgencyBookingsServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Booking> bookings = bookingDAO.getBookingsByAgentId(agent.getId());
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/agency/booking-requests.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String bookingId = request.getParameter("bookingId");
        String action = request.getParameter("action");

        if (bookingId != null && action != null) {
            String status = "confirmed";
            if ("decline".equals(action)) {
                status = "cancelled";
            }
            
            boolean success = bookingDAO.updateBookingStatus(bookingId, status);
            if (success) {
                request.getSession().setAttribute("successMessage", "Booking " + status + " successfully.");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to update booking status.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/agency/bookings");
    }
}
