package com.yatraconnect.model;

import java.sql.Timestamp;

public class HamroTraveller {
    private String id;
    private String fullName;
    private String email;
    private String password;
    private String contactNumber;
    private String role;
    private String bookmarks;
    private String savedItineraries;
    private String googleId;
    private String authProvider;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public HamroTraveller() {}

    public HamroTraveller(String id, String fullName, String email, String password, String contactNumber, String role) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.contactNumber = contactNumber;
        this.role = role;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getBookmarks() { return bookmarks; }
    public void setBookmarks(String bookmarks) { this.bookmarks = bookmarks; }

    public String getSavedItineraries() { return savedItineraries; }
    public void setSavedItineraries(String savedItineraries) { this.savedItineraries = savedItineraries; }

    public String getGoogleId() { return googleId; }
    public void setGoogleId(String googleId) { this.googleId = googleId; }

    public String getAuthProvider() { return authProvider; }
    public void setAuthProvider(String authProvider) { this.authProvider = authProvider; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}
