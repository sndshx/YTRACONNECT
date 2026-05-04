<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.yatraconnect.model.HamroAgent" %>
        <jsp:include page="../includes/header.jsp" />
        <jsp:include page="../includes/navbar.jsp" />

        <% 
            HamroAgent agent = (HamroAgent) session.getAttribute("user"); 
            if (agent == null || !"agent".equals(session.getAttribute("role"))) { 
                response.sendRedirect(request.getContextPath() + "/login.jsp"); 
                return; 
            }
            
            Long totalListings = (Long) request.getAttribute("totalListings");
            Long pendingBookings = (Long) request.getAttribute("pendingBookings");
            Long activeBookings = (Long) request.getAttribute("activeBookings");
            Double totalRevenue = (Double) request.getAttribute("totalRevenue");
            List<com.yatraconnect.model.Booking> recentBookings = (List<com.yatraconnect.model.Booking>) request.getAttribute("bookings");
            
            if (totalListings == null) totalListings = 0L;
            if (pendingBookings == null) pendingBookings = 0L;
            if (activeBookings == null) activeBookings = 0L;
            if (totalRevenue == null) totalRevenue = 0.0;
        %>

        <%@ page import="com.yatraconnect.model.HamroAgent, com.yatraconnect.model.Booking, java.util.List" %>

            <section class="min-h-screen bg-[#07203B] pt-32 pb-20 px-4 md:px-8">
                <div class="max-w-7xl mx-auto">
                    <!-- Dashboard Header -->
                    <div class="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-12 fade-in-up">
                        <div>
                            <div class="flex items-center gap-3 mb-2">
                                <span
                                    class="px-3 py-1 rounded-full bg-accent/20 text-accent text-[10px] font-bold uppercase tracking-widest border border-accent/30">Agency
                                    Partner</span>
                                <% if(agent.isVerified()) { %>
                                    <span
                                        class="flex items-center gap-1 text-cyan-400 text-[10px] font-bold uppercase tracking-widest">
                                        <span class="material-icons text-sm">verified</span> Verified
                                    </span>
                                    <% } %>
                            </div>
                            <h1 class="text-4xl md:text-5xl font-serif font-bold text-white mb-2">Welcome, <%=
                                    agent.getCompanyName() %>
                            </h1>
                            <p class="text-white/50 font-light">Managing your Himalayan experiences and premium
                                bookings.</p>
                        </div>
                        <div class="flex items-center gap-4">
                            <button
                                class="px-6 py-3 bg-white/5 border border-white/10 rounded-xl text-white text-xs font-bold uppercase tracking-widest hover:bg-white/10 transition-all">
                                View Public Profile
                            </button>
                            <a href="packages?action=add"
                                class="px-6 py-3 bg-accent text-primary-dark rounded-xl text-xs font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all shadow-xl shadow-accent/10 no-underline">
                                Add New Listing
                            </a>
                        </div>
                    </div>

                    <!-- Statistics Grid -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-12 fade-in-up-delay-1">
                        <!-- Stat Card 1 -->
                        <div
                            class="bg-white/[0.03] border border-white/10 rounded-3xl p-8 backdrop-blur-xl relative overflow-hidden group">
                            <div
                                class="absolute top-0 right-0 p-6 text-accent/10 group-hover:text-accent/20 transition-colors">
                                <span class="material-icons text-6xl">list_alt</span>
                            </div>
                            <p class="text-white/40 text-[10px] font-black uppercase tracking-widest mb-2">Total
                                Listings</p>
                            <h3 class="text-3xl font-bold text-white mb-4"><%= totalListings %></h3>
                            <div class="flex items-center gap-2 text-cyan-400 text-[10px] font-bold">
                                <span class="material-icons text-sm">trending_up</span> +2 this month
                            </div>
                        </div>

                        <!-- Stat Card 2 -->
                        <div
                            class="bg-white/[0.03] border border-white/10 rounded-3xl p-8 backdrop-blur-xl relative overflow-hidden group">
                            <div
                                class="absolute top-0 right-0 p-6 text-accent/10 group-hover:text-accent/20 transition-colors">
                                <span class="material-icons text-6xl">pending_actions</span>
                            </div>
                            <p class="text-white/40 text-[10px] font-black uppercase tracking-widest mb-2">Pending
                                Requests</p>
                            <h3 class="text-3xl font-bold text-white mb-4"><%= String.format("%02d", pendingBookings) %></h3>
                            <div class="flex items-center gap-2 text-accent text-[10px] font-bold">
                                <span class="material-icons text-sm">priority_high</span> Attention required
                            </div>
                        </div>

                        <!-- Stat Card 3 -->
                        <div
                            class="bg-white/[0.03] border border-white/10 rounded-3xl p-8 backdrop-blur-xl relative overflow-hidden group">
                            <div
                                class="absolute top-0 right-0 p-6 text-accent/10 group-hover:text-accent/20 transition-colors">
                                <span class="material-icons text-6xl">confirmation_number</span>
                            </div>
                            <p class="text-white/40 text-[10px] font-black uppercase tracking-widest mb-2">Active
                                Bookings</p>
                            <h3 class="text-3xl font-bold text-white mb-4"><%= String.format("%02d", activeBookings) %></h3>
                            <div class="flex items-center gap-2 text-cyan-400 text-[10px] font-bold">
                                <span class="material-icons text-sm">check_circle</span> 98% Completion
                            </div>
                        </div>

                        <!-- Stat Card 4 -->
                        <div
                            class="bg-white/[0.03] border border-white/10 rounded-3xl p-8 backdrop-blur-xl relative overflow-hidden group">
                            <div
                                class="absolute top-0 right-0 p-6 text-accent/10 group-hover:text-accent/20 transition-colors">
                                <span class="material-icons text-6xl">payments</span>
                            </div>
                            <p class="text-white/40 text-[10px] font-black uppercase tracking-widest mb-2">Total Revenue
                            </p>
                            <h3 class="text-3xl font-bold text-white mb-4">$<%= String.format("%.1fk", totalRevenue / 1000.0) %></h3>
                            <div class="flex items-center gap-2 text-cyan-400 text-[10px] font-bold">
                                <span class="material-icons text-sm">trending_up</span> +15% vs last month
                            </div>
                        </div>
                    </div>

                    <!-- Main Dashboard Content -->
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 fade-in-up-delay-2">
                        <!-- Left Column: Recent Bookings -->
                        <div class="lg:col-span-8 space-y-8">
                            <div
                                class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] overflow-hidden backdrop-blur-xl">
                                <div class="px-8 py-6 border-b border-white/10 flex items-center justify-between">
                                    <h3 class="text-lg font-serif font-bold text-white">Recent Booking Requests</h3>
                                    <a href="bookings"
                                        class="text-[10px] font-bold text-accent uppercase tracking-widest hover:text-white transition-colors no-underline">View
                                        All</a>
                                </div>
                                <div class="overflow-x-auto">
                                    <table class="w-full text-left border-collapse">
                                        <thead>
                                            <tr class="border-b border-white/5 bg-white/[0.01]">
                                                <th
                                                    class="px-8 py-4 text-[10px] font-black text-white/40 uppercase tracking-widest">
                                                    Traveller</th>
                                                <th
                                                    class="px-8 py-4 text-[10px] font-black text-white/40 uppercase tracking-widest">
                                                    Experience</th>
                                                <th
                                                    class="px-8 py-4 text-[10px] font-black text-white/40 uppercase tracking-widest">
                                                    Date</th>
                                                <th
                                                    class="px-8 py-4 text-[10px] font-black text-white/40 uppercase tracking-widest">
                                                    Status</th>
                                                <th
                                                    class="px-8 py-4 text-[10px] font-black text-white/40 uppercase tracking-widest">
                                                    Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-white/70 text-sm">
                                            <% if (recentBookings != null && !recentBookings.isEmpty()) { 
                                                for (int i = 0; i < Math.min(recentBookings.size(), 5); i++) {
                                                    Booking booking = recentBookings.get(i);
                                            %>
                                            <tr class="border-b border-white/5 hover:bg-white/[0.02] transition-colors">
                                                <td class="px-8 py-6">
                                                    <div class="flex items-center gap-3">
                                                        <div class="w-10 h-10 rounded-full bg-accent/20 flex items-center justify-center text-accent text-xs font-bold">
                                                            <%= booking.getGuestName().substring(0, 1).toUpperCase() %>
                                                        </div>
                                                        <div>
                                                            <p class="text-white font-bold mb-0.5"><%= booking.getGuestName() %></p>
                                                            <p class="text-[10px] text-white/30 uppercase tracking-tighter">
                                                                <%= booking.getGuestEmail() %></p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-8 py-6"><%= booking.getBookingType() %></td>
                                                <td class="px-8 py-6"><%= booking.getStartDate() %></td>
                                                <td class="px-8 py-6">
                                                    <% String statusClass = "bg-accent/10 text-accent border-accent/20";
                                                       if ("confirmed".equals(booking.getStatus())) statusClass = "bg-cyan-400/10 text-cyan-400 border-cyan-400/20";
                                                       if ("cancelled".equals(booking.getStatus())) statusClass = "bg-red-500/10 text-red-400 border-red-500/20";
                                                    %>
                                                    <span class="px-3 py-1 rounded-full text-[9px] font-bold uppercase tracking-widest border <%= statusClass %>">
                                                        <%= booking.getStatus() %>
                                                    </span>
                                                </td>
                                                <td class="px-8 py-6">
                                                    <a href="booking-requests.jsp?id=<%= booking.getId() %>" class="text-white hover:text-accent transition-colors">
                                                        <span class="material-icons">more_horiz</span>
                                                    </a>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                            <tr>
                                                <td colspan="5" class="px-8 py-10 text-center text-white/30 italic">No recent bookings found.</td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Right Column: Quick Actions & Performance -->
                        <div class="lg:col-span-4 space-y-8">
                            <!-- Quick Actions -->
                            <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-8 backdrop-blur-xl">
                                <h3 class="text-lg font-serif font-bold text-white mb-6">Quick Actions</h3>
                                <div class="grid grid-cols-1 gap-4">
                                    <a href="packages?action=add"
                                        class="flex items-center gap-4 p-4 rounded-2xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/5 transition-all group no-underline">
                                        <div
                                            class="w-12 h-12 rounded-xl bg-accent/20 flex items-center justify-center text-accent group-hover:bg-accent group-hover:text-primary-dark transition-all">
                                            <span class="material-icons">add_box</span>
                                        </div>
                                        <div>
                                            <p class="text-white font-bold text-sm mb-0.5">Create Listing</p>
                                            <p class="text-[10px] text-white/40 uppercase tracking-widest">New
                                                experience</p>
                                        </div>
                                    </a>
                                    <a href="bookings"
                                        class="flex items-center gap-4 p-4 rounded-2xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/5 transition-all group no-underline">
                                        <div
                                            class="w-12 h-12 rounded-xl bg-cyan-400/20 flex items-center justify-center text-cyan-400 group-hover:bg-cyan-400 group-hover:text-primary-dark transition-all">
                                            <span class="material-icons">fact_check</span>
                                        </div>
                                        <div>
                                            <p class="text-white font-bold text-sm mb-0.5">Manage Requests</p>
                                            <p class="text-[10px] text-white/40 uppercase tracking-widest">Review
                                                bookings</p>
                                        </div>
                                    </a>
                                    <a href="guides"
                                        class="flex items-center gap-4 p-4 rounded-2xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/5 transition-all group no-underline">
                                        <div
                                            class="w-12 h-12 rounded-xl bg-orange-500/20 flex items-center justify-center text-orange-400 group-hover:bg-orange-500 group-hover:text-white transition-all">
                                            <span class="material-icons">hiking</span>
                                        </div>
                                        <div>
                                            <p class="text-white font-bold text-sm mb-0.5">Manage Guides</p>
                                            <p class="text-[10px] text-white/40 uppercase tracking-widest">Assign experts</p>
                                        </div>
                                    </a>
                                    <a href="messages"
                                        class="flex items-center gap-4 p-4 rounded-2xl bg-white/[0.05] hover:bg-white/[0.1] border border-white/5 transition-all group no-underline">
                                        <div
                                            class="w-12 h-12 rounded-xl bg-purple-500/20 flex items-center justify-center text-purple-400 group-hover:bg-purple-500 group-hover:text-white transition-all">
                                            <span class="material-icons">forum</span>
                                        </div>
                                        <div>
                                            <p class="text-white font-bold text-sm mb-0.5">Inbox</p>
                                            <p class="text-[10px] text-white/40 uppercase tracking-widest">3 new
                                                messages</p>
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <!-- Agency Performance -->
                            <div
                                class="bg-gradient-to-br from-accent/20 to-transparent border border-accent/20 rounded-[2.5rem] p-8 backdrop-blur-xl">
                                <div class="flex items-center justify-between mb-6">
                                    <h3 class="text-lg font-serif font-bold text-white">Trust Score</h3>
                                    <span class="text-accent font-black text-2xl">9.8</span>
                                </div>
                                <div class="space-y-4 mb-6">
                                    <div class="h-2 w-full bg-white/5 rounded-full overflow-hidden">
                                        <div class="h-full w-[98%] bg-accent shadow-[0_0_10px_#C5A059]"></div>
                                    </div>
                                    <p class="text-white/40 text-[10px] font-bold uppercase tracking-widest">Excellent
                                        standing in elite collection</p>
                                </div>
                                <div class="pt-6 border-t border-white/10">
                                    <div class="flex items-center gap-3 text-white/60">
                                        <span class="material-icons text-accent">stars</span>
                                        <span class="text-xs font-light italic">"Top Rated Agency 2026"</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            </body>
            </html>