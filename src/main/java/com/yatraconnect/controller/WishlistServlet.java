package com.yatraconnect.controller;

import com.yatraconnect.dao.WishlistDAO;
import com.yatraconnect.model.HamroTraveller;
import com.yatraconnect.model.Listing;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {
    private WishlistDAO wishlistDAO;

    @Override
    public void init() throws ServletException {
        wishlistDAO = new WishlistDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HamroTraveller user = (HamroTraveller) request.getSession().getAttribute("user");
        if (user == null || !"traveller".equals(request.getSession().getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Listing> wishlists = wishlistDAO.getWishlistsByTraveller(user.getId());
        request.setAttribute("wishlists", wishlists);
        request.getRequestDispatcher("/traveller/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HamroTraveller user = (HamroTraveller) request.getSession().getAttribute("user");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"success\": false, \"message\": \"Unauthorized\"}");
            return;
        }

        String action = request.getParameter("action");
        String listingId = request.getParameter("listingId");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if ("toggle".equals(action) && listingId != null) {
            boolean isWishlisted = wishlistDAO.isWishlisted(user.getId(), listingId);
            if (isWishlisted) {
                wishlistDAO.removeWishlist(user.getId(), listingId);
                response.getWriter().write("{\"success\": true, \"status\": \"removed\"}");
            } else {
                wishlistDAO.addWishlist(user.getId(), listingId);
                response.getWriter().write("{\"success\": true, \"status\": \"added\"}");
            }
        } else if ("check".equals(action) && listingId != null) {
            boolean isWishlisted = wishlistDAO.isWishlisted(user.getId(), listingId);
            response.getWriter().write("{\"success\": true, \"isWishlisted\": " + isWishlisted + "}");
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid request\"}");
        }
    }
}
