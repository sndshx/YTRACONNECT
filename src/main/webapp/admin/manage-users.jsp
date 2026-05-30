<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.Admin" %>
<%@ page import="com.yatraconnect.model.HamroTraveller" %>
<%@ page import="java.util.List" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
    List<HamroTraveller> users = (List<HamroTraveller>) request.getAttribute("users");
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage   = (String) session.getAttribute("errorMessage");
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
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

    .search-input {
        background: #F9FAFB;
        border: none;
        padding: 10px 20px 10px 45px;
        border-radius: 15px;
        width: 250px;
        font-size: 13px;
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
    .btn-green:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(4, 120, 87, 0.3); }
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
            <a href="<%= request.getContextPath() %>/admin/users/" class="nav-pill active"><span class="material-icons">group</span> <span class="nav-text">Users</span></a>
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
                <a href="<%= request.getContextPath() %>/admin/bookings/" class="text-sm font-medium text-muted hover:text-main transition-colors">History</a>
                <a href="<%= request.getContextPath() %>/admin/users/" class="text-sm font-bold text-main border-b-2 border-primary-green pb-1">Contacts</a>
            </nav>
            
            <div class="flex items-center gap-6">
                <div class="relative">
                    <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-muted text-lg">search</span>
                    <input type="text" placeholder="Search members..." class="search-input">
                </div>
                <div class="flex items-center gap-3">
                    <img src="https://ui-avatars.com/api/?name=<%= admin.getFullName() %>&background=047857&color=fff" class="w-10 h-10 rounded-full border-2 border-white shadow-sm" alt="Avatar">
                    <span class="material-icons text-muted text-sm">expand_more</span>
                </div>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="mb-10">
            <div class="flex items-center gap-2 text-muted mb-4">
                <a href="dashboard" class="text-[10px] font-bold uppercase tracking-widest hover:text-main transition-colors">Dashboard</a>
                <span class="material-icons text-xs">chevron_right</span>
                <span class="text-[10px] font-bold uppercase tracking-widest">User Directory</span>
            </div>
            <h1 class="text-4xl font-bold text-main">Member <span class="text-muted font-medium italic">Directory</span></h1>
        </section>

        <!-- Flash Messages -->
        <% if (successMessage != null) { %>
            <div class="mb-6 px-5 py-4 rounded-2xl bg-emerald-50 border border-emerald-200 text-emerald-700 text-sm font-semibold flex items-center gap-3">
                <span class="material-icons text-lg">check_circle</span> <%= successMessage %>
            </div>
        <% } %>
        <% if (errorMessage != null) { %>
            <div class="mb-6 px-5 py-4 rounded-2xl bg-red-50 border border-red-200 text-red-700 text-sm font-semibold flex items-center gap-3">
                <span class="material-icons text-lg">error</span> <%= errorMessage %>
            </div>
        <% } %>

        <!-- Content Area -->
        <div class="glass-card">
            <div class="flex items-center justify-between mb-8">
                <h4 class="text-sm font-bold text-main">Platform Members
                    <span class="ml-2 px-2 py-0.5 rounded-lg bg-emerald-50 text-emerald-700 text-[10px] font-bold">
                        <%= (users != null ? users.size() : 0) %> total
                    </span>
                </h4>
                <div class="flex gap-2">
                    <button class="px-4 py-2 rounded-xl border border-gray-200 text-[10px] font-bold text-muted hover:bg-gray-50 transition-all">Export CSV</button>
                </div>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead>
                        <tr class="border-b border-gray-100">
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Member</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Role</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Status</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Joined</th>
                            <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-50">
                        <% if (users == null || users.isEmpty()) { %>
                            <tr>
                                <td colspan="5" class="py-16 text-center">
                                    <span class="material-icons text-4xl text-muted block mb-3">people_outline</span>
                                    <p class="text-sm font-bold text-muted">No registered users yet.</p>
                                </td>
                            </tr>
                        <% } else { %>
                            <% for (HamroTraveller user : users) {
                                boolean isSuspended = "suspended".equals(user.getRole());
                                String joinedDate = user.getCreatedAt() != null
                                    ? new java.text.SimpleDateFormat("dd MMM, yyyy").format(user.getCreatedAt())
                                    : "N/A";
                            %>
                            <tr class="group hover:bg-gray-50/50 transition-colors <%= isSuspended ? "opacity-60" : "" %>">
                                <td class="py-5">
                                    <div class="flex items-center gap-3">
                                        <img src="https://ui-avatars.com/api/?name=<%= java.net.URLEncoder.encode(user.getFullName(), "UTF-8") %>&background=047857&color=fff"
                                             class="w-10 h-10 rounded-xl" alt="Avatar">
                                        <div>
                                            <p class="text-xs font-bold text-main"><%= user.getFullName() %></p>
                                            <p class="text-[10px] text-muted font-medium"><%= user.getEmail() %></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="py-5">
                                    <span class="px-3 py-1 rounded-lg bg-gray-100 text-muted text-[9px] font-bold uppercase">Traveller</span>
                                </td>
                                <td class="py-5">
                                    <% if (isSuspended) { %>
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-red-500"></div>
                                            <span class="text-[10px] text-red-600 font-bold">Suspended</span>
                                        </div>
                                    <% } else { %>
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-emerald-500"></div>
                                            <span class="text-[10px] text-emerald-600 font-bold">Active</span>
                                        </div>
                                    <% } %>
                                </td>
                                <td class="py-5 text-xs font-bold text-muted"><%= joinedDate %></td>
                                <td class="py-5 text-right">
                                    <div class="flex items-center justify-end gap-2">
                                        <% if (isSuspended) { %>
                                            <form method="post" action="<%= request.getContextPath() %>/admin/users/">
                                                <input type="hidden" name="action" value="activate">
                                                <input type="hidden" name="userId" value="<%= user.getId() %>">
                                                <button type="submit" class="px-3 py-1.5 rounded-lg bg-emerald-50 text-emerald-700 text-[9px] font-bold uppercase hover:bg-emerald-100 transition-all">Activate</button>
                                            </form>
                                        <% } else { %>
                                            <form method="post" action="<%= request.getContextPath() %>/admin/users/">
                                                <input type="hidden" name="action" value="suspend">
                                                <input type="hidden" name="userId" value="<%= user.getId() %>">
                                                <button type="submit" class="px-3 py-1.5 rounded-lg bg-yellow-50 text-yellow-700 text-[9px] font-bold uppercase hover:bg-yellow-100 transition-all">Suspend</button>
                                            </form>
                                        <% } %>
                                        <form method="post" action="<%= request.getContextPath() %>/admin/users/"
                                              onsubmit="return confirm('Delete this user permanently?')">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                                            <button type="submit" class="px-3 py-1.5 rounded-lg bg-red-50 text-red-600 text-[9px] font-bold uppercase hover:bg-red-100 transition-all">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

</body>
</html>
