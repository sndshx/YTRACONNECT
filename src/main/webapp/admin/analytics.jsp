<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
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

    .kpi-card {
        background: white;
        border-radius: 2rem;
        padding: 1.5rem;
        border: 1px solid #F3F4F6;
        transition: all 0.3s ease;
    }
    .kpi-card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.05); }

    .progress-bar {
        height: 8px;
        background: #F3F4F6;
        border-radius: 10px;
        overflow: hidden;
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
            <a href="<%= request.getContextPath() %>/admin/analytics" class="nav-pill active"><span class="material-icons">insights</span> <span class="nav-text">Analytics</span></a>
            <a href="<%= request.getContextPath() %>/admin/bookings/" class="nav-pill"><span class="material-icons">confirmation_number</span> <span class="nav-text">Bookings</span></a>
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
                <a href="<%= request.getContextPath() %>/admin/analytics" class="text-sm font-bold text-main border-b-2 border-primary-green pb-1">Reports</a>
                <a href="<%= request.getContextPath() %>/admin/packages/" class="text-sm font-medium text-muted hover:text-main transition-colors">Documents</a>
                <a href="<%= request.getContextPath() %>/admin/bookings/" class="text-sm font-medium text-muted hover:text-main transition-colors">History</a>
                <a href="<%= request.getContextPath() %>/admin/users/" class="text-sm font-medium text-muted hover:text-main transition-colors">Contacts</a>
            </nav>
            
            <div class="flex items-center gap-6">
                <div class="flex bg-gray-100 p-1 rounded-xl">
                    <button class="px-4 py-1.5 text-[10px] font-bold text-white bg-emerald-600 rounded-lg">Live</button>
                    <button class="px-4 py-1.5 text-[10px] font-bold text-muted">Weekly</button>
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
                <span class="text-[10px] font-bold uppercase tracking-widest">Reports</span>
            </div>
            <h1 class="text-4xl font-bold text-main">Market <span class="text-muted font-medium italic">Intelligence</span></h1>
        </section>

        <!-- KPI Grid -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
            <div class="kpi-card">
                <p class="text-[10px] font-bold text-muted uppercase tracking-widest mb-2">Net Liquidity</p>
                <h3 class="text-2xl font-bold text-main mb-1">NPR 4.2M</h3>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-[10px]">
                    <span class="material-icons text-xs">trending_up</span> 12.4%
                </div>
            </div>
            <div class="kpi-card">
                <p class="text-[10px] font-bold text-muted uppercase tracking-widest mb-2">Total Exposure</p>
                <h3 class="text-2xl font-bold text-main mb-1">1,284</h3>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-[10px]">
                    <span class="material-icons text-xs">trending_up</span> 8.2%
                </div>
            </div>
            <div class="kpi-card">
                <p class="text-[10px] font-bold text-muted uppercase tracking-widest mb-2">Inventory Depth</p>
                <h3 class="text-2xl font-bold text-main mb-1">842</h3>
                <div class="flex items-center gap-1 text-amber-600 font-bold text-[10px]">
                    <span class="material-icons text-xs">trending_flat</span> 0.5%
                </div>
            </div>
            <div class="kpi-card">
                <p class="text-[10px] font-bold text-muted uppercase tracking-widest mb-2">Agency Satisfaction</p>
                <h3 class="text-2xl font-bold text-main mb-1">4.8/5</h3>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-[10px]">
                    <span class="material-icons text-xs">star</span> Premium
                </div>
            </div>
        </div>

        <!-- Main Insights -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 glass-card">
                <div class="flex items-center justify-between mb-10">
                    <div>
                        <h4 class="text-lg font-bold text-main">Booking Velocity</h4>
                        <p class="text-xs text-muted">Conversion rates across categories</p>
                    </div>
                    <button class="text-muted"><span class="material-icons">more_vert</span></button>
                </div>
                
                <div class="h-64 flex items-end justify-between gap-4 border-b border-gray-100 pb-4">
                    <div class="flex-1 bg-emerald-50 rounded-xl relative group h-[40%]"><div class="absolute bottom-0 w-full bg-emerald-600 rounded-xl h-[60%] group-hover:h-[80%] transition-all"></div></div>
                    <div class="flex-1 bg-emerald-50 rounded-xl relative group h-[70%]"><div class="absolute bottom-0 w-full bg-emerald-600 rounded-xl h-[85%] group-hover:h-[100%] transition-all"></div></div>
                    <div class="flex-1 bg-emerald-50 rounded-xl relative group h-[55%]"><div class="absolute bottom-0 w-full bg-emerald-600 rounded-xl h-[40%] group-hover:h-[60%] transition-all"></div></div>
                    <div class="flex-1 bg-emerald-50 rounded-xl relative group h-[85%]"><div class="absolute bottom-0 w-full bg-emerald-600 rounded-xl h-[90%] group-hover:h-[100%] transition-all"></div></div>
                    <div class="flex-1 bg-emerald-50 rounded-xl relative group h-[45%]"><div class="absolute bottom-0 w-full bg-emerald-600 rounded-xl h-[70%] group-hover:h-[90%] transition-all"></div></div>
                    <div class="flex-1 bg-emerald-50 rounded-xl relative group h-[60%]"><div class="absolute bottom-0 w-full bg-emerald-600 rounded-xl h-[50%] group-hover:h-[70%] transition-all"></div></div>
                </div>
                <div class="flex justify-between mt-4 text-[9px] font-bold text-muted uppercase tracking-widest px-2">
                    <span>Trekking</span>
                    <span>Luxury</span>
                    <span>Adventure</span>
                    <span>Expeditions</span>
                    <span>Cultural</span>
                    <span>Day Trips</span>
                </div>
            </div>

            <div class="glass-card">
                <h4 class="text-lg font-bold text-main mb-8">Category Mix</h4>
                <div class="space-y-8">
                    <div>
                        <div class="flex justify-between items-center text-[10px] font-bold uppercase tracking-widest mb-2">
                            <span class="text-muted">High-Altitude Trekking</span>
                            <span class="text-main">45%</span>
                        </div>
                        <div class="progress-bar"><div class="h-full bg-emerald-600" style="width: 45%"></div></div>
                    </div>
                    <div>
                        <div class="flex justify-between items-center text-[10px] font-bold uppercase tracking-widest mb-2">
                            <span class="text-muted">Luxury Expeditions</span>
                            <span class="text-main">32%</span>
                        </div>
                        <div class="progress-bar"><div class="h-full bg-emerald-600" style="width: 32%"></div></div>
                    </div>
                    <div>
                        <div class="flex justify-between items-center text-[10px] font-bold uppercase tracking-widest mb-2">
                            <span class="text-muted">Cultural Heritage</span>
                            <span class="text-main">23%</span>
                        </div>
                        <div class="progress-bar"><div class="h-full bg-emerald-600" style="width: 23%"></div></div>
                    </div>
                </div>

                <div class="mt-12 p-6 bg-gray-50 rounded-2xl border border-gray-100">
                    <div class="flex items-center gap-3 mb-2">
                        <span class="material-icons text-emerald-600">stars</span>
                        <p class="text-xs font-bold text-main">Top Performing Region</p>
                    </div>
                    <p class="text-[10px] font-bold text-muted uppercase tracking-widest">Everest Base Camp Cluster</p>
                </div>
            </div>
        </div>
    </main>
</div>

</body>
</html>
