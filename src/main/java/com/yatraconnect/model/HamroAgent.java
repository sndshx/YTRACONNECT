package com.yatraconnect.model;

import java.sql.Timestamp;

public class HamroAgent {
    private String id;
    private String fullName;
    private String email;
    private String password;
    private String location;
    private String phoneNo;
    private String companyName;
    private String bio;
    private String profileImage;
    private String coverImage;
    private String website;
    private String socialLinks; // JSON string
    private boolean verified;
    private String role;
    private String panNumber;
    private String legalCompanyName;
    private String companyOwner;
    private String ownerContactNo;
    private String panImage;
    private String citizenshipImage;
    private String serviceTypes; // JSON string
    private String citizenshipNumber;
    private String citizenshipDistrict;
    private String citizenshipIssueDate;
    private String gender;
    private String verificationStatus;
    private String parentAgentId;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public HamroAgent() {}

    public HamroAgent(String fullName, String email, String password, String companyName) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.companyName = companyName;
        this.role = "agent";
        this.verificationStatus = "pending";
        this.verified = false;
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

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getPhoneNo() { return phoneNo; }
    public void setPhoneNo(String phoneNo) { this.phoneNo = phoneNo; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }

    public String getProfileImage() { return profileImage; }
    public void setProfileImage(String profileImage) { this.profileImage = profileImage; }

    public String getCoverImage() { return coverImage; }
    public void setCoverImage(String coverImage) { this.coverImage = coverImage; }

    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }

    public String getSocialLinks() { return socialLinks; }
    public void setSocialLinks(String socialLinks) { this.socialLinks = socialLinks; }

    public boolean isVerified() { return verified; }
    public void setVerified(boolean verified) { this.verified = verified; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getPanNumber() { return panNumber; }
    public void setPanNumber(String panNumber) { this.panNumber = panNumber; }

    public String getLegalCompanyName() { return legalCompanyName; }
    public void setLegalCompanyName(String legalCompanyName) { this.legalCompanyName = legalCompanyName; }

    public String getCompanyOwner() { return companyOwner; }
    public void setCompanyOwner(String companyOwner) { this.companyOwner = companyOwner; }

    public String getOwnerContactNo() { return ownerContactNo; }
    public void setOwnerContactNo(String ownerContactNo) { this.ownerContactNo = ownerContactNo; }

    public String getPanImage() { return panImage; }
    public void setPanImage(String panImage) { this.panImage = panImage; }

    public String getCitizenshipImage() { return citizenshipImage; }
    public void setCitizenshipImage(String citizenshipImage) { this.citizenshipImage = citizenshipImage; }

    public String getServiceTypes() { return serviceTypes; }
    public void setServiceTypes(String serviceTypes) { this.serviceTypes = serviceTypes; }

    public String getCitizenshipNumber() { return citizenshipNumber; }
    public void setCitizenshipNumber(String citizenshipNumber) { this.citizenshipNumber = citizenshipNumber; }

    public String getCitizenshipDistrict() { return citizenshipDistrict; }
    public void setCitizenshipDistrict(String citizenshipDistrict) { this.citizenshipDistrict = citizenshipDistrict; }

    public String getCitizenshipIssueDate() { return citizenshipIssueDate; }
    public void setCitizenshipIssueDate(String citizenshipIssueDate) { this.citizenshipIssueDate = citizenshipIssueDate; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getVerificationStatus() { return verificationStatus; }
    public void setVerificationStatus(String verificationStatus) { this.verificationStatus = verificationStatus; }

    public String getParentAgentId() { return parentAgentId; }
    public void setParentAgentId(String parentAgentId) { this.parentAgentId = parentAgentId; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}