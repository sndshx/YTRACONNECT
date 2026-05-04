package com.yatraconnect.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
    private String id;
    private String listingId;
    private String agentId;
    private String travellerId;
    private String guestName;
    private String guestEmail;
    private String guestPhone;
    private String bookingType;
    private Date startDate;
    private Date endDate;
    private int roomCount;
    private String roomType;
    private String roomSelection; // JSON string
    private String guideName;
    private BigDecimal totalAmount;
    private BigDecimal advanceAmount;
    private String paymentStatus;
    private String idType;
    private String idNumber;
    private String otherIdType;
    private String serialId;
    private String status;
    private String notes;
    private String companyName;
    private String createdBy; // 'agent' or 'traveller'
    private String tripStatus; // 'pending', 'active', 'completed'
    private String checklist; // JSON string
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Booking() {}

    public Booking(String listingId, String agentId, String travellerId, String guestName, String guestEmail, String bookingType, Date startDate, BigDecimal totalAmount) {
        this.listingId = listingId;
        this.agentId = agentId;
        this.travellerId = travellerId;
        this.guestName = guestName;
        this.guestEmail = guestEmail;
        this.bookingType = bookingType;
        this.startDate = startDate;
        this.totalAmount = totalAmount;
        this.paymentStatus = "pending";
        this.status = "confirmed";
        this.createdBy = "traveller";
        this.tripStatus = "pending";
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getListingId() { return listingId; }
    public void setListingId(String listingId) { this.listingId = listingId; }

    public String getAgentId() { return agentId; }
    public void setAgentId(String agentId) { this.agentId = agentId; }

    public String getTravellerId() { return travellerId; }
    public void setTravellerId(String travellerId) { this.travellerId = travellerId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getGuestEmail() { return guestEmail; }
    public void setGuestEmail(String guestEmail) { this.guestEmail = guestEmail; }

    public String getGuestPhone() { return guestPhone; }
    public void setGuestPhone(String guestPhone) { this.guestPhone = guestPhone; }

    public String getBookingType() { return bookingType; }
    public void setBookingType(String bookingType) { this.bookingType = bookingType; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public int getRoomCount() { return roomCount; }
    public void setRoomCount(int roomCount) { this.roomCount = roomCount; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public String getRoomSelection() { return roomSelection; }
    public void setRoomSelection(String roomSelection) { this.roomSelection = roomSelection; }

    public String getGuideName() { return guideName; }
    public void setGuideName(String guideName) { this.guideName = guideName; }

    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }

    public BigDecimal getAdvanceAmount() { return advanceAmount; }
    public void setAdvanceAmount(BigDecimal advanceAmount) { this.advanceAmount = advanceAmount; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getIdType() { return idType; }
    public void setIdType(String idType) { this.idType = idType; }

    public String getIdNumber() { return idNumber; }
    public void setIdNumber(String idNumber) { this.idNumber = idNumber; }

    public String getOtherIdType() { return otherIdType; }
    public void setOtherIdType(String otherIdType) { this.otherIdType = otherIdType; }

    public String getSerialId() { return serialId; }
    public void setSerialId(String serialId) { this.serialId = serialId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    public String getTripStatus() { return tripStatus; }
    public void setTripStatus(String tripStatus) { this.tripStatus = tripStatus; }

    public String getChecklist() { return checklist; }
    public void setChecklist(String checklist) { this.checklist = checklist; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}