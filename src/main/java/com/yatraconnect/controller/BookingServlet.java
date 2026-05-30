package com.yatraconnect.controller;

import com.google.gson.Gson;
import com.yatraconnect.dao.BookingDAO;
import com.yatraconnect.model.Booking;
import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.model.HamroTraveller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@WebServlet("/api/bookings/*")
@jakarta.servlet.annotation.MultipartConfig
public class BookingServlet extends HttpServlet {
    private BookingDAO bookingDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        bookingDAO = new BookingDAO();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String pathInfo = request.getPathInfo();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Object user = session.getAttribute("user");
            String role = (String) session.getAttribute("role");

            if (pathInfo == null || pathInfo.equals("/")) {
                // Get bookings based on user role
                List<Booking> bookings;
                if ("agent".equals(role)) {
                    HamroAgent agent = (HamroAgent) user;
                    bookings = bookingDAO.getBookingsByAgentId(agent.getId());
                } else {
                    HamroTraveller traveller = (HamroTraveller) user;
                    bookings = bookingDAO.getBookingsByTravellerId(traveller.getId());
                }
                out.print(gson.toJson(bookings));
            } else {
                // Get specific booking by ID
                String bookingId = pathInfo.substring(1); // Remove leading "/"
                Booking booking = bookingDAO.getBookingById(bookingId);

                if (booking != null) {
                    // Check if user has permission to view this booking
                    boolean hasPermission = false;
                    if ("agent".equals(role)) {
                        HamroAgent agent = (HamroAgent) user;
                        hasPermission = booking.getAgentId().equals(agent.getId());
                    } else {
                        HamroTraveller traveller = (HamroTraveller) user;
                        hasPermission = booking.getTravellerId().equals(traveller.getId());
                    }

                    if (hasPermission) {
                        out.print(gson.toJson(booking));
                    } else {
                        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                        out.print("{\"error\": \"You don't have permission to view this booking\"}");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    out.print("{\"error\": \"Booking not found\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        Object userObj = session.getAttribute("user");
        String role = (String) session.getAttribute("role");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (!"traveller".equals(role)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            out.print("{\"error\": \"Only travellers can create bookings\"}");
            return;
        }
        HamroTraveller traveller = (HamroTraveller) userObj;

        try {
            String listingId = request.getParameter("listingId");
            String agentId = request.getParameter("agentId");
            String guestName = request.getParameter("guestName");
            String guestEmail = request.getParameter("guestEmail");
            String bookingType = request.getParameter("bookingType");
            String startDateStr = request.getParameter("startDate");
            String totalAmountStr = request.getParameter("totalAmount");

            if (listingId == null || agentId == null || guestName == null ||
                guestEmail == null || bookingType == null || startDateStr == null || totalAmountStr == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Missing required fields: listingId, agentId, guestName, guestEmail, bookingType, startDate, totalAmount\"}");
                return;
            }

            Date startDate = Date.valueOf(startDateStr);
            BigDecimal totalAmount = new BigDecimal(totalAmountStr);

            Booking booking = new Booking(listingId, agentId, traveller.getId(),
                                        guestName, guestEmail, bookingType, startDate, totalAmount);

            // New required verification fields
            String idType = request.getParameter("idType");
            String idNumber = request.getParameter("idNumber");
            
            if (idType != null) booking.setIdType(idType);
            if (idNumber != null) booking.setIdNumber(idNumber);

            // Optional fields
            String guestPhone = request.getParameter("guestPhone");
            String endDateStr = request.getParameter("endDate");
            String roomCountStr = request.getParameter("roomCount");
            String roomType = request.getParameter("roomType");
            String notes = request.getParameter("notes");

            if (guestPhone != null) booking.setGuestPhone(guestPhone);
            if (endDateStr != null && !endDateStr.trim().isEmpty()) {
                try {
                    booking.setEndDate(Date.valueOf(endDateStr));
                } catch (IllegalArgumentException e) {
                    // Ignore invalid date format
                }
            }
            if (roomCountStr != null && !roomCountStr.trim().isEmpty()) {
                try {
                    booking.setRoomCount(Integer.parseInt(roomCountStr));
                } catch (NumberFormatException e) {
                    // Ignore
                }
            }
            if (roomType != null) booking.setRoomType(roomType);
            if (notes != null) booking.setNotes(notes);

            boolean success = bookingDAO.createBooking(booking);

            if (success) {
                out.print("{\"success\": true, \"message\": \"Booking created successfully\", \"id\": \"" + booking.getId() + "\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Failed to create booking\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String bookingId = pathInfo.substring(1); // Remove leading "/"
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Booking existingBooking = bookingDAO.getBookingById(bookingId);
            if (existingBooking == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\": \"Booking not found\"}");
                return;
            }

            Object user = session.getAttribute("user");
            String role = (String) session.getAttribute("role");

            // Check permissions
            boolean hasPermission = false;
            if ("agent".equals(role)) {
                HamroAgent agent = (HamroAgent) user;
                hasPermission = existingBooking.getAgentId().equals(agent.getId());
            } else {
                HamroTraveller traveller = (HamroTraveller) user;
                hasPermission = existingBooking.getTravellerId().equals(traveller.getId());
            }

            if (!hasPermission) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\": \"You don't have permission to update this booking\"}");
                return;
            }

            String action = request.getParameter("action");

            if ("update_status".equals(action)) {
                String newStatus = request.getParameter("status");
                if (newStatus != null) {
                    boolean success = bookingDAO.updateBookingStatus(bookingId, newStatus);
                    if (success) {
                        out.print("{\"success\": true, \"message\": \"Booking status updated successfully\"}");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        out.print("{\"error\": \"Failed to update booking status\"}");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print("{\"error\": \"Status parameter is required\"}");
                }
            } else if ("update_trip_status".equals(action)) {
                String tripStatus = request.getParameter("tripStatus");
                if (tripStatus != null) {
                    boolean success = bookingDAO.updateTripStatus(bookingId, tripStatus);
                    if (success) {
                        out.print("{\"success\": true, \"message\": \"Trip status updated successfully\"}");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        out.print("{\"error\": \"Failed to update trip status\"}");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print("{\"error\": \"Trip status parameter is required\"}");
                }
            } else if ("update_payment".equals(action)) {
                String paymentStatus = request.getParameter("paymentStatus");
                String advanceAmountStr = request.getParameter("advanceAmount");
                if (paymentStatus != null && advanceAmountStr != null) {
                    BigDecimal advanceAmount = new BigDecimal(advanceAmountStr);
                    boolean success = bookingDAO.updatePaymentStatus(bookingId, paymentStatus, advanceAmount);
                    if (success) {
                        out.print("{\"success\": true, \"message\": \"Payment status updated successfully\"}");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        out.print("{\"error\": \"Failed to update payment status\"}");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print("{\"error\": \"Payment status and advance amount parameters are required\"}");
                }
            } else {
                // General booking update
                String guestName = request.getParameter("guestName");
                String guestEmail = request.getParameter("guestEmail");
                String notes = request.getParameter("notes");

                if (guestName != null) existingBooking.setGuestName(guestName);
                if (guestEmail != null) existingBooking.setGuestEmail(guestEmail);
                if (notes != null) existingBooking.setNotes(notes);

                boolean success = bookingDAO.updateBooking(existingBooking);
                if (success) {
                    out.print("{\"success\": true, \"message\": \"Booking updated successfully\"}");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print("{\"error\": \"Failed to update booking\"}");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal server error\"}");
        }
    }
}