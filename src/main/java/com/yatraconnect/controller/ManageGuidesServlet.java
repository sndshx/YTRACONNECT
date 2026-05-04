package com.yatraconnect.controller;

import com.yatraconnect.dao.GuideDAO;
import com.yatraconnect.model.Guide;
import com.yatraconnect.model.HamroAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/agency/guides")
public class ManageGuidesServlet extends HttpServlet {
    private GuideDAO guideDAO;

    @Override
    public void init() throws ServletException {
        guideDAO = new GuideDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Guide> guides = guideDAO.getGuidesByAgent(agent.getId());
        request.setAttribute("guides", guides);
        request.getRequestDispatcher("/agency/manage-guides.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HamroAgent agent = (session != null) ? (HamroAgent) session.getAttribute("user") : null;

        if (agent == null || !"agent".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            try {
                Guide guide = new Guide();
                guide.setFullName(request.getParameter("fullName"));
                guide.setEmail(request.getParameter("email"));
                guide.setPhoneNo(request.getParameter("phoneNo"));
                guide.setExperienceYears(Integer.parseInt(request.getParameter("experienceYears")));
                guide.setAgentId(agent.getId());
                guide.setCompanyName(agent.getCompanyName());
                
                String expiryStr = request.getParameter("certificateExpiry");
                Date expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(expiryStr);
                guide.setCertificateExpiry(expiryDate);
                
                // Placeholder images
                guide.setProfileImage("https://ui-avatars.com/api/?name=" + guide.getFullName().replace(" ", "+"));
                guide.setCertificateImage("https://via.placeholder.com/400x600?text=License+Certificate");

                if (guideDAO.addGuide(guide)) {
                    request.getSession().setAttribute("successMessage", "Guide added successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to add guide.");
                }
            } catch (Exception e) {
                request.getSession().setAttribute("errorMessage", "Error: " + e.getMessage());
            }
        } else if ("delete".equals(action)) {
            String guideId = request.getParameter("guideId");
            if (guideDAO.deleteGuide(guideId, agent.getId())) {
                request.getSession().setAttribute("successMessage", "Guide removed successfully.");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to remove guide.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/agency/guides");
    }
}
