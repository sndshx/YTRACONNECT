package com.yatraconnect.model;

import java.sql.Timestamp;
import java.util.Date;

public class Guide {
    private String id;
    private String fullName;
    private String email;
    private String phoneNo;
    private int experienceYears;
    private String profileImage;
    private String certificateImage;
    private Date certificateExpiry;
    private String agentId;
    private String companyName;
    private Date lastAlertSent;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNo() { return phoneNo; }
    public void setPhoneNo(String phoneNo) { this.phoneNo = phoneNo; }

    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }

    public String getProfileImage() { return profileImage; }
    public void setProfileImage(String profileImage) { this.profileImage = profileImage; }

    public String getCertificateImage() { return certificateImage; }
    public void setCertificateImage(String certificateImage) { this.certificateImage = certificateImage; }

    public Date getCertificateExpiry() { return certificateExpiry; }
    public void setCertificateExpiry(Date certificateExpiry) { this.certificateExpiry = certificateExpiry; }

    public String getAgentId() { return agentId; }
    public void setAgentId(String agentId) { this.agentId = agentId; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public Date getLastAlertSent() { return lastAlertSent; }
    public void setLastAlertSent(Date lastAlertSent) { this.lastAlertSent = lastAlertSent; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}
