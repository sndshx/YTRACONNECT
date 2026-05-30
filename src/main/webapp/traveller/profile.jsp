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

<section class="min-h-screen bg-[#0F281E] pb-20">
    <!-- Cinematic Cover -->
    <div class="relative h-[45vh] w-full overflow-hidden">
        <img src="https://images.unsplash.com/photo-1501555088652-021faa106b9b?q=80&w=2600" 
             class="w-full h-full object-cover" alt="Himalayan Cover">
        <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
        
        <!-- Floating Stats -->
        <div class="absolute bottom-12 left-0 w-full px-4 md:px-8">
            <div class="max-w-7xl mx-auto flex items-end justify-between">
                <div class="flex items-center gap-8 fade-in-up">
                    <div class="relative">
                        <form id="profileUploadForm" action="<%= request.getContextPath() %>/uploadProfileImage" method="POST" enctype="multipart/form-data" class="hidden">
                            <input type="file" id="profileImageInput" name="profileImage" accept="image/*" onchange="document.getElementById('profileUploadForm').submit();">
                        </form>
                        <div class="w-32 h-32 md:w-40 md:h-40 rounded-[2.5rem] border-4 border-[#C5A059] p-1 bg-[#0F281E] shadow-2xl overflow-hidden shadow-[#C5A059]/20">
                            <img src="<%= (user.getProfileImage() != null && !user.getProfileImage().isEmpty()) ? user.getProfileImage() : "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=400" %>" 
                                 class="w-full h-full rounded-[2rem] object-cover" alt="Avatar">
                        </div>
                        <button onclick="document.getElementById('profileImageInput').click();" class="absolute -bottom-2 -right-2 w-10 h-10 bg-[#C5A059] rounded-xl text-primary flex items-center justify-center shadow-xl hover:scale-110 transition-all cursor-pointer z-10">
                            <span class="material-icons text-sm">photo_camera</span>
                        </button>
                    </div>
                    <div class="mb-4">
                        <div class="flex items-center gap-3 mb-2">
                            <span class="px-3 py-1 rounded-full bg-[#C5A059]/20 text-[#C5A059] text-[9px] font-black uppercase tracking-widest border border-[#C5A059]/30">Elite Explorer</span>
                            <span class="flex items-center gap-1 text-cyan-400 text-[9px] font-black uppercase tracking-widest">
                                <span class="material-icons text-xs">verified</span> Verified Traveller
                            </span>
                        </div>
                        <h1 class="text-4xl md:text-5xl font-serif font-bold text-white mb-1"><%= user.getFullName() %></h1>
                        <p class="text-white/60 font-light text-sm italic"><%= user.getEmail() %></p>
                    </div>
                </div>
                <div class="hidden md:flex items-center gap-8 mb-4 fade-in-up-delay-1">
                    <div class="text-center">
                        <p class="text-3xl font-serif font-bold text-[#C5A059]">12</p>
                        <p class="text-[9px] text-white/30 uppercase font-black tracking-widest">Expeditions</p>
                    </div>
                    <div class="w-px h-12 bg-white/10"></div>
                    <div class="text-center">
                        <p class="text-3xl font-serif font-bold text-[#C5A059]">48</p>
                        <p class="text-[9px] text-white/30 uppercase font-black tracking-widest">Days in Mountains</p>
                    </div>
                    <div class="w-px h-12 bg-white/10"></div>
                    <div class="text-center">
                        <p class="text-3xl font-serif font-bold text-[#C5A059]">8</p>
                        <p class="text-[9px] text-white/30 uppercase font-black tracking-widest">Reviews</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="max-w-7xl mx-auto px-4 md:px-8 mt-12">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">
            
            <!-- Left: Detailed Info -->
            <div class="lg:col-span-8 space-y-12 fade-in-up-delay-2">
                
                <!-- Personal Dossier -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-10 backdrop-blur-xl shadow-2xl relative overflow-hidden">
                    <div class="absolute top-0 right-0 p-10 opacity-5 pointer-events-none">
                        <span class="material-icons text-9xl text-[#C5A059]">person</span>
                    </div>
                    
                    <div class="flex items-center justify-between mb-10">
                        <h3 class="text-2xl font-serif font-bold text-white">Personal <span class="italic text-[#C5A059]">Dossier</span></h3>
                        <button class="px-6 py-2.5 bg-white/5 border border-white/10 rounded-xl text-white/60 text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-primary transition-all">Edit Details</button>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-y-10 gap-x-16">
                        <div class="space-y-8">
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-[#C5A059] transition-colors">Full Name</p>
                                <p class="text-white text-base font-medium font-serif tracking-wide border-b border-white/5 pb-2"><%= user.getFullName() %></p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-[#C5A059] transition-colors">Official Email</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2"><%= user.getEmail() %></p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-[#C5A059] transition-colors">Contact Number</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2"><%= (user.getContactNumber() != null) ? user.getContactNumber() : "+977 XXX XXXXXX" %></p>
                            </div>
                        </div>
                        <div class="space-y-8">
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-[#C5A059] transition-colors">Nationality</p>
                                <p class="text-white text-base font-medium font-serif tracking-wide border-b border-white/5 pb-2">Nepalese</p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-[#C5A059] transition-colors">Date of Birth</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2">May 24, 1995</p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-[#C5A059] transition-colors">Home Address</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2">Kathmandu, Nepal</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Travel Preferences -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-10 backdrop-blur-xl shadow-2xl">
                    <h3 class="text-2xl font-serif font-bold text-white mb-10">Adventure <span class="italic text-[#C5A059]">Profile</span></h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                        <div class="bg-white/5 rounded-3xl p-6 border border-white/5 hover:border-[#C5A059]/30 transition-all group">
                            <div class="w-10 h-10 rounded-xl bg-[#C5A059]/10 flex items-center justify-center text-[#C5A059] mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-icons text-sm">landscape</span>
                            </div>
                            <p class="text-[9px] font-black text-white/40 uppercase tracking-widest mb-1">Style</p>
                            <p class="text-white font-bold text-sm">Luxury Trekking</p>
                        </div>
                        <div class="bg-white/5 rounded-3xl p-6 border border-white/5 hover:border-[#C5A059]/30 transition-all group">
                            <div class="w-10 h-10 rounded-xl bg-cyan-400/10 flex items-center justify-center text-cyan-400 mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-icons text-sm">restaurant</span>
                            </div>
                            <p class="text-[9px] font-black text-white/40 uppercase tracking-widest mb-1">Dietary</p>
                            <p class="text-white font-bold text-sm">Vegetarian</p>
                        </div>
                        <div class="bg-white/5 rounded-3xl p-6 border border-white/5 hover:border-[#C5A059]/30 transition-all group">
                            <div class="w-10 h-10 rounded-xl bg-purple-500/10 flex items-center justify-center text-purple-400 mb-4 group-hover:scale-110 transition-transform">
                                <span class="material-icons text-sm">medical_services</span>
                            </div>
                            <p class="text-[9px] font-black text-white/40 uppercase tracking-widest mb-1">Fitness</p>
                            <p class="text-white font-bold text-sm">Advanced Elite</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Settings & Quick View -->
            <div class="lg:col-span-4 space-y-12 fade-in-up-delay-3">
                
                <!-- Account Security -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-8 backdrop-blur-xl shadow-2xl">
                    <h4 class="text-lg font-serif font-bold text-white mb-6">Security & <span class="text-[#C5A059]">Privacy</span></h4>
                    <div class="space-y-4">
                        <button class="w-full flex items-center justify-between p-4 rounded-2xl bg-white/5 border border-white/5 hover:bg-white/10 transition-all group text-left">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 rounded-xl bg-white/5 flex items-center justify-center text-white/40">
                                    <span class="material-icons text-sm">lock_reset</span>
                                </div>
                                <div>
                                    <p class="text-white font-bold text-xs">Update Password</p>
                                    <p class="text-[9px] text-white/30 uppercase tracking-widest">Last changed 2 months ago</p>
                                </div>
                            </div>
                            <span class="material-icons text-white/20 group-hover:text-[#C5A059] transition-colors">chevron_right</span>
                        </button>
                        <button class="w-full flex items-center justify-between p-4 rounded-2xl bg-white/5 border border-white/5 hover:bg-white/10 transition-all group text-left">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 rounded-xl bg-cyan-400/10 flex items-center justify-center text-cyan-400">
                                    <span class="material-icons text-sm">shield</span>
                                </div>
                                <div>
                                    <p class="text-white font-bold text-xs">Two-Factor Auth</p>
                                    <p class="text-[9px] text-cyan-400 font-bold uppercase tracking-widest">Currently Active</p>
                                </div>
                            </div>
                            <span class="material-icons text-white/20 group-hover:text-[#C5A059] transition-colors">chevron_right</span>
                        </button>
                    </div>
                </div>

                <!-- Next Destination -->
                <div class="bg-gradient-to-br from-[#C5A059]/20 to-transparent border border-[#C5A059]/20 rounded-[3rem] p-8 backdrop-blur-xl relative overflow-hidden group cursor-pointer">
                    <div class="relative z-10">
                        <div class="flex items-center gap-3 mb-6">
                            <span class="material-icons text-[#C5A059]">explore</span>
                            <h4 class="text-lg font-serif font-bold text-white leading-tight">Recommended for <br>Your Next Journey</h4>
                        </div>
                        <div class="bg-[#0F281E]/40 rounded-2xl p-4 mb-6 border border-white/5">
                            <p class="text-white font-serif font-bold text-base mb-1">Mardi Himal Base Camp</p>
                            <p class="text-[9px] text-white/50 uppercase tracking-widest font-black">7 Days • Luxury Expedition</p>
                        </div>
                        <a href="<%= request.getContextPath() %>/explore.jsp" class="text-[10px] font-black text-[#C5A059] uppercase tracking-[0.2em] no-underline flex items-center gap-2 group-hover:gap-4 transition-all">
                            Discover Now <span class="material-icons text-xs">arrow_forward</span>
                        </a>
                    </div>
                </div>

                <!-- Support Concierge -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-10 backdrop-blur-xl text-center">
                    <div class="w-16 h-16 rounded-full bg-white/5 flex items-center justify-center text-[#C5A059] mx-auto mb-6 border border-white/5">
                        <span class="material-icons text-3xl">support_agent</span>
                    </div>
                    <h4 class="text-white font-serif font-bold text-lg mb-2">Need Assistance?</h4>
                    <p class="text-white/40 font-light text-xs mb-8">Our elite concierge service is available 24/7 to assist with your travel needs.</p>
                    <a href="messages.jsp" class="inline-block px-8 py-3 bg-white/5 border border-white/10 text-white text-[10px] font-black uppercase tracking-widest rounded-full hover:bg-white hover:text-primary transition-all no-underline">Contact Concierge</a>
                </div>

            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
