<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.yatraconnect.model.HamroTraveller" %>
        <% HamroTraveller user=(HamroTraveller) session.getAttribute("user"); if (user==null ||
            !"traveller".equals(session.getAttribute("role"))) { response.sendRedirect(request.getContextPath()
            + "/login.jsp" ); return; } %>
            <jsp:include page="../includes/header.jsp" />
            <jsp:include page="../includes/navbar.jsp" />

            <style>
                .glass-card {
                    background: rgba(255, 255, 255, 0.03);
                    backdrop-filter: blur(20px);
                    border: 1px border rgba(255, 255, 255, 0.05);
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                }

                .accent-glow {
                    box-shadow: 0 0 30px rgba(197, 160, 89, 0.2);
                }

                .custom-scrollbar::-webkit-scrollbar {
                    width: 4px;
                }

                .custom-scrollbar::-webkit-scrollbar-track {
                    background: transparent;
                }

                .custom-scrollbar::-webkit-scrollbar-thumb {
                    background: rgba(197, 160, 89, 0.3);
                    border-radius: 10px;
                }
            </style>

            <section class="relative min-h-screen bg-[#0F281E] pt-32 pb-20 overflow-hidden">
                <!-- Cinematic Background -->
                <div class="absolute inset-0 z-0 pointer-events-none">
                    <div
                        class="absolute top-0 right-0 w-[800px] h-[800px] bg-[#C5A059]/5 rounded-full blur-[150px] -translate-y-1/2 translate-x-1/2">
                    </div>
                    <div
                        class="absolute bottom-0 left-0 w-[600px] h-[600px] bg-[#C5A059]/5 rounded-full blur-[120px] translate-y-1/2 -translate-x-1/2">
                    </div>
                </div>

                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
                    <!-- Header Section -->
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-8 mb-12 fade-in-up">
                        <div class="space-y-4">
                            <div class="flex items-center gap-4">
                                <div class="h-[1px] w-8 bg-[#C5A059]"></div>
                                <span class="text-[#C5A059] text-[10px] font-bold tracking-[0.4em] uppercase">Elite
                                    Member Portal</span>
                            </div>
                            <h1 class="text-4xl md:text-6xl font-serif font-bold text-white tracking-tight">
                                Namaste, <span class="text-[#C5A059] italic">
                                    <%= user.getFullName() %>
                                </span>
                            </h1>
                            <p class="text-white/50 font-light text-sm max-w-lg">Welcome to your private travel
                                collection. Manage your itineraries, track your bookings, and plan your next Himalayan
                                conquest.</p>
                        </div>

                        <div class="flex items-center gap-4">
                            <div
                                class="glass-card px-6 py-4 rounded-2xl flex items-center gap-4 border border-white/5 shadow-2xl">
                                <div
                                    class="w-12 h-12 rounded-full bg-[#C5A059]/10 flex items-center justify-center text-[#C5A059] border border-[#C5A059]/20">
                                    <span class="material-icons">account_balance_wallet</span>
                                </div>
                                <div class="flex flex-col">
                                    <span class="text-[9px] font-bold text-white/40 uppercase tracking-widest">Active
                                        Credits</span>
                                    <span class="text-white font-serif font-black text-xl">$1,250.00</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
                        <!-- Sidebar Navigation -->
                        <div class="lg:col-span-3 space-y-4 fade-in-up-delay-1">
                            <div class="glass-card rounded-[2rem] p-4 border border-white/5">
                                <nav class="space-y-1">
                                    <a href="dashboard.jsp"
                                        class="flex items-center gap-4 px-6 py-4 rounded-2xl bg-[#C5A059] text-primary shadow-lg transition-all duration-300 no-underline group">
                                        <span class="material-icons text-xl">dashboard</span>
                                        <span class="text-[11px] font-black uppercase tracking-widest">Overview</span>
                                    </a>
                                    <a href="profile.jsp"
                                        class="flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all duration-300 no-underline group">
                                        <span class="material-icons text-xl">person_outline</span>
                                        <span class="text-[11px] font-black uppercase tracking-widest">My Profile</span>
                                    </a>
                                    <a href="my-bookings.jsp"
                                        class="flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all duration-300 no-underline group">
                                        <span class="material-icons text-xl">flight_takeoff</span>
                                        <span class="text-[11px] font-black uppercase tracking-widest">My
                                            Bookings</span>
                                    </a>
                                    <a href="../wishlist"
                                        class="flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all duration-300 no-underline group">
                                        <span class="material-icons text-xl">favorite_border</span>
                                        <span class="text-[11px] font-black uppercase tracking-widest">Wishlist</span>
                                    </a>
                                    <a href="messages.jsp"
                                        class="flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all duration-300 no-underline group">
                                        <span class="material-icons text-xl">chat_bubble_outline</span>
                                        <span class="text-[11px] font-black uppercase tracking-widest">Concierge</span>
                                    </a>
                                    <a href="settings.jsp"
                                        class="flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all duration-300 no-underline group">
                                        <span class="material-icons text-xl">settings</span>
                                        <span class="text-[11px] font-black uppercase tracking-widest">Settings</span>
                                    </a>
                                </nav>
                            </div>

                            <!-- Stats Summary -->
                            <div class="glass-card rounded-[2rem] p-8 border border-white/5 relative overflow-hidden">
                                <div class="absolute -bottom-4 -right-4 text-[#C5A059]/5 select-none">
                                    <span class="material-icons text-9xl">landscape</span>
                                </div>
                                <h3 class="text-white/40 text-[10px] font-bold uppercase tracking-[0.3em] mb-6">
                                    Adventure Stats</h3>
                                <div class="space-y-6 relative z-10">
                                    <div class="flex items-center justify-between">
                                        <span class="text-white/70 text-xs font-light">Completed Trips</span>
                                        <span class="text-[#C5A059] font-black">12</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <span class="text-white/70 text-xs font-light">Miles Traveled</span>
                                        <span class="text-[#C5A059] font-black">4,520 km</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <span class="text-white/70 text-xs font-light">Reviews Written</span>
                                        <span class="text-[#C5A059] font-black">8</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Main Dashboard Content -->
                        <div class="lg:col-span-9 space-y-8 fade-in-up-delay-2">
                            <!-- Recent Bookings Section -->
                            <div class="glass-card rounded-[2.5rem] p-8 md:p-10 border border-white/5">
                                <div class="flex items-center justify-between mb-8">
                                    <div class="flex items-center gap-3">
                                        <div
                                            class="w-10 h-10 rounded-xl bg-white/5 flex items-center justify-center text-[#C5A059]">
                                            <span class="material-icons">history</span>
                                        </div>
                                        <h2 class="text-xl font-serif font-bold text-white">Recent Bookings</h2>
                                    </div>
                                    <a href="my-bookings.jsp"
                                        class="text-[10px] font-black text-[#C5A059] uppercase tracking-widest hover:text-white transition-colors no-underline">View
                                        All</a>
                                </div>

                                <div id="bookingList"
                                    class="space-y-4 custom-scrollbar max-h-[600px] overflow-y-auto pr-2">
                                    <!-- Loading State -->
                                    <div
                                        class="flex flex-col items-center justify-center py-20 animate-pulse text-white/20">
                                        <span class="material-icons text-5xl mb-4">cached</span>
                                        <span class="text-[10px] font-black uppercase tracking-widest">Consulting the
                                            records...</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Quick Actions / Recommendations -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                <div
                                    class="glass-card rounded-[2rem] p-8 border border-white/5 relative group cursor-pointer overflow-hidden transition-all hover:scale-[1.02]">
                                    <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?q=80&w=800"
                                        class="absolute inset-0 w-full h-full object-cover opacity-20 transition-transform duration-700 group-hover:scale-110"
                                        alt="Everest">
                                    <div
                                        class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent">
                                    </div>
                                    <div class="relative z-10 flex flex-col h-full justify-end">
                                        <span
                                            class="text-[#C5A059] text-[9px] font-bold uppercase tracking-widest mb-2">New
                                            Arrival</span>
                                        <h3 class="text-xl font-serif font-bold text-white mb-2 leading-tight">Luxury
                                            Everest <br>Base Camp Trek</h3>
                                        <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking"
                                            class="mt-4 flex items-center gap-2 text-[10px] font-black text-white uppercase tracking-widest no-underline group/btn">
                                            Explore Detail <span
                                                class="material-icons text-sm transition-transform group-hover/btn:translate-x-1">arrow_forward</span>
                                        </a>
                                    </div>
                                </div>
                                <div
                                    class="glass-card rounded-[2rem] p-8 border border-white/5 flex flex-col items-center justify-center text-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-white/5 flex items-center justify-center text-[#C5A059] mb-6 border border-white/10 accent-glow">
                                        <span class="material-icons text-3xl">add_location_alt</span>
                                    </div>
                                    <h3 class="text-lg font-serif font-bold text-white mb-2">Plan a Custom Trip</h3>
                                    <p class="text-white/50 text-xs font-light mb-6">Can't find what you're looking for?
                                        Let our elite concierges craft a bespoke journey.</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking"
                                        class="bg-[#C5A059] text-primary px-8 py-3 rounded-full text-[10px] font-black uppercase tracking-widest shadow-xl transition-all hover:scale-105 active:scale-95 no-underline">Start
                                        Planning</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <script>
                async function loadBookings() {
                    const bookingList = document.getElementById('bookingList');
                    try {
                        const response = await fetch('<%= request.getContextPath() %>/api/bookings/');
                        if (!response.ok) throw new Error('Failed to fetch');
                        const bookings = await response.json();

                        if (bookings.length === 0) {
                            bookingList.innerHTML = `
                    <div class="flex flex-col items-center justify-center py-20 text-center">
                        <span class="material-icons text-white/10 text-6xl mb-4">upcoming</span>
                        <h3 class="text-white/60 font-serif text-lg mb-2">No expeditions yet</h3>
                        <p class="text-white/30 text-xs font-light max-w-xs">Your future adventures are waiting to be claimed. Start exploring the Himalayas today.</p>
                        <a href="${pageContext.request.contextPath}/explore.jsp" class="mt-8 text-[10px] font-black text-[#C5A059] uppercase tracking-widest border-b border-[#C5A059]/30 pb-1 hover:border-[#C5A059] transition-all no-underline">Browse Experiences</a>
                    </div>
                `;
                            return;
                        }

                        bookingList.innerHTML = bookings.map(booking => `
                <div class="group bg-white/5 hover:bg-white/10 border border-white/5 rounded-2xl p-6 transition-all duration-300 flex flex-col md:flex-row items-center justify-between gap-6">
                    <div class="flex items-center gap-6 w-full md:w-auto">
                        <div class="w-14 h-14 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center text-[#C5A059] shrink-0">
                            <span class="material-icons">\${booking.bookingType === 'hotel' ? 'hotel' : 'hiking'}</span>
                        </div>
                        <div class="flex flex-col gap-1 overflow-hidden">
                            <div class="flex items-center gap-2">
                                <span class="text-[9px] font-black text-[#C5A059] uppercase tracking-widest">\${booking.tripStatus || 'PENDING'}</span>
                                <span class="text-white/20">•</span>
                                <span class="text-white/40 text-[9px] font-bold uppercase tracking-widest">ID: \${booking.id.substring(0, 8)}</span>
                            </div>
                            <h3 class="text-white font-bold text-base truncate">\${booking.listingTitle || 'Trip Expedition'}</h3>
                            <div class="flex items-center gap-4 mt-1">
                                <div class="flex items-center gap-1.5 text-white/50">
                                    <span class="material-icons text-sm">calendar_today</span>
                                    <span class="text-[10px] font-medium">\${booking.startDate}</span>
                                </div>
                                <div class="flex items-center gap-1.5 text-white/50">
                                    <span class="material-icons text-sm">payments</span>
                                    <span class="text-[10px] font-medium">$\${booking.totalAmount}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center gap-3 w-full md:w-auto justify-end">
                        <button class="flex-1 md:flex-none px-6 py-2.5 rounded-xl border border-white/10 text-white/60 text-[9px] font-black uppercase tracking-widest hover:bg-white/5 hover:text-white transition-all">Details</button>
                        <button class="flex-1 md:flex-none px-6 py-2.5 rounded-xl bg-[#C5A059]/10 text-[#C5A059] text-[9px] font-black uppercase tracking-widest border border-[#C5A059]/20 hover:bg-[#C5A059] hover:text-primary transition-all">Support</button>
                    </div>
                </div>
            `).join('');

                    } catch (error) {
                        console.error('Error:', error);
                        bookingList.innerHTML = '<div class="text-red-400 text-center py-10">Failed to load expeditions. Please try again.</div>';
                    }
                }

                document.addEventListener('DOMContentLoaded', loadBookings);
            </script>

            </body>
            </html>