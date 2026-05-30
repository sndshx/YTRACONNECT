import os
from fpdf import FPDF

class YatraConnectPDF(FPDF):
    def header(self):
        if self.page_no() == 1:
            return
        self.set_font("helvetica", "B", 10)
        self.set_text_color(40, 53, 147)  # Dark Indigo
        self.cell(0, 10, "YATRA CONNECT - PROJECT CODE DISTRIBUTION REPORT", 0, 1, "R")
        self.set_draw_color(180, 180, 180)
        self.line(10, 18, 200, 18)
        self.ln(5)

    def footer(self):
        self.set_y(-15)
        self.set_font("helvetica", "I", 8)
        self.set_text_color(120, 120, 120)
        self.cell(0, 10, f"Page {self.page_no()} of {{nb}}", 0, 0, "C")
        self.cell(0, 10, "Confidential - YatraConnect Team", 0, 0, "R")

def create_report(output_path):
    pdf = YatraConnectPDF()
    pdf.alias_nb_pages()
    
    # ------------------ COVER PAGE ------------------
    pdf.add_page()
    pdf.set_margins(15, 20, 15)
    
    # Large Indigo Title Block
    pdf.set_fill_color(40, 53, 147) # Indigo
    pdf.rect(0, 0, 210, 85, 'F')
    
    pdf.set_y(25)
    pdf.set_font("helvetica", "B", 28)
    pdf.set_text_color(255, 255, 255)
    pdf.cell(0, 12, "YatraConnect", 0, 1, "C")
    pdf.set_font("helvetica", "B", 16)
    pdf.cell(0, 10, "Project Code Distribution & Ownership Report", 0, 1, "C")
    
    # Decorative line
    pdf.set_y(85)
    pdf.set_fill_color(244, 67, 54) # Coral Red accent
    pdf.rect(0, 85, 210, 4, 'F')
    
    pdf.set_y(105)
    pdf.set_font("helvetica", "B", 14)
    pdf.set_text_color(40, 53, 147)
    pdf.cell(0, 10, "Project Details", 0, 1, "L")
    pdf.set_draw_color(40, 53, 147)
    pdf.line(15, 115, 100, 115)
    pdf.ln(5)
    
    pdf.set_font("helvetica", "", 10)
    pdf.set_text_color(33, 33, 33)
    
    # Info list
    details = [
        ("Project Name", "YatraConnect (Travel & Accommodation Portal)"),
        ("Architecture", "Java EE MVC Web Application (Servlet, JSP, JDBC, DAO)"),
        ("Database", "MySQL"),
        ("Frontend Styles", "Tailwind CSS"),
        ("Date", "May 20, 2026"),
        ("Report Version", "1.0 (Final Code Allocation)")
    ]
    
    for label, val in details:
        pdf.set_font("helvetica", "B", 10)
        pdf.cell(40, 7, f"{label}:", 0, 0)
        pdf.set_font("helvetica", "", 10)
        pdf.cell(0, 7, val, 0, 1)
        
    pdf.ln(15)
    
    pdf.set_font("helvetica", "B", 14)
    pdf.set_text_color(40, 53, 147)
    pdf.cell(0, 10, "Executive Summary", 0, 1, "L")
    pdf.line(15, 160, 100, 160)
    pdf.ln(5)
    
    pdf.set_font("helvetica", "", 10.5)
    pdf.set_text_color(50, 50, 50)
    summary_text = (
        "This document lists the formal distribution and code ownership for the YatraConnect system. "
        "Every source file, model class, DAO, utility function, configuration file, and frontend JSP "
        "view has been fully mapped to its corresponding developer according to their contributions "
        "and roles in the project.\n\n"
        "All code artifacts, representing 100% of the project's source files, are covered in this "
        "distribution report. This ensures clean project handover, simplified debugging responsibilities, "
        "and clear accountability for academic/professional evaluation."
    )
    pdf.multi_cell(0, 6, summary_text)
    
    # ------------------ PAGE 2: TABLE OF CONTENT / TEAM SUMMARY ------------------
    pdf.add_page()
    pdf.ln(5)
    pdf.set_font("helvetica", "B", 16)
    pdf.set_text_color(40, 53, 147)
    pdf.cell(0, 10, "Team Distribution Matrix Summary", 0, 1)
    pdf.set_draw_color(180, 180, 180)
    pdf.line(15, 25, 195, 25)
    pdf.ln(5)
    
    # Table Header
    pdf.set_fill_color(230, 235, 245)
    pdf.set_font("helvetica", "B", 9)
    pdf.set_text_color(40, 53, 147)
    
    pdf.cell(10, 8, "S.N.", 1, 0, "C", True)
    pdf.cell(42, 8, "Team Member", 1, 0, "L", True)
    pdf.cell(33, 8, "Role", 1, 0, "L", True)
    pdf.cell(95, 8, "Primary Code Component Ownership", 1, 1, "L", True)
    
    # Table Content
    team_summary = [
        ("1", "Sandesh Khadka", "Leader & Core Dev", "MVC Architecture, Authentication, Bookings, Wishlist, Dashboards"),
        ("2", "Abhishek Niroula", "Traveller Frontend Dev", "My Bookings page, Traveller Search, Profile views, validations"),
        ("3", "Tanuja Subedi", "Backend & DB Dev", "All 10 Models, 10 DAOs, DB connection, Authentication frontend forms"),
        ("4", "Suyog Dahal", "Agency Frontend Dev", "Agency Packages, Booking Requests, Guide manager, Agency profile"),
        ("5", "Riya Chemjong", "Design & Public Views", "Responsive directories (hotels/agencies), About page, Includes components"),
        ("6", "Satyan Bajiko", "Reviews & Social Dev", "Review system, Inbox / Messaging system, Promotions & Verification pages")
    ]
    
    pdf.set_font("helvetica", "", 8.5)
    pdf.set_text_color(33, 33, 33)
    
    for row in team_summary:
        pdf.cell(10, 9, row[0], 1, 0, "C")
        pdf.set_font("helvetica", "B", 8.5)
        pdf.cell(42, 9, row[1], 1, 0, "L")
        pdf.set_font("helvetica", "", 8.5)
        pdf.cell(33, 9, row[2], 1, 0, "L")
        pdf.cell(95, 9, row[3], 1, 1, "L")
        
    pdf.ln(10)
    pdf.set_font("helvetica", "B", 11)
    pdf.set_text_color(244, 67, 54) # Coral red accent
    pdf.cell(0, 8, "Total Project Coverage: 100% of all codebase files mapped.", 0, 1)
    
    # ------------------ DETAILED SECTIONS ------------------
    members_data = [
        {
            "name": "Sandesh Khadka (Leader & Lead Architect)",
            "contribution": (
                "Designed and implemented all backend and frontend features in YatraConnect system including all dashboards "
                "like Admin Dashboard, Agency Dashboard and Traveller Dashboard. Designed and implemented Booking System, "
                "Authentication System, Wishlist System, Messaging System, Session Management, JDBC connectivity, "
                "and integration with MVC framework, testing, debugging, and final system integration and Home Page, Explore Page. "
                "Configured User, Bookings, Analytics, Package Details, and other key system modules."
            ),
            "files": [
                ("pom.xml", "Core Maven Project Object Model dependencies and build settings"),
                ("database_schema.sql", "SQL script defining schema, indexes and tables"),
                ("populate_listings.sql", "Seed file containing the initial tourist/trek package listings"),
                ("GenerateHash.java", "Core utility file used for initial password hashing"),
                ("src/main/java/com/yatraconnect/util/GenerateRealHash.java", "BCrypt hash operations for security systems"),
                ("src/main/java/com/yatraconnect/util/JsonUtil.java", "Fast JSON serializer/deserializer helper for controllers"),
                ("src/main/java/com/yatraconnect/controller/AuthServlet.java", "Core security authentication login/logout session servlet"),
                ("src/main/java/com/yatraconnect/controller/BookingServlet.java", "Checkout, date verification, and trip booking handler"),
                ("src/main/java/com/yatraconnect/controller/WishlistServlet.java", "Servlet processing wishlist updates and additions"),
                ("src/main/java/com/yatraconnect/controller/ListingServlet.java", "Servlet rendering active package listings search"),
                ("src/main/java/com/yatraconnect/controller/ProfileImageUploadServlet.java", "Multipart file upload handler for user profiles"),
                ("src/main/java/com/yatraconnect/controller/AdminDashboardServlet.java", "Administrative control center controller"),
                ("src/main/java/com/yatraconnect/controller/AdminAnalyticsServlet.java", "Servlet pulling sales, booking quantities & metrics"),
                ("src/main/java/com/yatraconnect/controller/AdminBookingServlet.java", "Main administrative booking oversight controller"),
                ("src/main/java/com/yatraconnect/controller/AdminPackageServlet.java", "Servlet checking packages submitted by agents"),
                ("src/main/java/com/yatraconnect/controller/AdminUserServlet.java", "Controller managing administrator user lists"),
                ("src/main/java/com/yatraconnect/controller/AgencyDashboardServlet.java", "Business analytics overview servlet for travel agents"),
                ("src/main/java/com/yatraconnect/controller/AgencyBookingServlet.java", "Servlet managing individual booking inquiries"),
                ("src/main/java/com/yatraconnect/controller/AgencyBookingsServlet.java", "List display management for travel agencies"),
                ("src/main/java/com/yatraconnect/controller/AgencyPackageServlet.java", "Business logic servlet for custom package uploads"),
                ("src/main/java/com/yatraconnect/controller/AgencyPackagesServlet.java", "Directory routing servlet for travel agency packages"),
                ("src/main/webapp/index.jsp", "Root router redirection JSP linking to landing index"),
                ("src/main/webapp/explore.jsp", "Main exploration filter search grid interface"),
                ("src/main/webapp/package-details.jsp", "Detailed package details, itinerary & details view"),
                ("src/main/webapp/admin/dashboard.jsp", "Overview panel with status KPIs, bookings logs"),
                ("src/main/webapp/admin/analytics.jsp", "Data charts, earnings, packages statistics screen"),
                ("src/main/webapp/admin/manageBookings.jsp", "Admin master list to edit/cancel customer bookings"),
                ("src/main/webapp/admin/managePackages.jsp", "Overview table to activate/suspend global listings"),
                ("src/main/webapp/admin/manageUsers.jsp", "Superuser table to list, delete, suspend user roles"),
                ("src/main/webapp/agency/dashboard.jsp", "Travel Agency operations panel (earnings, reservations, packages)"),
                ("src/main/webapp/traveller/dashboard.jsp", "Traveller central panel (recent trips, savings metrics)"),
                ("src/main/webapp/traveller/booking.jsp", "Checkout, guest registration forms & date select page"),
                ("src/main/webapp/traveller/wishlist.jsp", "Saved wishlist tours list overview page"),
                ("src/main/webapp/traveller/settings.jsp", "Account details change and credential reset panel")
            ]
        },
        {
            "name": "Abhishek Niroula (Traveller Frontend Developer)",
            "contribution": (
                "Built frontend pages for the travellers, including My Bookings Page, Search Page and Profile Page, "
                "with the help of Tailwind CSS. Assisted in frontend responsiveness and validation handling."
            ),
            "files": [
                ("src/main/webapp/traveller/my-bookings.jsp", "List of current, pending, and past trips booked by traveller"),
                ("src/main/webapp/traveller/search.jsp", "Responsive custom search filter results panel"),
                ("src/main/webapp/traveller/profile.jsp", "Traveller custom profile card interface and details form"),
                ("src/main/webapp/traveller/checklist.jsp", "Responsive travel preparations checklist validation handler")
            ]
        },
        {
            "name": "Tanuja Subedi (Database & Core MVC Backend Developer)",
            "contribution": (
                "Implementing the DAO and Model classes, CRUD operations, database connection, and forms in frontend "
                "such as Login and Register page in a backend."
            ),
            "files": [
                ("src/main/java/com/yatraconnect/util/DBConnection.java", "Core database context provider managing JDBC connections"),
                ("src/main/java/com/yatraconnect/model/Admin.java", "Admin user entity properties mapping model"),
                ("src/main/java/com/yatraconnect/model/Booking.java", "Booking parameters & custom selection mapping model"),
                ("src/main/java/com/yatraconnect/model/Guide.java", "Guide entity metadata fields mapping model"),
                ("src/main/java/com/yatraconnect/model/HamroAgent.java", "Agent entity metadata fields mapping model"),
                ("src/main/java/com/yatraconnect/model/HamroTraveller.java", "Traveller profile metadata fields mapping model"),
                ("src/main/java/com/yatraconnect/model/Listing.java", "Tour package properties mapping model"),
                ("src/main/java/com/yatraconnect/model/Message.java", "Message body properties mapping model"),
                ("src/main/java/com/yatraconnect/model/Promotion.java", "Promotion details mapping model"),
                ("src/main/java/com/yatraconnect/model/Review.java", "Review/Rating score parameters mapping model"),
                ("src/main/java/com/yatraconnect/model/Wishlist.java", "Wishlist database relational reference mapping model"),
                ("src/main/java/com/yatraconnect/dao/AdminDAO.java", "Admin credentials lookup DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/AgentDAO.java", "Agent registration, pan upload & details DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/BookingDAO.java", "Booking insertion, status confirmation DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/GuideDAO.java", "Guide database profile management DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/ListingDAO.java", "Listing search, category list & details DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/MessageDAO.java", "Message table interaction DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/PromotionDAO.java", "Promotion discounts lookup DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/ReviewDAO.java", "Review post, avg score calculation DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/TravellerDAO.java", "Traveller profile registration DAO CRUD handler"),
                ("src/main/java/com/yatraconnect/dao/WishlistDAO.java", "Wishlist select/delete table interaction DAO CRUD handler"),
                ("src/main/webapp/login.jsp", "Global login portal with login form error parameters"),
                ("src/main/webapp/register.jsp", "Global signup selection (Traveller) with validation fields"),
                ("src/main/webapp/agency/login.jsp", "Travel Agency tailored portal login interface"),
                ("src/main/webapp/agency/register.jsp", "Travel Agency comprehensive registration form"),
                ("src/main/webapp/admin/login.jsp", "Secure System Administrator login access interface"),
                ("src/main/java/com/yatraconnect/controller/AdminLoginServlet.java", "Security logic backend verifying admin dashboard session"),
                ("src/main/java/com/yatraconnect/controller/AgencyLoginServlet.java", "Security logic backend verifying agency dashboard session"),
                ("src/main/java/com/yatraconnect/controller/AgencyRegisterServlet.java", "Registration validation backend logic for agencies")
            ]
        },
        {
            "name": "Suyog Dahal (Agency Frontend Developer)",
            "contribution": (
                "Created front end pages for an agency: Manage Packages, Booking Requests, Manage Guides, "
                "Agency Profile pages. Assisted in package management functionalities."
            ),
            "files": [
                ("src/main/webapp/agency/manage-packages.jsp", "Travel agency active listings panel showing status, price, type"),
                ("src/main/webapp/agency/addPackage.jsp", "Step-by-step form to upload a new tour package with images"),
                ("src/main/webapp/agency/editPackage.jsp", "Form to edit details, prices, itineraries of existing packages"),
                ("src/main/webapp/agency/booking-requests.jsp", "Reservations dashboard allowing agencies to accept or deny booking requests"),
                ("src/main/webapp/agency/manage-guides.jsp", "Guide profiles management table with certificates data"),
                ("src/main/webapp/agency/profile.jsp", "Agency Profile settings page for locations, pan verification, bio"),
                ("src/main/java/com/yatraconnect/controller/ManageGuidesServlet.java", "CRUD backend handling guide additions and updates"),
                ("src/main/java/com/yatraconnect/controller/AgencyProfileServlet.java", "Servlet verifying and saving agency details changes")
            ]
        },
        {
            "name": "Riya Chemjong (Design & Public Layouts Developer)",
            "contribution": (
                "Created responsive front-end pages like Packages Page, About Page etc. with Tailwind CSS. "
                "Assisted in frontend design improvements."
            ),
            "files": [
                ("src/main/webapp/packages.jsp", "All active travel and trek packages directory listing"),
                ("src/main/webapp/about.jsp", "YatraConnect platform history, missions, and team section"),
                ("src/main/webapp/destinations.jsp", "Popular geographical highlights grid"),
                ("src/main/webapp/travel-agencies.jsp", "Verified Travel Agencies cards list"),
                ("src/main/webapp/trekking-agencies.jsp", "Trekking Agencies cards list"),
                ("src/main/webapp/verified-hotels.jsp", "Verified hotel stays listings view"),
                ("src/main/webapp/includes/navbar.jsp", "Highly stylized responsive navigation header component"),
                ("src/main/webapp/includes/footer.jsp", "Comprehensive page map footer component"),
                ("src/main/webapp/includes/header.jsp", "Global dependencies & styling links configuration"),
                ("src/main/webapp/includes/hero.jsp", "Landing page visually premium hero section with high-quality search triggers"),
                ("src/main/webapp/includes/how_it_works.jsp", "Step-by-step platform instructions module"),
                ("src/main/webapp/includes/testimonials.jsp", "Interactive traveller testimonials carousel component"),
                ("src/main/webapp/includes/top_destinations.jsp", "Popular tour card layouts section"),
                ("src/main/webapp/includes/trending_experiences.jsp", "Promotional package highlights section"),
                ("src/main/webapp/includes/exclusive_stays.jsp", "Grid showing high-rated hotel recommendations"),
                ("src/main/webapp/includes/heritage_gallery.jsp", "Aesthetic culture gallery presentation grid")
            ]
        },
        {
            "name": "Satyan Bajiko (Reviews & Social Integration Developer)",
            "contribution": (
                "Supported Review system, Messaging pages, Recommendation features and promotion page."
            ),
            "files": [
                ("src/main/java/com/yatraconnect/controller/ReviewServlet.java", "Backend handling review submission, rating scores"),
                ("src/main/java/com/yatraconnect/controller/AdminReviewServlet.java", "Oversight backend letting admins delete or approve reviews"),
                ("src/main/webapp/admin/manage-reviews.jsp", "Admin moderating dashboard checking reported comments"),
                ("src/main/webapp/admin/manageReviews.jsp", "Alternate layout table displaying all reviews list"),
                ("src/main/java/com/yatraconnect/controller/AgencyMessagesServlet.java", "Backend servlet fetching inbox contents for agency profiles"),
                ("src/main/webapp/agency/messages.jsp", "Interactive messaging client for agencies to respond to travellers"),
                ("src/main/webapp/traveller/messages.jsp", "Traveller chat client page linking to travel agency customer support"),
                ("src/main/java/com/yatraconnect/controller/PromotionServlet.java", "Promotion system CRUD handler processing discounts"),
                ("src/main/webapp/admin/promotion.jsp", "Admin dashboard editor allowing promotional banner additions"),
                ("src/main/webapp/admin/promotions.jsp", "Administrative table listing active/expired promotions"),
                ("src/main/java/com/yatraconnect/controller/VerifyAgencyServlet.java", "Agency PAN and document checker controller"),
                ("src/main/webapp/verification-process.jsp", "Visual document guidelines instructions page"),
                ("src/main/webapp/admin/approve-agencies.jsp", "Administrative approval panel for agency document checks"),
                ("src/main/webapp/admin/verifyAgencies.jsp", "Administrative list of verified and pending agencies logs")
            ]
        }
    ]
    
    for member in members_data:
        pdf.add_page()
        pdf.ln(5)
        
        pdf.set_font("helvetica", "B", 14)
        pdf.set_text_color(40, 53, 147)
        pdf.cell(0, 8, member["name"], 0, 1)
        pdf.set_draw_color(40, 53, 147)
        pdf.line(15, 23, 195, 23)
        pdf.ln(4)
        
        pdf.set_fill_color(245, 246, 250)
        pdf.set_font("helvetica", "I", 9.5)
        pdf.set_text_color(70, 70, 70)
        pdf.multi_cell(0, 5.5, f"Contribution Statement:\n\"{member['contribution']}\"", border=0, fill=True)
        pdf.ln(5)
        
        pdf.set_font("helvetica", "B", 11)
        pdf.set_text_color(40, 53, 147)
        pdf.cell(0, 8, "Primary File Ownership", 0, 1)
        
        pdf.set_fill_color(230, 235, 245)
        pdf.set_font("helvetica", "B", 9)
        pdf.set_text_color(40, 53, 147)
        pdf.cell(85, 7, "File Path / Name", 1, 0, "L", True)
        pdf.cell(95, 7, "Description / Function in System", 1, 1, "L", True)
        
        pdf.set_font("helvetica", "", 8)
        pdf.set_text_color(33, 33, 33)
        
        alternate_row = False
        for fpath, desc in member["files"]:
            if pdf.get_y() > 260:
                pdf.add_page()
                pdf.ln(5)
                pdf.set_fill_color(230, 235, 245)
                pdf.set_font("helvetica", "B", 9)
                pdf.set_text_color(40, 53, 147)
                pdf.cell(85, 7, "File Path / Name (Continued)", 1, 0, "L", True)
                pdf.cell(95, 7, "Description / Function in System", 1, 1, "L", True)
                pdf.set_font("helvetica", "", 8)
                pdf.set_text_color(33, 33, 33)
            
            if alternate_row:
                pdf.set_fill_color(248, 248, 250)
            else:
                pdf.set_fill_color(255, 255, 255)
            
            start_y = pdf.get_y()
            start_x = pdf.get_x()
            
            pdf.set_font("courier", "B", 8)
            pdf.set_text_color(20, 20, 20)
            pdf.set_xy(start_x, start_y)
            pdf.cell(85, 9, fpath, border=1, fill=True)
            
            pdf.set_font("helvetica", "", 8)
            pdf.set_text_color(50, 50, 50)
            pdf.set_xy(start_x + 85, start_y)
            pdf.multi_cell(95, 4.5, desc, border=1, fill=True)
            
            alternate_row = not alternate_row
            
    pdf.output(output_path)
    print(f"Successfully generated YatraConnect Code Distribution Report PDF at: {output_path}")

if __name__ == "__main__":
    current_dir = os.path.dirname(os.path.abspath(__file__))
    out_file = os.path.join(current_dir, "YatraConnect_Code_Distribution.pdf")
    create_report(out_file)
