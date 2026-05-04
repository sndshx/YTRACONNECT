package com.yatraconnect.model;

import java.sql.Timestamp;

public class Review {
    private String id;
    private String listingId;
    private String travellerId;
    private String customerName;
    private int rating;
    private String message;
    private String serviceType;
    private String status;
    private String companyName;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Review() {}

    public Review(String listingId, String travellerId, String customerName, int rating, String message) {
        this.listingId = listingId;
        this.travellerId = travellerId;
        this.customerName = customerName;
        this.rating = rating;
        this.message = message;
        this.status = "pending";
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getListingId() { return listingId; }
    public void setListingId(String listingId) { this.listingId = listingId; }

    public String getTravellerId() { return travellerId; }
    public void setTravellerId(String travellerId) { this.travellerId = travellerId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getServiceType() { return serviceType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}