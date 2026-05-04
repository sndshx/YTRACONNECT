<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroTraveller" %>
<%
    HamroTraveller user = (HamroTraveller) session.getAttribute("user");
    if (user == null || !"traveller".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="min-h-screen bg-[#0F281E] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <!-- Header -->
        <div class="flex flex-col lg:flex-row lg:items-end justify-between gap-12 mb-16 fade-in-up">
            <div class="space-y-6">
                <div class="flex items-center gap-3 text-[#C5A059]">
                    <a href="dashboard.jsp" class="text-[10px] font-black uppercase tracking-[0.3em] hover:text-white transition-all no-underline">Portal</a>
                    <span class="material-icons text-xs opacity-30">chevron_right</span>
                    <span class="text-[10px] font-black uppercase tracking-[0.3em] text-white/40">My Journeys</span>
                </div>
                <h1 class="text-5xl md:text-7xl font-serif font-bold text-white leading-tight">Your <span class="italic text-[#C5A059]">Legacy</span></h1>
                <p class="text-white/40 font-light text-lg max-w-2xl leading-relaxed">A visual chronicle of your Himalayan expeditions. Track your upcoming departures and relive your most legendary moments.</p>
            </div>
            
            <div class="flex items-center gap-4">
                <div class="px-8 py-4 bg-white/5 border border-white/10 rounded-2xl text-center">
                    <p class="text-[9px] font-black text-[#C5A059] uppercase tracking-widest mb-1">Total Expeditions</p>
                    <p class="text-2xl font-bold text-white">08</p>
                </div>
            </div>
        </div>

        <!-- Advanced Filter & Search -->
        <div class="flex flex-col md:flex-row items-center justify-between gap-8 mb-12 fade-in-up-delay-1 overflow-x-auto no-scrollbar">
            <div class="flex items-center gap-4">
                <button class="px-10 py-4 rounded-2xl bg-[#C5A059] text-primary text-[10px] font-black uppercase tracking-widest shadow-2xl shadow-[#C5A059]/20 whitespace-nowrap">Active Trips</button>
                <button class="px-10 py-4 rounded-2xl bg-white/5 border border-white/5 text-white/40 hover:text-white transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Completed</button>
                <button class="px-10 py-4 rounded-2xl bg-white/5 border border-white/5 text-white/40 hover:text-white transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Planned</button>
            </div>
        </div>

        <!-- Bookings List -->
        <div class="space-y-12 fade-in-up-delay-2">
            <!-- Featured Booking Card -->
            <div class="group bg-white/[0.03] border border-white/5 rounded-[4rem] overflow-hidden backdrop-blur-xl hover:border-[#C5A059]/30 transition-all duration-700 shadow-[0_50px_100px_-20px_rgba(0,0,0,0.5)]">
                <div class="flex flex-col lg:flex-row">
                    <!-- Media Section -->
                    <div class="lg:w-[40%] h-96 lg:h-auto relative overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?q=80&w=1200" 
                             class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-[3s]" alt="Expedition">
                        <div class="absolute inset-0 bg-gradient-to-r from-[#0F281E]/80 via-[#0F281E]/20 to-transparent"></div>
                        
                        <!-- Status Overlays -->
                        <div class="absolute top-10 left-10 flex flex-col gap-3">
                            <span class="px-5 py-2 rounded-full bg-emerald-500 text-white text-[9px] font-black uppercase tracking-[0.2em] shadow-2xl">Departure Confirmed</span>
                            <span class="px-5 py-2 rounded-full bg-white/10 backdrop-blur-md text-white text-[9px] font-black uppercase tracking-[0.2em] border border-white/20">Booking ID: YC-8829</span>
                        </div>
                        
                        <!-- QR Quick Link -->
                        <div class="absolute bottom-10 left-10 p-4 bg-white/10 backdrop-blur-xl rounded-3xl border border-white/20 group-hover:bg-white group-hover:text-primary transition-all duration-500 cursor-pointer">
                            <span class="material-icons text-3xl">qr_code_2</span>
                        </div>
                    </div>
                    
                    <div class="flex-1 p-12 lg:p-20">
                        <div class="flex flex-col md:flex-row justify-between items-start gap-10 mb-12">
                            <div class="space-y-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-[1px] bg-[#C5A059]"></span>
                                    <p class="text-[10px] text-[#C5A059] font-black uppercase tracking-[0.4em]">Trekking Adventure</p>
                                </div>
                                <h3 class="text-4xl md:text-5xl font-serif font-bold text-white tracking-tight">Everest Base Camp <br><span class="italic text-[#C5A059]">Luxury Trek</span></h3>
                                <p class="text-white/40 text-sm font-medium flex items-center gap-3">
                                    <span class="material-icons text-lg text-[#C5A059]">location_on</span> Solu-Khumbu, Everest Region
                                </p>
                            </div>
                            <div class="bg-white/5 border border-white/5 p-8 rounded-[2.5rem] text-center min-w-[180px]">
                                <p class="text-[9px] text-white/20 font-black uppercase tracking-widest mb-2">Investment</p>
                                <p class="text-3xl font-serif font-bold text-white">$1,450</p>
                                <p class="text-[8px] text-emerald-500 font-black uppercase mt-1">Fully Paid</p>
                            </div>
                        </div>

                        <!-- Trip Timeline -->
                        <div class="relative py-12 mb-12">
                            <div class="absolute top-1/2 left-0 w-full h-[1px] bg-white/5"></div>
                            <div class="absolute top-1/2 left-0 w-3/4 h-[1px] bg-[#C5A059] shadow-[0_0_15px_rgba(197,160,89,0.5)]"></div>
                            <div class="relative flex justify-between">
                                <div class="bg-[#0F281E] p-1"><div class="w-3 h-3 rounded-full bg-[#C5A059]"></div></div>
                                <div class="bg-[#0F281E] p-1"><div class="w-3 h-3 rounded-full bg-[#C5A059]"></div></div>
                                <div class="bg-[#0F281E] p-1"><div class="w-3 h-3 rounded-full bg-[#C5A059]"></div></div>
                                <div class="bg-[#0F281E] p-1"><div class="w-3 h-3 rounded-full bg-white/10 border border-white/20"></div></div>
                            </div>
                            <div class="flex justify-between mt-4">
                                <span class="text-[8px] text-[#C5A059] font-black uppercase tracking-widest">Booked</span>
                                <span class="text-[8px] text-[#C5A059] font-black uppercase tracking-widest">Confirmed</span>
                                <span class="text-[8px] text-[#C5A059] font-black uppercase tracking-widest">Prepped</span>
                                <span class="text-[8px] text-white/20 font-black uppercase tracking-widest">Depart</span>
                            </div>
                        </div>

                        <div class="grid grid-cols-2 md:grid-cols-4 gap-12 pt-12 border-t border-white/5 mb-12">
                            <div>
                                <p class="text-[9px] text-white/20 font-black uppercase tracking-widest mb-2">Departure</p>
                                <p class="text-white font-bold text-base">May 15, 2026</p>
                            </div>
                            <div>
                                <p class="text-[9px] text-white/20 font-black uppercase tracking-widest mb-2">Duration</p>
                                <p class="text-white font-bold text-base">14 Days</p>
                            </div>
                            <div>
                                <p class="text-[9px] text-white/20 font-black uppercase tracking-widest mb-2">Group</p>
                                <p class="text-white font-bold text-base">02 Persons</p>
                            </div>
                            <div>
                                <p class="text-[9px] text-white/20 font-black uppercase tracking-widest mb-2">Lead Guide</p>
                                <p class="text-[#C5A059] font-bold text-base">Pasang Sherpa</p>
                            </div>
                        </div>

                        <div class="flex flex-wrap items-center gap-6">
                            <button class="px-12 py-5 bg-[#C5A059] text-primary rounded-2xl text-[10px] font-black uppercase tracking-widest hover:scale-105 transition-all shadow-2xl shadow-[#C5A059]/20">Expedition Portal</button>
                            <button class="px-12 py-5 bg-white/5 border border-white/10 text-white rounded-2xl text-[10px] font-black uppercase tracking-widest hover:bg-white hover:text-primary transition-all">Download Kit</button>
                            <button class="ml-auto w-16 h-16 rounded-2xl bg-white/5 flex items-center justify-center text-white/20 hover:text-white transition-all"><span class="material-icons">more_horiz</span></button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Past Journey Section -->
            <div class="mt-24 space-y-8">
                <div class="flex items-center gap-6 mb-12">
                    <h4 class="text-2xl font-serif font-bold text-white tracking-tight">Recent <span class="italic text-[#C5A059]">Memories</span></h4>
                    <div class="flex-1 h-[1px] bg-white/5"></div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="bg-white/[0.02] border border-white/5 rounded-[3rem] p-10 backdrop-blur-xl flex items-center justify-between hover:bg-white/5 transition-all group">
                        <div class="flex items-center gap-8">
                            <div class="w-20 h-20 rounded-[1.5rem] overflow-hidden">
                                <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=400" class="w-full h-full object-cover grayscale group-hover:grayscale-0 transition-all duration-700" alt="Hotel">
                            </div>
                            <div>
                                <h5 class="text-white font-bold text-lg mb-1">Dwarika's Heritage stay</h5>
                                <p class="text-[9px] text-white/20 font-black uppercase tracking-widest">Completed Dec 2025 • Verified</p>
                            </div>
                        </div>
                        <button class="px-8 py-3 rounded-xl bg-white/5 border border-white/10 text-[#C5A059] text-[9px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-primary transition-all">Review</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
