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

@WebServlet("/agency/bookings/*")
public class AgencyBookingServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        bookingDAO = new BookingDAO();
    }

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
        String statusFilter = request.getParameter("status");

        List<Booking> bookings;
        if (statusFilter != null && !statusFilter.isEmpty()) {
            bookings = bookingDAO.getBookingsByAgentId(agent.getId());
            bookings.removeIf(b -> !statusFilter.equalsIgnoreCase(b.getStatus()));
        } else {
            bookings = bookingDAO.getBookingsByAgentId(agent.getId());
        }

        request.setAttribute("bookings", bookings);
        request.setAttribute("currentFilter", statusFilter != null ? statusFilter : "all");
        request.getRequestDispatcher("/agency/booking-requests.jsp").forward(request, response);
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

        String action = request.getParameter("action");
        String bookingId = request.getParameter("bookingId");

        boolean success = false;
        String message = "";

        switch (action) {
            case "accept":
                success = bookingDAO.updateBookingStatus(bookingId, "confirmed");
                if (success) {
                    bookingDAO.updateTripStatus(bookingId, "active");
                }
                message = success ? "Booking accepted!" : "Failed to accept booking.";
                break;
            case "reject":
                success = bookingDAO.updateBookingStatus(bookingId, "cancelled");
                message = success ? "Booking rejected." : "Failed to reject booking.";
                break;
            case "complete":
                success = bookingDAO.updateTripStatus(bookingId, "completed");
                message = success ? "Trip marked as completed." : "Failed to update trip status.";
                break;
            default:
                message = "Invalid action.";
        }

        session.setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/agency/bookings/");
    }
}
