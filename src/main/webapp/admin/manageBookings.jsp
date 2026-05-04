<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yatraconnect.model.Booking" %>
<%@ page import="com.yatraconnect.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    String filter = (String) request.getAttribute("currentFilter");
    String msg = (String) session.getAttribute("successMessage");
    String err = (String) session.getAttribute("errorMessage");
    if (msg != null) session.removeAttribute("successMessage");
    if (err != null) session.removeAttribute("errorMessage");
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
        padding: 2rem;
        box-shadow: 0 4px 20px rgba(0,0,0,0.03);
        border: 1px solid rgba(255,255,255,0.8);
    }

    .filter-btn {
        padding: 8px 16px;
        border-radius: 10px;
        font-size: 10px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        transition: all 0.3s ease;
    }
    .filter-btn.active { background: var(--primary-green); color: white; }
    .filter-btn:not(.active) { background: #F3F4F6; color: var(--text-muted); }

    .status-pill {
        padding: 4px 10px;
        border-radius: 8px;
        font-size: 9px;
        font-weight: 800;
        text-transform: uppercase;
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
            <a href="<%= request.getContextPath() %>/admin/bookings/" class="nav-pill active"><span class="material-icons">confirmation_number</span> <span class="nav-text">Bookings</span></a>
            <a href="<%= request.getContextPath() %>/admin/packages/" class="nav-pill"><span class="material-icons">inventory_2</span> <span class="nav-text">Packages</span></a>
            <a href="<%= request.getContextPath() %>/admin/agencies/" class="nav-pill"><span class="material-icons">verified_user</span> <span class="nav-text">Agencies</span></a>
            <a href="<%= request.getContextPath() %>/admin/users/" class="nav-pill"><span class="material-icons">group</span> <span class="nav-text">Users</span></a>
            <a href="<%= request.getContextPath() %>/admin/reviews/" class="nav-pill"><span class="material-icons">rate_review</span> <span class="nav-text">Reviews</span></a>
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
                <a href="<%= request.getContextPath() %>/admin/bookings/" class="text-sm font-bold text-main border-b-2 border-primary-green pb-1">History</a>
                <a href="<%= request.getContextPath() %>/admin/users/" class="text-sm font-medium text-muted hover:text-main transition-colors">Contacts</a>
            </nav>
            
            <div class="flex items-center gap-6">
                <div class="relative">
                    <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-muted text-lg">search</span>
                    <input type="text" placeholder="Search bookings..." class="bg-[#F9FAFB] border-none px-12 py-2.5 rounded-2xl w-64 text-sm focus:ring-0">
                </div>
                <div class="flex items-center gap-3">
                    <img src="https://ui-avatars.com/api/?name=<%= admin.getFullName() %>&background=047857&color=fff" class="w-10 h-10 rounded-full border-2 border-white shadow-sm" alt="Avatar">
                    <span class="material-icons text-muted text-sm">expand_more</span>
                </div>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-10">
            <div>
                <div class="flex items-center gap-2 text-muted mb-3">
                    <a href="dashboard" class="text-[10px] font-bold uppercase tracking-widest hover:text-main transition-colors">Dashboard</a>
                    <span class="material-icons text-xs">chevron_right</span>
                    <span class="text-[10px] font-bold uppercase tracking-widest">History</span>
                </div>
                <h1 class="text-4xl font-bold text-main">Booking <span class="text-muted font-medium italic">Oversight</span></h1>
            </div>
            
            <div class="flex items-center gap-2">
                <a href="?status=all" class="filter-btn <%= "all".equals(filter) || filter == null ? "active" : "" %>">All</a>
                <a href="?status=pending" class="filter-btn <%= "pending".equals(filter) ? "active" : "" %>">Pending</a>
                <a href="?status=confirmed" class="filter-btn <%= "confirmed".equals(filter) ? "active" : "" %>">Confirmed</a>
                <a href="?status=cancelled" class="filter-btn <%= "cancelled".equals(filter) ? "active" : "" %>">Cancelled</a>
            </div>
        </section>

        <% if (msg != null) { %><div class="mb-6 p-4 rounded-2xl bg-emerald-50 text-emerald-600 text-xs font-bold uppercase tracking-widest text-center border border-emerald-100"><%= msg %></div><% } %>
        <% if (err != null) { %><div class="mb-6 p-4 rounded-2xl bg-red-50 text-red-600 text-xs font-bold uppercase tracking-widest text-center border border-red-100"><%= err %></div><% } %>

        <!-- Content Area -->
        <div class="glass-card">
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead>
                        <tr class="border-b border-gray-100">
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Booking ID</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Experience</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Total Value</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Status</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Trip Phase</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-50">
                        <% if (bookings != null) for (Booking b : bookings) { %>
                        <tr class="group hover:bg-gray-50/50 transition-colors">
                            <td class="py-6 text-xs font-mono font-bold text-muted"><%= b.getId() != null ? b.getId().substring(0, 8) : "-" %></td>
                            <td class="py-6">
                                <p class="text-xs font-bold text-main"><%= b.getListingTitle() %></p>
                            </td>
                            <td class="py-6 text-xs font-bold text-main">NPR <%= b.getTotalAmount() %></td>
                            <td class="py-6">
                                <span class="status-pill 
                                    <%= "confirmed".equals(b.getStatus()) ? "bg-emerald-50 text-emerald-600" :
                                       "pending".equals(b.getStatus()) ? "bg-amber-50 text-amber-600" :
                                       "bg-red-50 text-red-600" %>"><%= b.getStatus() %></span>
                            </td>
                            <td class="py-6 text-[10px] font-bold text-muted uppercase tracking-widest"><%= b.getTripStatus() %></td>
                            <td class="py-6 text-right">
                                <div class="flex items-center justify-end gap-3">
                                    <% if (!"cancelled".equals(b.getStatus())) { %>
                                    <form method="POST" action="." class="inline">
                                        <input type="hidden" name="bookingId" value="<%= b.getId() %>"><input type="hidden" name="action" value="updateStatus">
                                        <select name="newStatus" onchange="this.form.submit()" class="bg-gray-50 border-none text-[10px] font-bold text-muted rounded-lg px-2 py-1 focus:ring-0">
                                            <option value="">Status</option>
                                            <option value="confirmed">Confirm</option>
                                            <option value="cancelled">Cancel</option>
                                        </select>
                                    </form>
                                    <% } %>
                                    <button class="text-muted hover:text-main"><span class="material-icons text-lg">more_horiz</span></button>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% if (bookings == null || bookings.isEmpty()) { %>
            <div class="py-20 text-center">
                <span class="material-icons text-4xl text-gray-200 mb-4">history_toggle_off</span>
                <p class="text-muted text-xs font-bold uppercase tracking-widest">No matching records found</p>
            </div>
            <% } %>
        </div>
    </main>
</div>

</body>
</html>
