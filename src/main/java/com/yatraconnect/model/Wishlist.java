package com.yatraconnect.model;

import java.sql.Timestamp;

public class Wishlist {
    private String id;
    private String travellerId;
    private String listingId;
    private Timestamp createdAt;
    
    // Additional field for UI representation
    private Listing listing;

    public Wishlist() {}

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTravellerId() { return travellerId; }
    public void setTravellerId(String travellerId) { this.travellerId = travellerId; }

    public String getListingId() { return listingId; }
    public void setListingId(String listingId) { this.listingId = listingId; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Listing getListing() { return listing; }
    public void setListing(Listing listing) { this.listing = listing; }
}
