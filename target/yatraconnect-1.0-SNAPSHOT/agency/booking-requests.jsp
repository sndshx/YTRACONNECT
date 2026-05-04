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
            List<com.yatraconnect.model.Booking> bookings = (List<com.yatraconnect.model.Booking>) request.getAttribute("bookings");
            String successMessage = (String) session.getAttribute("successMessage");
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (successMessage != null) session.removeAttribute("successMessage");
            if (errorMessage != null) session.removeAttribute("errorMessage");

            long pendingCount = (bookings != null) ? bookings.stream().filter(b -> "confirmed".equals(b.getStatus()) && "pending".equals(b.getTripStatus())).count() : 0;
            long totalCount = (bookings != null) ? bookings.size() : 0;
        %>

        <%@ page import="com.yatraconnect.model.HamroAgent, com.yatraconnect.model.Booking, java.util.List" %>

<section class="min-h-screen bg-[#07203B] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12 fade-in-up">
            <div class="space-y-4">
                <div class="flex items-center gap-2 text-accent">
                    <a href="dashboard.jsp" class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Dashboard</a>
                    <span class="material-icons text-xs">chevron_right</span>
                    <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-white/40">Booking Requests</span>
                </div>
                <h1 class="text-4xl md:text-5xl font-serif font-bold text-white leading-tight">Booking <span class="italic text-accent">Requests</span></h1>
                <p class="text-white/50 font-light max-w-xl">Review and manage travel reservations from your premium clients across Nepal's elite destinations.</p>
            </div>
            
            <!-- Quick Stats -->
            <div class="flex items-center gap-8 bg-white/[0.03] border border-white/10 rounded-2xl px-8 py-6 backdrop-blur-xl">
                <div class="text-center">
                    <p class="text-[10px] font-black text-white/40 uppercase tracking-widest mb-1">New</p>
                    <p class="text-2xl font-bold text-accent"><%= String.format("%02d", pendingCount) %></p>
                </div>
                <div class="w-px h-10 bg-white/10"></div>
                <div class="text-center">
                    <p class="text-[10px] font-black text-white/40 uppercase tracking-widest mb-1">Total</p>
                    <p class="text-2xl font-bold text-white"><%= String.format("%02d", totalCount) %></p>
                </div>
            </div>
        </div>

        <!-- Filters Section -->
        <div class="flex flex-wrap items-center justify-between gap-6 mb-8 fade-in-up-delay-1">
            <div class="flex items-center gap-1 overflow-x-auto no-scrollbar bg-white/[0.02] border border-white/10 p-1.5 rounded-full backdrop-blur-md">
                <button class="px-6 py-2.5 rounded-full bg-accent text-primary-dark text-[10px] font-black uppercase tracking-widest shadow-[0_0_15px_rgba(197,160,89,0.3)] transition-all whitespace-nowrap flex items-center gap-2">
                    All Requests
                </button>
                <button class="px-6 py-2.5 rounded-full text-white/50 hover:text-white hover:bg-white/5 text-[10px] font-black uppercase tracking-widest transition-all whitespace-nowrap flex items-center gap-2">
                    Pending <span class="bg-yellow-500 text-black px-1.5 py-0.5 rounded-full text-[8px] font-black leading-none">1</span>
                </button>
                <button class="px-6 py-2.5 rounded-full text-white/50 hover:text-white hover:bg-white/5 text-[10px] font-black uppercase tracking-widest transition-all whitespace-nowrap flex items-center gap-2">
                    Confirmed <span class="bg-cyan-400 text-black px-1.5 py-0.5 rounded-full text-[8px] font-black leading-none">1</span>
                </button>
                <button class="px-6 py-2.5 rounded-full text-white/50 hover:text-white hover:bg-white/5 text-[10px] font-black uppercase tracking-widest transition-all whitespace-nowrap flex items-center gap-2">
                    Completed <span class="bg-white/20 text-white px-1.5 py-0.5 rounded-full text-[8px] font-black leading-none">1</span>
                </button>
            </div>
            
            <div class="relative w-full md:w-72">
                <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/30 text-sm">search</span>
                <input type="text" placeholder="Search by traveller or package..." 
                    class="w-full bg-white/5 border border-white/10 rounded-full py-3 pl-12 pr-4 text-xs text-white focus:outline-none focus:border-accent transition-all placeholder-white/20">
            </div>
        </div>

        <!-- Main Requests Table -->
        <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] overflow-hidden backdrop-blur-xl fade-in-up-delay-2 shadow-2xl">
            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b border-white/10 bg-white/[0.02]">
                            <th class="px-8 py-5 text-[10px] font-black text-white/30 uppercase tracking-widest">Traveller Details</th>
                            <th class="px-8 py-5 text-[10px] font-black text-white/30 uppercase tracking-widest">Experience / Package</th>
                            <th class="px-8 py-5 text-[10px] font-black text-white/30 uppercase tracking-widest text-center">Guests</th>
                            <th class="px-8 py-5 text-[10px] font-black text-white/30 uppercase tracking-widest">Scheduled Date</th>
                            <th class="px-8 py-5 text-[10px] font-black text-white/30 uppercase tracking-widest">Status</th>
                            <th class="px-8 py-5 text-[10px] font-black text-white/30 uppercase tracking-widest text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-white/5">
                        <% if (bookings != null && !bookings.isEmpty()) { 
                            for (Booking booking : bookings) {
                                String statusColor = "yellow-500";
                                if ("confirmed".equals(booking.getStatus())) statusColor = "cyan-400";
                                if ("cancelled".equals(booking.getStatus())) statusColor = "red-500";
                        %>
                        <tr class="group hover:bg-white/[0.02] transition-all relative">
                            <div class="absolute left-0 top-0 bottom-0 w-1 bg-<%= statusColor %> opacity-0 group-hover:opacity-100 transition-opacity"></div>
                            <td class="px-8 py-8">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-2xl bg-<%= statusColor %>/20 flex items-center justify-center text-<%= statusColor %> font-black text-sm border border-<%= statusColor %>/20">
                                        <%= booking.getGuestName().substring(0, 1).toUpperCase() %>
                                    </div>
                                    <div>
                                        <p class="text-white font-bold text-sm mb-0.5"><%= booking.getGuestName() %></p>
                                        <p class="text-[10px] text-white/40 uppercase tracking-widest"><%= booking.getGuestEmail() %></p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-8 py-8">
                                <p class="text-white font-bold text-sm mb-1"><%= booking.getBookingType() %></p>
                                <div class="flex items-center gap-2 text-<%= statusColor %>/80">
                                    <span class="material-icons text-[10px]">event_note</span>
                                    <span class="text-[9px] font-black uppercase tracking-widest">ID: <%= booking.getSerialId() != null ? booking.getSerialId() : "N/A" %></span>
                                </div>
                            </td>
                            <td class="px-8 py-8 text-center">
                                <span class="px-3 py-1 rounded-lg bg-white/5 text-white font-bold text-xs"><%= String.format("%02d", booking.getRoomCount()) %></span>
                            </td>
                            <td class="px-8 py-8">
                                <p class="text-white text-sm font-medium"><%= booking.getStartDate() %></p>
                                <p class="text-[10px] text-white/30 uppercase tracking-widest">Scheduled Visit</p>
                            </td>
                            <td class="px-8 py-8">
                                <div class="flex flex-col gap-1">
                                    <div class="flex items-center gap-2">
                                        <div class="w-2 h-2 rounded-full bg-<%= statusColor %> <%= "pending".equals(booking.getStatus()) ? "animate-pulse" : "" %> shadow-[0_0_10px_rgba(234,179,8,0.5)]"></div>
                                        <span class="text-<%= statusColor %> text-[10px] font-bold uppercase tracking-widest"><%= booking.getStatus() %></span>
                                    </div>
                                    <span class="text-[9px] text-white/40 uppercase tracking-widest ml-4">
                                        <%= "active".equals(booking.getTripStatus()) ? "Trip Ongoing" : booking.getTripStatus() %>
                                    </span>
                                </div>
                            </td>
                            <td class="px-8 py-8">
                                <div class="flex items-center justify-end gap-3 opacity-0 group-hover:opacity-100 transition-all translate-x-4 group-hover:translate-x-0">
                                    <% if ("pending".equals(booking.getStatus()) || "confirmed".equals(booking.getStatus())) { %>
                                    <form action="bookings" method="POST" class="m-0">
                                        <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
                                        <% if (!"confirmed".equals(booking.getStatus())) { %>
                                        <button type="submit" name="action" value="accept" class="flex items-center gap-2 px-4 py-2.5 rounded-xl bg-accent text-primary-dark font-black text-[9px] uppercase tracking-widest hover:scale-105 transition-all shadow-[0_0_15px_rgba(197,160,89,0.3)]">
                                            <span class="material-icons text-sm">check_circle</span> Accept
                                        </button>
                                        <% } %>
                                        <% if (!"cancelled".equals(booking.getStatus())) { %>
                                        <button type="submit" name="action" value="decline" class="flex items-center gap-2 px-4 py-2.5 rounded-xl bg-red-500/10 border border-red-500/20 text-red-400 font-black text-[9px] uppercase tracking-widest hover:bg-red-500 hover:text-white transition-all">
                                            <span class="material-icons text-sm">cancel</span> Decline
                                        </button>
                                        <% } %>
                                    </form>
                                    <% } %>
                                </div>
                            </td>
                        </tr>
                        <% } } else { %>
                        <tr>
                            <td colspan="6" class="px-8 py-20 text-center">
                                <div class="w-16 h-16 rounded-full bg-white/5 flex items-center justify-center mx-auto mb-6 text-white/20">
                                    <span class="material-icons text-3xl">event_busy</span>
                                </div>
                                <p class="text-white/40 text-sm font-medium">No booking requests found.</p>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination / Footer -->
            <div class="px-8 py-6 bg-white/[0.01] border-t border-white/10 flex items-center justify-between">
                <p class="text-[10px] text-white/30 font-black uppercase tracking-widest">Showing 3 of 124 requests</p>
                <div class="flex items-center gap-4">
                    <button class="w-10 h-10 rounded-xl bg-white/5 border border-white/10 text-white/40 flex items-center justify-center cursor-not-allowed">
                        <span class="material-icons">chevron_left</span>
                    </button>
                    <button class="w-10 h-10 rounded-xl bg-white/5 border border-white/10 text-white flex items-center justify-center hover:bg-white/10 transition-all">
                        <span class="material-icons">chevron_right</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
