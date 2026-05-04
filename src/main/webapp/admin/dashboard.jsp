<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
    int travellers = (Integer) request.getAttribute("totalTravellers");
    int agencies = (Integer) request.getAttribute("totalAgencies");
    int bookings = (Integer) request.getAttribute("totalBookings");
    int listings = (Integer) request.getAttribute("totalListings");
    int pendingAgencies = (Integer) request.getAttribute("pendingAgencies");
    int pendingReviews = (Integer) request.getAttribute("pendingReviews");
    int activeBookings = (Integer) request.getAttribute("activeBookings");
    double revenue = (Double) request.getAttribute("totalRevenue");
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

    .stat-badge {
        background: #ECFDF5;
        color: var(--primary-green);
        padding: 4px 10px;
        border-radius: 8px;
        font-size: 11px;
        font-weight: 700;
    }

    /* Chart Simulation */
    .bar-container { display: flex; align-items: flex-end; gap: 12px; height: 160px; }
    .bar-item { width: 40px; border-radius: 12px; background: #D1FAE5; transition: all 0.3s ease; position: relative; }
    .bar-item:hover { background: var(--primary-green); transform: translateY(-5px); }
    .bar-item.highlight { background: var(--primary-green); }
    
    .line-chart-svg { width: 100%; height: 60px; overflow: visible; }
    .line-path { fill: none; stroke: var(--primary-green); stroke-width: 2.5; stroke-linecap: round; }
    .line-area { fill: url(#line-gradient); opacity: 0.1; }

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
        padding: 12px 24px;
        border-radius: 15px;
        font-weight: 700;
        font-size: 12px;
        transition: all 0.3s ease;
    }
    .btn-green:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(4, 120, 87, 0.3); }

    .btn-outline {
        border: 1.5px solid #E5E7EB;
        padding: 12px 24px;
        border-radius: 15px;
        font-weight: 700;
        font-size: 12px;
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
            <a href="<%= request.getContextPath() %>/admin/dashboard" class="nav-pill active"><span class="material-icons">grid_view</span> <span class="nav-text">Dashboard</span></a>
            <a href="<%= request.getContextPath() %>/admin/analytics" class="nav-pill"><span class="material-icons">insights</span> <span class="nav-text">Analytics</span></a>
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
                <a href="<%= request.getContextPath() %>/admin/dashboard" class="text-sm font-bold text-main border-b-2 border-primary-green pb-1">Dashboard</a>
                <a href="<%= request.getContextPath() %>/admin/analytics" class="text-sm font-medium text-muted hover:text-main transition-colors">Reports</a>
                <a href="<%= request.getContextPath() %>/admin/packages/" class="text-sm font-medium text-muted hover:text-main transition-colors">Documents</a>
                <a href="<%= request.getContextPath() %>/admin/bookings/" class="text-sm font-medium text-muted hover:text-main transition-colors">History</a>
                <a href="<%= request.getContextPath() %>/admin/users/" class="text-sm font-medium text-muted hover:text-main transition-colors">Contacts</a>
            </nav>
            
            <div class="flex items-center gap-6">
                <div class="relative">
                    <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-muted text-lg">search</span>
                    <input type="text" placeholder="Search anything..." class="search-input">
                </div>
                <button class="text-muted hover:text-main transition-colors relative">
                    <span class="material-icons">notifications</span>
                    <% if (pendingAgencies + pendingReviews > 0) { %>
                        <span class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full border-2 border-dash-bg"></span>
                    <% } %>
                </button>
                <div class="flex items-center gap-3">
                    <img src="https://ui-avatars.com/api/?name=<%= admin.getFullName() %>&background=047857&color=fff" class="w-10 h-10 rounded-full border-2 border-white shadow-sm" alt="Avatar">
                    <span class="material-icons text-muted text-sm">expand_more</span>
                </div>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-10">
            <div>
                <h1 class="text-4xl font-bold text-main mb-2">Welcome Back, <span class="text-muted font-medium"><%= admin.getFullName().split(" ")[0] %></span></h1>
            </div>
            <div class="flex items-center gap-4">
                <div class="bg-white px-5 py-3 rounded-2xl flex items-center gap-3 shadow-sm border border-gray-100 cursor-pointer hover:bg-gray-50 transition-colors">
                    <span class="material-icons text-muted text-lg">calendar_today</span>
                    <span class="text-xs font-bold text-muted">29 Jun, 2026 - <%= new java.text.SimpleDateFormat("dd MMM, yyyy").format(new java.util.Date()) %></span>
                    <span class="material-icons text-muted text-sm">expand_more</span>
                </div>
                <button onclick="location.href='agencies/?filter=pending'" class="btn-green flex items-center gap-2">
                    <span class="material-icons text-lg">add</span> Verify New Agency
                </button>
            </div>
        </section>

        <!-- Grid Layout -->
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            
            <!-- Left Column -->
            <div class="lg:col-span-8 space-y-8">
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <!-- Revenue Stats Card -->
                    <div class="glass-card flex flex-col justify-between">
                        <div class="flex items-center justify-between mb-8">
                            <div>
                                <h4 class="text-xs font-bold text-muted uppercase tracking-widest mb-1">Platform Revenue</h4>
                                <p class="text-[10px] text-muted">Total amount accumulated</p>
                            </div>
                            <button onclick="location.href='analytics'" class="text-muted hover:text-main"><span class="material-icons">north_east</span></button>
                        </div>
                        
                        <!-- VISA-like Card Visualization -->
                        <div class="bg-gradient-to-br from-emerald-600 to-emerald-800 rounded-3xl p-6 text-white shadow-lg shadow-emerald-900/20 mb-8 relative overflow-hidden group">
                            <div class="absolute -right-10 -top-10 w-40 h-40 bg-white/10 rounded-full blur-3xl transition-transform group-hover:scale-150"></div>
                            <div class="flex justify-between items-start mb-10 relative z-10">
                                <div class="space-y-1">
                                    <p class="text-[10px] font-bold opacity-60 uppercase">YatraConnect Wallet</p>
                                    <p class="text-xs font-bold">Main Admin Account</p>
                                </div>
                                <span class="material-icons opacity-40">rss_feed</span>
                            </div>
                            <h2 class="text-3xl font-bold mb-8 relative z-10">NPR <%= String.format("%,.2f", revenue) %></h2>
                            <div class="flex justify-between items-end relative z-10">
                                <p class="text-xs font-mono tracking-widest">**** <%= (int)(Math.random()*9000)+1000 %></p>
                                <p class="text-[10px] font-bold opacity-60 uppercase">EXP 12/28</p>
                            </div>
                        </div>

                        <div class="flex items-center justify-between">
                            <div>
                                <h4 class="text-[10px] font-bold text-muted uppercase tracking-widest mb-1">Weekly Growth</h4>
                                <p class="text-2xl font-bold text-main">+14.2% <span class="text-emerald-500 text-xs font-bold ml-1">USD</span></p>
                            </div>
                            <div class="stat-badge">+12.8%</div>
                        </div>
                    </div>

                    <!-- Engagement Chart Card -->
                    <div class="glass-card">
                        <div class="flex items-center justify-between mb-8">
                            <div class="flex items-center gap-3">
                                <span class="material-icons text-main">analytics</span>
                                <h4 class="text-sm font-bold text-main">Booking Performance</h4>
                            </div>
                            <div class="flex bg-gray-100 p-1 rounded-xl">
                                <button onclick="location.href='analytics'" class="px-4 py-1.5 text-[10px] font-bold text-muted">Monthly</button>
                                <button onclick="location.href='analytics'" class="px-4 py-1.5 text-[10px] font-bold text-white bg-emerald-600 rounded-lg shadow-sm">Annually</button>
                            </div>
                            <button onclick="location.href='bookings/'" class="text-muted hover:text-main"><span class="material-icons">north_east</span></button>
                        </div>
                        
                        <div class="relative">
                            <div class="absolute -top-6 left-1/2 -translate-x-1/2 stat-badge animate-bounce">+17.8%</div>
                            <div class="bar-container mt-10">
                                <div class="bar-item h-[40%]"></div>
                                <div class="bar-item h-[65%]"></div>
                                <div class="bar-item h-[55%]"></div>
                                <div class="bar-item h-[100%] highlight"></div>
                                <div class="bar-item h-[80%]"></div>
                                <div class="bar-item h-[70%]"></div>
                            </div>
                            <div class="flex justify-between mt-4 px-2">
                                <span class="text-[9px] font-bold text-muted">JAN</span>
                                <span class="text-[9px] font-bold text-muted">FEB</span>
                                <span class="text-[9px] font-bold text-muted">MAR</span>
                                <span class="text-[9px] font-bold text-muted">APR</span>
                                <span class="text-[9px] font-bold text-muted">MAY</span>
                                <span class="text-[9px] font-bold text-muted">JUN</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity Table Card -->
                <div class="glass-card">
                    <div class="flex items-center justify-between mb-10">
                        <div>
                            <h4 class="text-sm font-bold text-main mb-1">Recent Platform Activity</h4>
                            <p class="text-xs text-muted">Latest system transactions and registrations</p>
                        </div>
                        <button onclick="location.href='bookings/'" class="text-muted hover:text-main"><span class="material-icons">north_east</span></button>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead>
                                <tr class="text-left border-b border-gray-100">
                                    <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Description</th>
                                    <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Date</th>
                                    <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Type</th>
                                    <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest">Status</th>
                                    <th class="pb-4 text-[10px] font-bold text-muted uppercase tracking-widest text-right">Value</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                                <tr class="group hover:bg-gray-50/50 transition-colors">
                                    <td class="py-5">
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                                                <span class="material-icons text-lg">explore</span>
                                            </div>
                                            <div>
                                                <p class="text-xs font-bold text-main">Everest Base Camp Trek</p>
                                                <p class="text-[9px] text-muted font-bold uppercase tracking-tighter">+2.45% Yield</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="py-5 text-xs font-bold text-muted">16 Jun 2026</td>
                                    <td class="py-5 text-xs font-bold text-muted">Booking</td>
                                    <td class="py-5">
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-emerald-500"></div>
                                            <span class="text-xs font-bold text-emerald-600">Successful</span>
                                        </div>
                                    </td>
                                    <td class="py-5 text-right text-xs font-bold text-main">NPR 45,200.00</td>
                                </tr>
                                <tr class="group hover:bg-gray-50/50 transition-colors">
                                    <td class="py-5">
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 rounded-full bg-orange-100 flex items-center justify-center text-orange-600">
                                                <span class="material-icons text-lg">business</span>
                                            </div>
                                            <div>
                                                <p class="text-xs font-bold text-main">Namaste Adventures</p>
                                                <p class="text-[9px] text-muted font-bold uppercase tracking-tighter">New Agency</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="py-5 text-xs font-bold text-muted">15 Jun 2026</td>
                                    <td class="py-5 text-xs font-bold text-muted">Registration</td>
                                    <td class="py-5">
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-yellow-500"></div>
                                            <span class="text-xs font-bold text-yellow-600">Pending Review</span>
                                        </div>
                                    </td>
                                    <td class="py-5 text-right text-xs font-bold text-main">--</td>
                                </tr>
                                <tr class="group hover:bg-gray-50/50 transition-colors">
                                    <td class="py-5">
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 rounded-full bg-purple-100 flex items-center justify-center text-purple-600">
                                                <span class="material-icons text-lg">rate_review</span>
                                            </div>
                                            <div>
                                                <p class="text-xs font-bold text-main">Customer Feedback #882</p>
                                                <p class="text-[9px] text-muted font-bold uppercase tracking-tighter">Moderation</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="py-5 text-xs font-bold text-muted">14 Jun 2026</td>
                                    <td class="py-5 text-xs font-bold text-muted">Review</td>
                                    <td class="py-5">
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-emerald-500"></div>
                                            <span class="text-xs font-bold text-emerald-600">Approved</span>
                                        </div>
                                    </td>
                                    <td class="py-5 text-right text-xs font-bold text-main">--</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="lg:col-span-4 space-y-8">
                
                <!-- Target Stat Card -->
                <div class="glass-card">
                    <div class="flex items-center justify-between mb-8">
                        <div>
                            <h4 class="text-xs font-bold text-muted uppercase tracking-widest mb-1">Booking Goal</h4>
                            <p class="text-[10px] text-muted">Total platform bookings target</p>
                        </div>
                        <button onclick="location.href='bookings/'" class="text-muted hover:text-main"><span class="material-icons">north_east</span></button>
                    </div>

                    <div class="text-center mb-6">
                        <p class="text-xs font-medium text-muted mb-1">Total Bookings</p>
                        <h2 class="text-4xl font-bold text-main tracking-tight"><%= String.format("%,d", bookings) %></h2>
                    </div>

                    <div class="relative h-20 mb-8">
                        <svg class="line-chart-svg" viewBox="0 0 100 20">
                            <defs>
                                <linearGradient id="line-gradient" x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="0%" stop-color="#047857" stop-opacity="0.5" />
                                    <stop offset="100%" stop-color="#047857" stop-opacity="0" />
                                </linearGradient>
                            </defs>
                            <path class="line-area" d="M0,20 L0,15 Q25,5 50,12 T100,8 L100,20 Z" />
                            <path class="line-path" d="M0,15 Q25,5 50,12 T100,8" />
                        </svg>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <button class="btn-green flex items-center justify-center gap-2">
                            <span class="material-icons text-sm">trending_up</span> Reports
                        </button>
                        <button class="btn-outline flex items-center justify-center gap-2 text-muted hover:text-main hover:bg-gray-50 transition-colors">
                            <span class="material-icons text-sm">settings</span> Config
                        </button>
                    </div>
                </div>

                <!-- Snapshot Stats -->
                <div class="glass-card">
                    <div class="flex items-center justify-between mb-10">
                        <div class="flex items-center gap-3" onclick="location.href='users/'" style="cursor: pointer;">
                            <span class="material-icons text-main">group</span>
                            <h4 class="text-sm font-bold text-main">User Snapshot</h4>
                        </div>
                        <div class="stat-badge">+12.8%</div>
                    </div>

                    <div class="space-y-8">
                        <div>
                            <p class="text-3xl font-bold text-main mb-2"><%= String.format("%,d", travellers) %></p>
                            <p class="text-[10px] font-bold text-muted uppercase tracking-widest">Active Travellers</p>
                        </div>
                        
                        <div class="pt-8 border-t border-gray-100">
                            <div class="flex items-center justify-between mb-4">
                                <h4 class="text-xs font-bold text-muted uppercase tracking-widest">Top Rated Agents</h4>
                                <button onclick="location.href='agencies/'" class="text-muted hover:text-main"><span class="material-icons text-lg">north_east</span></button>
                            </div>
                            <div class="flex items-center gap-[-8px]">
                                <img src="https://i.pravatar.cc/150?u=1" class="w-10 h-10 rounded-full border-4 border-white shadow-sm hover:z-10 transition-all cursor-pointer" alt="U1">
                                <img src="https://i.pravatar.cc/150?u=2" class="w-10 h-10 rounded-full border-4 border-white shadow-sm -ml-3 hover:z-10 transition-all cursor-pointer" alt="U2">
                                <img src="https://i.pravatar.cc/150?u=3" class="w-10 h-10 rounded-full border-4 border-white shadow-sm -ml-3 hover:z-10 transition-all cursor-pointer" alt="U3">
                                <img src="https://i.pravatar.cc/150?u=4" class="w-10 h-10 rounded-full border-4 border-white shadow-sm -ml-3 hover:z-10 transition-all cursor-pointer" alt="U4">
                                <div class="w-10 h-10 rounded-full border-4 border-white bg-emerald-600 flex items-center justify-center text-[10px] font-bold text-white -ml-3 shadow-sm cursor-pointer">+<%= agencies-4 %></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>
</div>

</body>
</html>
