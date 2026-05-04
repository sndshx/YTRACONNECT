-- YatraConnect MySQL Database Schema (Converted from Prisma)

CREATE DATABASE IF NOT EXISTS yatra_connect;
USE yatra_connect;

-- Agents Table
CREATE TABLE IF NOT EXISTS HamroAgents (
    id VARCHAR(36) PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    phoneNo VARCHAR(50),
    companyName VARCHAR(255),
    bio TEXT,
    profileImage VARCHAR(500),
    coverImage VARCHAR(500),
    website VARCHAR(255),
    socialLinks JSON,
    verified BOOLEAN DEFAULT FALSE,
    role VARCHAR(50) DEFAULT 'agent',
    panNumber VARCHAR(100),
    legalCompanyName VARCHAR(255),
    companyOwner VARCHAR(255),
    ownerContactNo VARCHAR(50),
    panImage VARCHAR(500),
    citizenshipImage VARCHAR(500),
    serviceTypes JSON,
    citizenshipNumber VARCHAR(100),
    citizenshipDistrict VARCHAR(100),
    citizenshipIssueDate VARCHAR(100),
    gender VARCHAR(20),
    verificationStatus VARCHAR(50) DEFAULT 'pending',
    parentAgentId VARCHAR(36),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Travellers Table
CREATE TABLE IF NOT EXISTS HamroTravellers (
    id VARCHAR(36) PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255),
    contactNumber VARCHAR(50),
    role VARCHAR(50) DEFAULT 'traveller',
    bookmarks JSON,
    savedItineraries JSON,
    googleId VARCHAR(255),
    authProvider VARCHAR(50) DEFAULT 'local',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Listings Table
CREATE TABLE IF NOT EXISTS Listings (
    id VARCHAR(36) PRIMARY KEY,
    agentId VARCHAR(36) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    type ENUM('hotel', 'trekking', 'travel') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    offers TEXT,
    duration INT DEFAULT 1,
    images JSON,
    totalRooms INT DEFAULT 0,
    acRooms INT DEFAULT 0,
    nonAcRooms INT DEFAULT 0,
    familyRooms INT DEFAULT 0,
    coupleRooms INT DEFAULT 0,
    isActive BOOLEAN DEFAULT TRUE,
    companyName VARCHAR(255),
    amenities JSON,
    itinerary JSON,
    hotelCategory ENUM('hotel', 'homestay') DEFAULT 'hotel',
    acPrice DECIMAL(10, 2) DEFAULT 0,
    nonAcPrice DECIMAL(10, 2) DEFAULT 0,
    familyPrice DECIMAL(10, 2) DEFAULT 0,
    couplePrice DECIMAL(10, 2) DEFAULT 0,
    difficulty ENUM('easy', 'moderate', 'hard', 'extreme'),
    bestSeasons JSON,
    location VARCHAR(255),
    maxGroupSize INT,
    minAge INT DEFAULT 0,
    tags JSON,
    avgRating FLOAT DEFAULT 0,
    reviewCount INT DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (agentId) REFERENCES HamroAgents(id) ON DELETE CASCADE
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    id VARCHAR(36) PRIMARY KEY,
    listingId VARCHAR(36),
    agentId VARCHAR(36),
    travellerId VARCHAR(36),
    guestName VARCHAR(255) NOT NULL,
    guestEmail VARCHAR(255),
    guestPhone VARCHAR(50),
    bookingType VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    roomCount INT DEFAULT 1,
    roomType VARCHAR(100),
    roomSelection JSON,
    guideName VARCHAR(255),
    totalAmount DECIMAL(10, 2) DEFAULT 0,
    advanceAmount DECIMAL(10, 2) DEFAULT 0,
    paymentStatus VARCHAR(50) DEFAULT 'pending',
    idType VARCHAR(50),
    idNumber VARCHAR(100),
    otherIdType VARCHAR(100),
    serialId VARCHAR(100),
    status VARCHAR(50) DEFAULT 'confirmed',
    notes TEXT,
    companyName VARCHAR(255),
    createdBy ENUM('agent', 'traveller') DEFAULT 'agent',
    tripStatus ENUM('pending', 'active', 'completed') DEFAULT 'pending',
    checklist JSON,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (listingId) REFERENCES Listings(id) ON DELETE SET NULL,
    FOREIGN KEY (agentId) REFERENCES HamroAgents(id) ON DELETE SET NULL,
    FOREIGN KEY (travellerId) REFERENCES HamroTravellers(id) ON DELETE SET NULL
);

-- Reviews Table
CREATE TABLE IF NOT EXISTS Reviews (
    id VARCHAR(36) PRIMARY KEY,
    listingId VARCHAR(36) NOT NULL,
    travellerId VARCHAR(36),
    customerName VARCHAR(255) NOT NULL,
    rating INT NOT NULL,
    message TEXT NOT NULL,
    serviceType VARCHAR(100),
    status VARCHAR(50) DEFAULT 'pending',
    companyName VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (listingId) REFERENCES Listings(id) ON DELETE CASCADE,
    FOREIGN KEY (travellerId) REFERENCES HamroTravellers(id) ON DELETE SET NULL
);

-- Guides Table
CREATE TABLE IF NOT EXISTS Guides (
    id VARCHAR(36) PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phoneNo VARCHAR(50) NOT NULL,
    experienceYears INT NOT NULL,
    profileImage VARCHAR(500),
    certificateImage VARCHAR(500) NOT NULL,
    certificateExpiry DATE NOT NULL,
    agentId VARCHAR(36) NOT NULL,
    companyName VARCHAR(255) NOT NULL,
    lastAlertSent DATE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (agentId) REFERENCES HamroAgents(id) ON DELETE CASCADE
);

-- Messages Table
CREATE TABLE IF NOT EXISTS Messages (
    id VARCHAR(36) PRIMARY KEY,
    companyName VARCHAR(255) NOT NULL,
    travellerId VARCHAR(36),
    agentId VARCHAR(36),
    senderRole VARCHAR(50) DEFAULT 'traveller',
    customerName VARCHAR(255) NOT NULL,
    customerEmail VARCHAR(255) NOT NULL,
    subject VARCHAR(255),
    message TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'unread',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Notifications Table
CREATE TABLE IF NOT EXISTS Notifications (
    id VARCHAR(36) PRIMARY KEY,
    companyName VARCHAR(255),
    travellerId VARCHAR(36),
    agentId VARCHAR(36),
    type VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    isRead BOOLEAN DEFAULT FALSE,
    targetId VARCHAR(36),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (agentId) REFERENCES HamroAgents(id) ON DELETE CASCADE,
    FOREIGN KEY (travellerId) REFERENCES HamroTravellers(id) ON DELETE CASCADE
);

-- Activity Logs Table
CREATE TABLE IF NOT EXISTS ActivityLogs (
    id VARCHAR(36) PRIMARY KEY,
    agentId VARCHAR(36),
    agentName VARCHAR(255),
    travellerId VARCHAR(36),
    travellerName VARCHAR(255),
    companyName VARCHAR(255),
    action VARCHAR(100) NOT NULL,
    details TEXT NOT NULL,
    targetId VARCHAR(36),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Followers Table
CREATE TABLE IF NOT EXISTS Followers (
    id VARCHAR(36) PRIMARY KEY,
    agentId VARCHAR(36) NOT NULL,
    travellerId VARCHAR(36) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (agentId) REFERENCES HamroAgents(id) ON DELETE CASCADE,
    FOREIGN KEY (travellerId) REFERENCES HamroTravellers(id) ON DELETE CASCADE
);

-- User Preferences
CREATE TABLE IF NOT EXISTS UserPreferences (
    id VARCHAR(36) PRIMARY KEY,
    userId VARCHAR(36) UNIQUE NOT NULL,
    userRole VARCHAR(50) DEFAULT 'traveller',
    preferredTypes JSON,
    preferredDifficulties JSON,
    preferredTags JSON,
    preferredLocations JSON,
    avgSpend DECIMAL(10,2) DEFAULT 0,
    sampleSize INT DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========================================================
-- SAMPLE DATA POPULATION
-- ========================================================

-- 1. Create a Master Agent to own the listings
INSERT IGNORE INTO HamroAgents (id, fullName, email, password, companyName, verified, role, verificationStatus)
VALUES ('agent-master-001', 'Elite Himalayan Travels', 'admin@elitetravels.com', 'admin@123', 'Elite Himalayan Travels', TRUE, 'agent', 'verified');

-- 2. Insert listings
INSERT IGNORE INTO Listings (id, agentId, title, description, type, price, duration, images, location, difficulty, avgRating, reviewCount, tags, amenities)
VALUES 
-- TREKKING
(UUID(), 'agent-master-001', 'Everest Base Camp Trek', 'Experience the ultimate adventure to the roof of the world. A 14-day journey through Sherpa villages and icy glaciers.', 'trekking', 1450.00, 14, '["https://images.unsplash.com/photo-1544735745-b89b1da64bcc"]', 'Solu-Khumbu', 'hard', 4.9, 128, '["Adventure", "Everest"]', '["Guide", "Porter"]'),
(UUID(), 'agent-master-001', 'Annapurna Circuit Expedition', 'The classic trek around the Annapurna massif, crossing the Thorong La Pass at 5,416m.', 'trekking', 1100.00, 18, '["https://images.unsplash.com/photo-1585016495481-91613a3f58ea"]', 'Manang', 'hard', 4.8, 95, '["Circuit", "Landscape"]', '["Guide", "Permits"]'),
(UUID(), 'agent-master-001', 'Ghorepani Poon Hill Trek', 'A short, beautiful trek offering spectacular sunrise views of Dhaulagiri and Annapurna.', 'trekking', 450.00, 5, '["https://images.unsplash.com/photo-1544735745-b89b1da64bcc"]', 'Annapurna', 'easy', 4.7, 210, '["Sunrise", "Culture"]', '["Guide", "Lodge"]'),
(UUID(), 'agent-master-001', 'Mardi Himal Trek', 'Short and sweet trek with stunning views of Fishtail.', 'trekking', 500.00, 6, '["https://images.unsplash.com/photo-1544735745-b89b1da64bcc"]', 'Kaski', 'moderate', 4.8, 88, '["Scenic", "Short"]', '["Guide"]'),

-- HOTELS
(UUID(), 'agent-master-001', 'The Dwarika\'s Hotel', 'A living museum of Newari architecture and luxury. Experience royal Nepali hospitality.', 'hotel', 350.00, 1, '["https://images.unsplash.com/photo-1566073771259-6a8506099945"]', 'Kathmandu', NULL, 5.0, 450, '["Heritage", "Luxury"]', '["Spa", "Pool"]'),
(UUID(), 'agent-master-001', 'Kathmandu Marriott Hotel', 'Modern luxury in the heart of the capital with world-class amenities and dining.', 'hotel', 180.00, 1, '["https://images.unsplash.com/photo-1542314831-068cd1dbfeeb"]', 'Kathmandu', NULL, 4.8, 320, '["Modern", "Business"]', '["Gym", "Pool"]'),
(UUID(), 'agent-master-001', 'Meghauli Serai - Taj Safari', 'Exclusive jungle safari experience in Chitwan National Park.', 'hotel', 550.00, 1, '["https://images.unsplash.com/photo-1445019980597-93fa8acb246c"]', 'Chitwan', NULL, 4.9, 112, '["Safari", "Luxury"]', '["Jungle Walk"]'),
(UUID(), 'agent-master-001', 'Tiger Mountain Pokhara Lodge', 'Panoramic views of the Machhapuchhre range and Pokhara Valley.', 'hotel', 420.00, 1, '["https://images.unsplash.com/photo-1469796466635-455ede028ace"]', 'Pokhara', NULL, 4.9, 85, '["Mountain View"]', '["Pool"]'),

-- TRAVEL/TOURS
(UUID(), 'agent-master-001', 'Everest Base Camp Helicopter Tour', 'A luxury 4-hour flight to Kala Patthar for the best views of Mt. Everest.', 'travel', 950.00, 1, '["https://images.unsplash.com/photo-1533240332313-0db49b459ad6"]', 'Kathmandu', 'easy', 4.9, 310, '["Luxury", "Aerial"]', '["Champagne Breakfast"]'),
(UUID(), 'agent-master-001', 'Pokhara Tandem Paragliding', 'Soar like a bird over Phewa Lake.', 'travel', 85.00, 1, '["https://images.unsplash.com/photo-1596895111956-bf1cf0599ce5"]', 'Pokhara', 'easy', 4.8, 1200, '["Adventure", "Sky"]', '["GoPro Video"]'),
(UUID(), 'agent-master-001', 'Chitwan Jungle Safari (Full Day)', 'Jeep safari deep into the park to see One-horned Rhinos.', 'travel', 65.00, 1, '["https://images.unsplash.com/photo-1549366021-9f761d450615"]', 'Chitwan', 'easy', 4.5, 450, '["Wildlife", "Nature"]', '["Expert Guide"]');


USE yatra_connect;

-- Admins Table (separate from travellers for clean separation)
CREATE TABLE IF NOT EXISTS Admins (
    id VARCHAR(36) PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'admin',
    profileImage VARCHAR(500),
    lastLogin TIMESTAMP,
    isActive BOOLEAN DEFAULT TRUE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Promotions Table
CREATE TABLE IF NOT EXISTS Promotions (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    listingId VARCHAR(36),
    agentId VARCHAR(36),
    companyName VARCHAR(255),
    discountPercent DECIMAL(5,2) DEFAULT 0,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',  -- pending, approved, rejected, expired
    bannerImage VARCHAR(500),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (listingId) REFERENCES Listings(id) ON DELETE SET NULL,
    FOREIGN KEY (agentId) REFERENCES HamroAgents(id) ON DELETE SET NULL
);

-- Reports / Complaints Table
CREATE TABLE IF NOT EXISTS Reports (
    id VARCHAR(36) PRIMARY KEY,
    reporterType VARCHAR(50) NOT NULL, -- 'traveller', 'agent'
    reporterId VARCHAR(36) NOT NULL,
    reporterName VARCHAR(255),
    targetType VARCHAR(50) NOT NULL,   -- 'listing', 'review', 'agent', 'booking'
    targetId VARCHAR(36) NOT NULL,
    reason VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'open', -- open, investigating, resolved, dismissed
    adminNotes TEXT,
    resolvedBy VARCHAR(36),
    resolvedAt TIMESTAMP,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Add 'status' column to HamroTravellers for suspend functionality
ALTER TABLE HamroTravellers ADD COLUMN IF NOT EXISTS status VARCHAR(50) DEFAULT 'active';

-- =====================================================
-- SEED: Default Admin User
-- Password: admin@123 (BCrypt hashed)
-- =====================================================
INSERT IGNORE INTO Admins (id, fullName, email, password, role)
VALUES (
    'admin-001',
    'YatraConnect Admin',
    'admin@yatraconnect.com',
    '$2a$10$eNKlWsnfmM/ZGdWLDW0SOuPxUGFL8A7viZOZL/R7o3pIj6AZMi/SO',
    'admin'
);
