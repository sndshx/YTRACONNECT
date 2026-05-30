package com.yatraconnect.controller;

import com.yatraconnect.dao.BookingDAO;
import com.yatraconnect.dao.ListingDAO;
import com.yatraconnect.model.Booking;
import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.model.Listing;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/agency/dashboard")
public class AgencyDashboardServlet extends HttpServlet {
    private BookingDAO bookingDAO;
    private ListingDAO listingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        bookingDAO = new BookingDAO();
        listingDAO = new ListingDAO();
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
        String agentId = agent.getId();

        // Load agency dashboard data
        List<Listing> listings = listingDAO.getListingsByAgentId(agentId);
        List<Booking> bookings = bookingDAO.getBookingsByAgentId(agentId);
        for (Booking booking : bookings) {
            System.out.println(booking.getGuestEmail());
        }
        System.out.println("Agency dashboard : " + bookings);

        // Calculate stats
        long totalListings = listings.size();
        long pendingBookings = bookings.stream()
                .filter(b -> "confirmed".equals(b.getStatus()) && "pending".equals(b.getTripStatus()))
                .count();
        long activeBookings = bookings.stream()
                .filter(b -> "confirmed".equals(b.getStatus()))
                .count();
        double totalRevenue = bookings.stream()
                .filter(b -> b.getTotalAmount() != null && !"cancelled".equals(b.getStatus()))
                .mapToDouble(b -> b.getTotalAmount().doubleValue())
                .sum();

        request.setAttribute("listings", listings);
        request.setAttribute("bookings", bookings);
        request.setAttribute("totalListings", totalListings);
        request.setAttribute("pendingBookings", pendingBookings);
        request.setAttribute("activeBookings", activeBookings);
        request.setAttribute("totalRevenue", totalRevenue);

        request.getRequestDispatcher("/agency/dashboard.jsp").forward(request, response);
    }
}
