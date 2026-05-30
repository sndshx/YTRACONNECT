package com.yatraconnect.controller;

import com.yatraconnect.dao.AdminDAO;
import com.yatraconnect.dao.AgentDAO;
import com.yatraconnect.dao.TravellerDAO;
import com.yatraconnect.model.Admin;
import com.yatraconnect.model.HamroAgent;
import com.yatraconnect.model.HamroTraveller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@WebServlet("/uploadProfileImage")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1 MB
    maxFileSize = 1024 * 1024 * 5,       // 5 MB
    maxRequestSize = 1024 * 1024 * 10    // 10 MB
)
public class ProfileImageUploadServlet extends HttpServlet {
    private AdminDAO adminDAO;
    private AgentDAO agentDAO;
    private TravellerDAO travellerDAO;
    private static final String UPLOAD_DIR = "uploads/profiles";

    @Override
    public void init() throws ServletException {
        super.init();
        adminDAO = new AdminDAO();
        agentDAO = new AgentDAO();
        travellerDAO = new TravellerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String role = (String) session.getAttribute("role");
        Object user = session.getAttribute("user");
        String userId = null;
        String redirectUrl = request.getContextPath();

        if ("admin".equals(role)) {
            userId = ((Admin) user).getId();
            redirectUrl += "/admin/profile"; // assuming admin has a profile page
        } else if ("agent".equals(role)) {
            userId = ((HamroAgent) user).getId();
            redirectUrl += "/agency/profile";
        } else if ("traveller".equals(role)) {
            userId = ((HamroTraveller) user).getId();
            redirectUrl += "/traveller/profile.jsp";
        }

        if (userId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID not found.");
            return;
        }

        try {
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = UUID.randomUUID() + "_" + getFileName(filePart);

                // Create upload directory
                String appPath = request.getServletContext().getRealPath("");
                String uploadPath = appPath + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Save file
                Path filePath = Paths.get(uploadPath, fileName);
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
                }
                
                String imageUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;

                // Update database & session
                boolean success = false;
                if ("admin".equals(role)) {
                    success = adminDAO.updateProfileImage(userId, imageUrl);
                    if (success) {
                        ((Admin) user).setProfileImage(imageUrl);
                    }
                } else if ("agent".equals(role)) {
                    success = agentDAO.updateProfileImage(userId, imageUrl);
                    if (success) {
                        ((HamroAgent) user).setProfileImage(imageUrl);
                    }
                } else if ("traveller".equals(role)) {
                    success = travellerDAO.updateProfileImage(userId, imageUrl);
                    if (success) {
                        ((HamroTraveller) user).setProfileImage(imageUrl);
                    }
                }

                if (success) {
                    session.setAttribute("successMessage", "Profile image updated successfully!");
                } else {
                    session.setAttribute("errorMessage", "Failed to update profile image in database.");
                }
            } else {
                session.setAttribute("errorMessage", "No image file was provided.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "An error occurred while uploading the image.");
        }

        response.sendRedirect(redirectUrl);
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "unknown";
    }
}
