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
                    <span class="text-[10px] font-black uppercase tracking-[0.3em] text-white/40">Preparation Guide</span>
                </div>
                <h1 class="text-5xl md:text-7xl font-serif font-bold text-white leading-tight">Expedition <span class="italic text-[#C5A059]">Prep</span></h1>
                <p class="text-white/40 font-light text-lg max-w-2xl leading-relaxed">The ultimate checklist for your Himalayan journey. Ensure your gear and documents are as ready as your spirit.</p>
            </div>
            
            <!-- Progress Circle (Visual) -->
            <div class="flex items-center gap-6 p-8 bg-white/5 border border-white/10 rounded-[2.5rem] backdrop-blur-md">
                <div class="relative w-20 h-20">
                    <svg class="w-full h-full transform -rotate-90">
                        <circle cx="40" cy="40" r="36" stroke="currentColor" stroke-width="8" fill="transparent" class="text-white/5" />
                        <circle cx="40" cy="40" r="36" stroke="currentColor" stroke-width="8" fill="transparent" stroke-dasharray="226" stroke-dashoffset="67" class="text-[#C5A059]" />
                    </svg>
                    <div class="absolute inset-0 flex items-center justify-center">
                        <span class="text-white font-bold text-lg">70%</span>
                    </div>
                </div>
                <div>
                    <p class="text-white font-bold text-sm">Readiness Score</p>
                    <p class="text-white/40 text-[10px] uppercase tracking-widest font-black">Almost ready to fly</p>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">
            <!-- Checklist Categories -->
            <div class="lg:col-span-2 space-y-12 fade-in-up-delay-1">
                <!-- Category: Essential Gear -->
                <div class="bg-white/[0.02] border border-white/5 rounded-[3rem] p-10 backdrop-blur-xl">
                    <div class="flex items-center gap-4 mb-8">
                        <div class="w-12 h-12 rounded-2xl bg-[#C5A059]/20 flex items-center justify-center text-[#C5A059]">
                            <span class="material-icons">hiking</span>
                        </div>
                        <h2 class="text-2xl font-serif font-bold text-white tracking-tight">Essential Gear</h2>
                    </div>
                    
                    <div class="space-y-4">
                        <label class="flex items-center gap-5 p-5 rounded-2xl border border-white/5 hover:bg-white/5 transition-all cursor-pointer group">
                            <input type="checkbox" checked class="w-6 h-6 rounded-lg bg-white/5 border-white/10 text-[#C5A059] focus:ring-0 transition-all cursor-pointer">
                            <div class="flex-1">
                                <p class="text-white font-bold text-sm group-hover:text-[#C5A059] transition-colors">Broken-in Trekking Boots</p>
                                <p class="text-white/30 text-[10px]">High-cut with good ankle support</p>
                            </div>
                        </label>
                        
                        <label class="flex items-center gap-5 p-5 rounded-2xl border border-white/5 hover:bg-white/5 transition-all cursor-pointer group">
                            <input type="checkbox" class="w-6 h-6 rounded-lg bg-white/5 border-white/10 text-[#C5A059] focus:ring-0 transition-all cursor-pointer">
                            <div class="flex-1">
                                <p class="text-white font-bold text-sm group-hover:text-[#C5A059] transition-colors">Down Jacket (-15°C Rated)</p>
                                <p class="text-white/30 text-[10px]">Essential for high altitude evenings</p>
                            </div>
                        </label>
                        
                        <label class="flex items-center gap-5 p-5 rounded-2xl border border-white/5 hover:bg-white/5 transition-all cursor-pointer group">
                            <input type="checkbox" checked class="w-6 h-6 rounded-lg bg-white/5 border-white/10 text-[#C5A059] focus:ring-0 transition-all cursor-pointer">
                            <div class="flex-1">
                                <p class="text-white font-bold text-sm group-hover:text-[#C5A059] transition-colors">Trekking Poles (Pair)</p>
                                <p class="text-white/30 text-[10px]">Collapsible and lightweight</p>
                            </div>
                        </label>
                    </div>
                </div>

                <!-- Category: Critical Documents -->
                <div class="bg-white/[0.02] border border-white/5 rounded-[3rem] p-10 backdrop-blur-xl">
                    <div class="flex items-center gap-4 mb-8">
                        <div class="w-12 h-12 rounded-2xl bg-cyan-500/20 flex items-center justify-center text-cyan-400">
                            <span class="material-icons">description</span>
                        </div>
                        <h2 class="text-2xl font-serif font-bold text-white tracking-tight">Critical Documents</h2>
                    </div>
                    
                    <div class="space-y-4">
                        <label class="flex items-center gap-5 p-5 rounded-2xl border border-white/5 hover:bg-white/5 transition-all cursor-pointer group">
                            <input type="checkbox" checked class="w-6 h-6 rounded-lg bg-white/5 border-white/10 text-cyan-400 focus:ring-0 transition-all cursor-pointer">
                            <div class="flex-1">
                                <p class="text-white font-bold text-sm group-hover:text-cyan-400 transition-colors">TIMS Card & National Park Permits</p>
                                <p class="text-white/30 text-[10px]">Your agency usually handles this</p>
                            </div>
                        </label>
                        
                        <label class="flex items-center gap-5 p-5 rounded-2xl border border-white/5 hover:bg-white/5 transition-all cursor-pointer group">
                            <input type="checkbox" checked class="w-6 h-6 rounded-lg bg-white/5 border-white/10 text-cyan-400 focus:ring-0 transition-all cursor-pointer">
                            <div class="flex-1">
                                <p class="text-white font-bold text-sm group-hover:text-cyan-400 transition-colors">Travel Insurance Policy</p>
                                <p class="text-white/30 text-[10px]">Must cover emergency helicopter rescue</p>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <!-- Expert Advice Sidebar -->
            <div class="space-y-8 fade-in-up-delay-2">
                <div class="bg-gradient-to-br from-[#C5A059] to-[#8B7344] rounded-[3rem] p-10 text-primary relative overflow-hidden group">
                    <span class="material-icons absolute -right-4 -bottom-4 text-9xl opacity-10 group-hover:scale-110 transition-transform">lightbulb</span>
                    <h3 class="text-2xl font-serif font-bold mb-6">Expert Himalayan Tips</h3>
                    <div class="space-y-8">
                        <div>
                            <p class="font-black uppercase text-[10px] tracking-widest mb-2 opacity-60">Acclimatization</p>
                            <p class="text-sm leading-relaxed font-medium">Never skip acclimatization days. Drink 4-5 liters of water daily to combat altitude sickness.</p>
                        </div>
                        <div>
                            <p class="font-black uppercase text-[10px] tracking-widest mb-2 opacity-60">Cash is King</p>
                            <p class="text-sm leading-relaxed font-medium">ATMs are non-existent on the trails. Carry enough NPR for charging, showers, and WiFi.</p>
                        </div>
                        <button class="w-full py-4 bg-primary text-white rounded-2xl text-[10px] font-black uppercase tracking-widest hover:scale-105 transition-all shadow-2xl">Read Full Guide</button>
                    </div>
                </div>
                
                <div class="bg-white/5 border border-white/10 rounded-[3rem] p-10">
                    <h4 class="text-white font-bold mb-6 flex items-center gap-3">
                        <span class="material-icons text-sm text-[#C5A059]">bolt</span> Quick Actions
                    </h4>
                    <div class="grid grid-cols-2 gap-4">
                        <button class="flex flex-col items-center justify-center gap-3 p-6 rounded-2xl bg-white/5 hover:bg-white/10 transition-all">
                            <span class="material-icons text-white/40">print</span>
                            <span class="text-[8px] text-white font-bold uppercase tracking-widest">Print List</span>
                        </button>
                        <button class="flex flex-col items-center justify-center gap-3 p-6 rounded-2xl bg-white/5 hover:bg-white/10 transition-all">
                            <span class="material-icons text-white/40">ios_share</span>
                            <span class="text-[8px] text-white font-bold uppercase tracking-widest">Sync Mobile</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
