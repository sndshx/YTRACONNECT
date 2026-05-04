package com.yatraconnect.controller;

import com.yatraconnect.dao.PromotionDAO;
import com.yatraconnect.model.Promotion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/promotions", "/admin/promotions/*"})
public class PromotionServlet extends HttpServlet {
    private PromotionDAO promotionDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        promotionDAO = new PromotionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String filter = request.getParameter("filter");
        List<Promotion> promotions;
        if (filter != null && !filter.isEmpty()) {
            promotions = promotionDAO.getPromotionsByStatus(filter);
        } else {
            promotions = promotionDAO.getAllPromotions();
        }

        request.setAttribute("promotions", promotions);
        request.getRequestDispatcher("/admin/promotion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String promoId = request.getParameter("promotionId");
        boolean success = false;
        String message = "";

        switch (action) {
            case "approve":
                success = promotionDAO.updatePromotionStatus(promoId, "approved");
                message = success ? "Promotion approved." : "Failed to approve.";
                break;
            case "reject":
                success = promotionDAO.updatePromotionStatus(promoId, "rejected");
                message = success ? "Promotion rejected." : "Failed to reject.";
                break;
            case "updateDuration":
                String start = request.getParameter("startDate");
                String end = request.getParameter("endDate");
                success = promotionDAO.updatePromotionDuration(promoId,
                    java.sql.Date.valueOf(start), java.sql.Date.valueOf(end));
                message = success ? "Duration updated." : "Failed to update.";
                break;
            case "delete":
                success = promotionDAO.deletePromotion(promoId);
                message = success ? "Promotion deleted." : "Failed to delete.";
                break;
            default:
                message = "Invalid action.";
        }

        session.setAttribute(success ? "successMessage" : "errorMessage", message);
        response.sendRedirect(request.getContextPath() + "/admin/promotions/");
    }
}
