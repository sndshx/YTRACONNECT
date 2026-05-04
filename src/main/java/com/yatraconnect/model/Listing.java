package com.yatraconnect.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Listing {
    private String id;
    private String agentId;
    private String title;
    private String description;
    private String type; // 'hotel', 'trekking', 'travel'
    private BigDecimal price;
    private String offers;
    private int duration;
    private String images; // JSON string
    private int totalRooms;
    private int acRooms;
    private int nonAcRooms;
    private int familyRooms;
    private int coupleRooms;
    private boolean isActive;
    private String companyName;
    private String amenities; // JSON string
    private String itinerary; // JSON string
    private String hotelCategory; // 'hotel', 'homestay'
    private BigDecimal acPrice;
    private BigDecimal nonAcPrice;
    private BigDecimal familyPrice;
    private BigDecimal couplePrice;
    private String difficulty; // 'easy', 'moderate', 'hard', 'extreme'
    private String bestSeasons; // JSON string
    private String location;
    private Integer maxGroupSize;
    private Integer minAge;
    private String tags; // JSON string
    private float avgRating;
    private int reviewCount;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Listing() {}

    public Listing(String agentId, String title, String description, String type, BigDecimal price) {
        this.agentId = agentId;
        this.title = title;
        this.description = description;
        this.type = type;
        this.price = price;
        this.isActive = true;
        this.avgRating = 0.0f;
        this.reviewCount = 0;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getAgentId() { return agentId; }
    public void setAgentId(String agentId) { this.agentId = agentId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public String getOffers() { return offers; }
    public void setOffers(String offers) { this.offers = offers; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getImages() { return images; }
    public void setImages(String images) { this.images = images; }

    public int getTotalRooms() { return totalRooms; }
    public void setTotalRooms(int totalRooms) { this.totalRooms = totalRooms; }

    public int getAcRooms() { return acRooms; }
    public void setAcRooms(int acRooms) { this.acRooms = acRooms; }

    public int getNonAcRooms() { return nonAcRooms; }
    public void setNonAcRooms(int nonAcRooms) { this.nonAcRooms = nonAcRooms; }

    public int getFamilyRooms() { return familyRooms; }
    public void setFamilyRooms(int familyRooms) { this.familyRooms = familyRooms; }

    public int getCoupleRooms() { return coupleRooms; }
    public void setCoupleRooms(int coupleRooms) { this.coupleRooms = coupleRooms; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getAmenities() { return amenities; }
    public void setAmenities(String amenities) { this.amenities = amenities; }

    public String getItinerary() { return itinerary; }
    public void setItinerary(String itinerary) { this.itinerary = itinerary; }

    public String getHotelCategory() { return hotelCategory; }
    public void setHotelCategory(String hotelCategory) { this.hotelCategory = hotelCategory; }

    public BigDecimal getAcPrice() { return acPrice; }
    public void setAcPrice(BigDecimal acPrice) { this.acPrice = acPrice; }

    public BigDecimal getNonAcPrice() { return nonAcPrice; }
    public void setNonAcPrice(BigDecimal nonAcPrice) { this.nonAcPrice = nonAcPrice; }

    public BigDecimal getFamilyPrice() { return familyPrice; }
    public void setFamilyPrice(BigDecimal familyPrice) { this.familyPrice = familyPrice; }

    public BigDecimal getCouplePrice() { return couplePrice; }
    public void setCouplePrice(BigDecimal couplePrice) { this.couplePrice = couplePrice; }

    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }

    public String getBestSeasons() { return bestSeasons; }
    public void setBestSeasons(String bestSeasons) { this.bestSeasons = bestSeasons; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public Integer getMaxGroupSize() { return maxGroupSize; }
    public void setMaxGroupSize(Integer maxGroupSize) { this.maxGroupSize = maxGroupSize; }

    public Integer getMinAge() { return minAge; }
    public void setMinAge(Integer minAge) { this.minAge = minAge; }

    public String getTags() { return tags; }
    public void setTags(String tags) { this.tags = tags; }

    public float getAvgRating() { return avgRating; }
    public void setAvgRating(float avgRating) { this.avgRating = avgRating; }

    public int getReviewCount() { return reviewCount; }
    public void setReviewCount(int reviewCount) { this.reviewCount = reviewCount; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}