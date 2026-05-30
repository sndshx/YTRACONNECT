<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yatraconnect.model.Review" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
    String filter = (String) request.getAttribute("currentFilter");
    String msg = (String) session.getAttribute("successMessage");
    String err = (String) session.getAttribute("errorMessage");
    if (msg != null) session.removeAttribute("successMessage");
    if (err != null) session.removeAttribute("errorMessage");
    long pendingCount = reviews != null ? reviews.stream().filter(r -> "pending".equals(r.getStatus())).count() : 0;
%>
<jsp:include page="../includes/header.jsp" />

<style>
    :root {
        --dash-bg: #F3F4F6;
        --card-bg: #FFFFFF;
        --primary-green: #047857;
        --text-main: #111827;
        --text-muted: #6B7280;
    }
    
    body { background-color: var(--dash-bg); color: var(--text-main); }

    .dash-sidebar {
        width: 260px;
        background: var(--card-bg);
        border-radius: 2.5rem;
        margin: 1.5rem 0 1.5rem 1.5rem;
        display: flex;
        flex-direction: column;
        padding: 2.5rem 1.5rem;
        box-shadow: 0 10px 25px rgba(0,0,0,0.02);
    }

    .nav-pill {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 12px 20px;
        border-radius: 15px;
        margin-bottom: 0.5rem;
        transition: all 0.3s ease;
        color: var(--text-muted);
        text-decoration: none;
    }
    .nav-pill span.material-icons { font-size: 20px; }
    .nav-pill span.nav-text { font-size: 11px; font-weight: 800; text-transform: uppercase; letter-spacing: 0.05em; }
    
    .nav-pill:hover, .nav-pill.active {
        background: var(--primary-green);
        color: white;
        box-shadow: 0 8px 15px rgba(4, 120, 87, 0.2);
    }

    .glass-card {
        background: var(--card-bg);
        border-radius: 2.5rem;
        padding: 2.5rem;
        box-shadow: 0 4px 20px rgba(0,0,0,0.03);
        border: 1px solid rgba(255,255,255,0.8);
    }

    .btn-green {
        background: var(--primary-green);
        color: white;
        padding: 10px 20px;
        border-radius: 12px;
        font-weight: 700;
        font-size: 11px;
        transition: all 0.3s ease;
    }
</style>

