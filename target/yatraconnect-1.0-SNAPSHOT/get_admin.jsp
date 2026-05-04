<%@ page contentType="text/plain;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.util.DBConnection" %>
<%@ page import="java.sql.*" %>
<%
    try (Connection conn = DBConnection.getConnection();
         Statement stmt = conn.createStatement()) {
        
        ResultSet rs = stmt.executeQuery("SELECT email, password, role FROM HamroTravellers WHERE role = 'admin'");
        while (rs.next()) {
            out.println("Email: " + rs.getString("email"));
            out.println("Hash: " + rs.getString("password"));
            out.println("Role: " + rs.getString("role"));
            out.println("---");
        }
        
        out.println("Agents:");
        ResultSet rs2 = stmt.executeQuery("SELECT email, password, role FROM HamroAgents WHERE email LIKE '%admin%'");
        while (rs2.next()) {
            out.println("Agent Email: " + rs2.getString("email"));
            out.println("Agent Hash: " + rs2.getString("password"));
            out.println("Agent Role: " + rs2.getString("role"));
        }
        
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
