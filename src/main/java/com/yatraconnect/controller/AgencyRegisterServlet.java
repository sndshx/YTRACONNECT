package com.yatraconnect.controller;

import com.yatraconnect.dao.AgentDAO;
import com.yatraconnect.model.HamroAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@WebServlet("/agency/register")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class AgencyRegisterServlet extends HttpServlet {
    private AgentDAO agentDAO;
    private static final String UPLOAD_DIR = "uploads/licenses";

    @Override
    public void init() throws ServletException {
        super.init();
        agentDAO = new AgentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/agency/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String companyName = request.getParameter("companyName");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");
        String location = request.getParameter("location");

        // Validation
        if (password == null || !password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/agency/register.jsp").forward(request, response);
            return;
        }

        if (agentDAO.isEmailExists(email)) {
            request.setAttribute("errorMessage", "Email is already registered.");
            request.getRequestDispatcher("/agency/register.jsp").forward(request, response);
            return;
        }

        try {
            // Handle license file upload
            String licenseFilePath = null;
            Part filePart = request.getPart("licenseFile");
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
                licenseFilePath = UPLOAD_DIR + "/" + fileName;
            }

            // Create agent object
            HamroAgent agent = new HamroAgent(fullName, email, password, companyName);
            agent.setPhoneNo(phone);
            agent.setLocation(location);
            if (licenseFilePath != null) {
                agent.setPanImage(licenseFilePath); // Using panImage field for license
            }

            boolean success = agentDAO.registerAgent(agent);

            if (success) {
                request.setAttribute("successMessage",
                    "Registration successful! Your agency is pending admin approval. You will be notified once verified.");
                request.getRequestDispatcher("/agency/login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("/agency/register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An internal error occurred. Please try again.");
            request.getRequestDispatcher("/agency/register.jsp").forward(request, response);
        }
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