<div class="flex min-h-screen">
    
    <!-- Left Sidebar -->
    <aside class="dash-sidebar shrink-0 hidden md:flex">
        <div class="mb-12 px-4 flex items-center gap-3">
            <img src="<%= request.getContextPath() %>/assets/images/logo.png" class="w-10 h-10 object-contain" alt="Logo">
            <span class="text-xs font-black uppercase tracking-[0.2em] text-main">Yatra<span class="text-primary-green">Connect</span></span>
        </div>
        
        <div class="space-y-1">
            <a href="<%= request.getContextPath() %>/admin/dashboard" class="nav-pill"><span class="material-icons">grid_view</span> <span class="nav-text">Dashboard</span></a>
            <a href="<%= request.getContextPath() %>/admin/analytics" class="nav-pill"><span class="material-icons">insights</span> <span class="nav-text">Analytics</span></a>
            <a href="<%= request.getContextPath() %>/admin/bookings/" class="nav-pill"><span class="material-icons">confirmation_number</span> <span class="nav-text">Bookings</span></a>
            <a href="<%= request.getContextPath() %>/admin/packages/" class="nav-pill"><span class="material-icons">inventory_2</span> <span class="nav-text">Packages</span></a>
            <a href="<%= request.getContextPath() %>/admin/agencies/" class="nav-pill"><span class="material-icons">verified_user</span> <span class="nav-text">Agencies</span></a>
            <a href="<%= request.getContextPath() %>/admin/users/" class="nav-pill"><span class="material-icons">group</span> <span class="nav-text">Users</span></a>
            <a href="<%= request.getContextPath() %>/admin/reviews/" class="nav-pill active"><span class="material-icons">rate_review</span> <span class="nav-text">Reviews</span></a>
            <a href="<%= request.getContextPath() %>/admin/promotions/" class="nav-pill"><span class="material-icons">campaign</span> <span class="nav-text">Promotions</span></a>
        </div>
        
        <div class="mt-auto pt-8 border-t border-gray-100">
            <a href="#" class="nav-pill"><span class="material-icons">settings</span> <span class="nav-text">Settings</span></a>
            <a href="<%= request.getContextPath() %>/auth/logout" class="nav-pill"><span class="material-icons">logout</span> <span class="nav-text">Sign Out</span></a>
        </div>
    </aside>

    <!-- Main Content Wrapper -->
    <main class="flex-1 p-6 md:p-8">
        
        <!-- Top Bar -->
        <header class="flex items-center justify-between mb-10">
            <nav class="flex items-center gap-8">
                <a href="<%= request.getContextPath() %>/admin/dashboard" class="text-sm font-medium text-muted hover:text-main transition-colors">Dashboard</a>
                <a href="<%= request.getContextPath() %>/admin/analytics" class="text-sm font-medium text-muted hover:text-main transition-colors">Reports</a>
                <a href="<%= request.getContextPath() %>/admin/packages/" class="text-sm font-medium text-muted hover:text-main transition-colors">Documents</a>
                <a href="<%= request.getContextPath() %>/admin/bookings/" class="text-sm font-medium text-muted hover:text-main transition-colors">History</a>
                <a href="<%= request.getContextPath() %>/admin/users/" class="text-sm font-medium text-muted hover:text-main transition-colors">Contacts</a>
            </nav>
            
            <div class="flex items-center gap-6">
                <div class="bg-emerald-50 text-emerald-600 px-4 py-2 rounded-xl text-[10px] font-bold uppercase tracking-widest">
                    <%= pendingCount %> Pending Tasks
                </div>
                <div class="flex items-center gap-3">
                    <img src="https://ui-avatars.com/api/?name=<%= admin.getFullName() %>&background=047857&color=fff" class="w-10 h-10 rounded-full border-2 border-white shadow-sm" alt="Avatar">
                </div>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="mb-10">
            <div class="flex items-center gap-2 text-muted mb-3">
                <a href="dashboard" class="text-[10px] font-bold uppercase tracking-widest hover:text-main transition-colors">Dashboard</a>
                <span class="material-icons text-xs">chevron_right</span>
                <span class="text-[10px] font-bold uppercase tracking-widest">Moderation</span>
            </div>
            <h1 class="text-4xl font-bold text-main">Content <span class="text-muted font-medium italic">Guardianship</span></h1>
        </section>

        <% if (msg != null) { %><div class="mb-6 p-4 rounded-2xl bg-emerald-50 text-emerald-600 text-xs font-bold uppercase tracking-widest text-center border border-emerald-100"><%= msg %></div><% } %>
        <% if (err != null) { %><div class="mb-6 p-4 rounded-2xl bg-red-50 text-red-600 text-xs font-bold uppercase tracking-widest text-center border border-red-100"><%= err %></div><% } %>

        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            <!-- Feed -->
            <div class="lg:col-span-8 space-y-6">
                <% if (reviews != null && !reviews.isEmpty()) {
                    for (Review review : reviews) {
                %>
                <div class="glass-card">
                    <div class="flex items-start justify-between mb-6">
                        <div class="flex items-center gap-4">
                            <img src="https://ui-avatars.com/api/?name=<%= review.getCustomerName() %>&background=random" class="w-12 h-12 rounded-2xl" alt="Avatar">
                            <div>
                                <h4 class="text-sm font-bold text-main"><%= review.getCustomerName() %></h4>
                                <p class="text-[9px] text-muted font-bold uppercase tracking-widest">on <span class="text-emerald-600"><%= review.getServiceType() != null ? review.getServiceType() : "Unknown Service" %></span></p>
                            </div>
                        </div>
                        <div class="flex items-center gap-0.5 text-amber-400">
                            <% for(int i=1; i<=5; i++) { %>
                                <span class="material-icons text-sm <%= i <= review.getRating() ? "" : "text-gray-200" %>">star</span>
                            <% } %>
                        </div>
                    </div>
                    <p class="text-xs text-muted leading-relaxed mb-8 italic">"<%= review.getMessage() %>"</p>
                    <div class="flex items-center justify-between pt-6 border-t border-gray-50">
                        <div>
                            <span class="text-[9px] text-muted font-bold uppercase tracking-widest">Submitted: <%= review.getCreatedAt() %></span>
                            <span class="ml-2 px-2 py-1 rounded text-[8px] font-bold uppercase tracking-widest <%= "approved".equals(review.getStatus()) ? "bg-emerald-100 text-emerald-700" : "pending".equals(review.getStatus()) ? "bg-amber-100 text-amber-700" : "bg-red-100 text-red-700" %>"><%= review.getStatus() %></span>
                        </div>
                        <div class="flex items-center gap-2">
                            <form method="POST" action="<%= request.getContextPath() %>/admin/reviews/" class="m-0 flex gap-2">
                                <input type="hidden" name="reviewId" value="<%= review.getId() %>">
                                <% if ("pending".equals(review.getStatus())) { %>
                                <button type="submit" name="action" value="approve" class="btn-green">Approve</button>
                                <button type="submit" name="action" value="reject" class="px-4 py-2 bg-gray-50 text-muted text-[10px] font-bold uppercase rounded-xl hover:bg-amber-50 hover:text-amber-600 transition-all">Reject</button>
                                <% } %>
                                <button type="submit" name="action" value="delete" class="px-4 py-2 bg-gray-50 text-muted text-[10px] font-bold uppercase rounded-xl hover:bg-red-50 hover:text-red-600 transition-all" onclick="return confirm('Are you sure you want to delete this review?');">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
                <% } } else { %>
                <div class="glass-card text-center py-10">
                    <p class="text-muted text-sm font-bold">No reviews found.</p>
                </div>
                <% } %>
            </div>

            <!-- Insights -->
            <div class="lg:col-span-4 space-y-8">
                <div class="glass-card">
                    <h4 class="text-lg font-bold text-main mb-6">Moderation Stats</h4>
                    <div class="space-y-6">
                        <div>
                            <div class="flex justify-between text-[10px] font-bold uppercase tracking-widest mb-2">
                                <span class="text-muted">Approval Velocity</span>
                                <span class="text-main">92%</span>
                            </div>
                            <div class="h-1.5 w-full bg-gray-50 rounded-full overflow-hidden"><div class="h-full bg-emerald-600 w-[92%]"></div></div>
                        </div>
                        <div>
                            <div class="flex justify-between text-[10px] font-bold uppercase tracking-widest mb-2">
                                <span class="text-muted">Flagged Artifacts</span>
                                <span class="text-main">4%</span>
                            </div>
                            <div class="h-1.5 w-full bg-gray-50 rounded-full overflow-hidden"><div class="h-full bg-red-500 w-[4%]"></div></div>
                        </div>
                    </div>
                </div>

                <div class="bg-emerald-700 rounded-[2.5rem] p-8 text-white shadow-xl shadow-emerald-700/20">
                    <span class="material-icons text-3xl mb-4">gpp_maybe</span>
                    <h4 class="text-xl font-bold mb-2 leading-tight">Content Integrity <br>Standard</h4>
                    <p class="text-white/70 text-xs mb-6 leading-relaxed">Ensure all platform interactions adhere to the YatraConnect Trust & Safety protocol.</p>
                    <button class="px-6 py-2.5 bg-white/10 border border-white/20 rounded-xl text-[9px] font-bold uppercase tracking-widest hover:bg-white/20 transition-all">Review Policy</button>
                </div>
            </div>
        </div>
    </main>
</div>

</body>
</html>
