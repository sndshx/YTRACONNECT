package com.yatraconnect.controller;

import com.yatraconnect.dao.BookingDAO;
import com.yatraconnect.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/bookings", "/admin/bookings/*"})
public class AdminBookingServlet extends HttpServlet {
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
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String statusFilter = request.getParameter("status");

        List<Booking> bookings;
        if (statusFilter != null && !statusFilter.isEmpty()) {
            bookings = bookingDAO.getBookingsByStatus(statusFilter);
        } else {
            bookings = bookingDAO.getAllBookings();
        }

        request.setAttribute("bookings", bookings);
        request.setAttribute("currentFilter", statusFilter != null ? statusFilter : "all");
        request.getRequestDispatcher("/admin/manageBookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");
        String bookingId = request.getParameter("bookingId");

        boolean success = false;
        String message = "";

        switch (action) {
            case "updateStatus":
                String newStatus = request.getParameter("newStatus");
                success = bookingDAO.updateBookingStatus(bookingId, newStatus);
                message = success ? "Booking status updated to '" + newStatus + "'." : "Failed to update booking status.";
                break;
            case "updateTripStatus":
                String tripStatus = request.getParameter("tripStatus");
                success = bookingDAO.updateTripStatus(bookingId, tripStatus);
                message = success ? "Trip status updated to '" + tripStatus + "'." : "Failed to update trip status.";
                break;
            case "cancel":
                success = bookingDAO.cancelBooking(bookingId);
                message = success ? "Booking cancelled." : "Failed to cancel booking.";
                break;
            default:
                message = "Invalid action.";
        }

        request.getSession().setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/bookings/");
    }
}
