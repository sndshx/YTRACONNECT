package com.yatraconnect.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Redirect servlet — forwards all /agency/packages traffic to the canonical
 * /agency/packages/ (with trailing slash) handled by AgencyPackageServlet.
 * This prevents the two-servlet conflict where attribute names differed.
 */
@WebServlet("/agency/packages")
public class AgencyPackagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/agency/packages/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward POST to the canonical servlet so action handling is consistent
        request.getRequestDispatcher("/agency/packages/").forward(request, response);
    }
}

