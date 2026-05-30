<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroAgent" %>
<%
    HamroAgent agent = (HamroAgent) session.getAttribute("user");
    if (agent == null || !"agent".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="min-h-screen bg-[#07203B] pb-20">
    <!-- Cinematic Cover -->
    <div class="relative h-[45vh] w-full overflow-hidden">
        <img src="<%= (agent.getCoverImage() != null && !agent.getCoverImage().isEmpty()) ? agent.getCoverImage() : "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=2600" %>" 
             class="w-full h-full object-cover" alt="Himalayan Cover">
        <div class="absolute inset-0 bg-gradient-to-t from-[#07203B] via-[#07203B]/40 to-transparent"></div>
        
        <!-- Floating Stats -->
        <div class="absolute bottom-12 left-0 w-full px-4 md:px-8">
            <div class="max-w-7xl mx-auto flex items-end justify-between">
                <div class="flex items-center gap-8 fade-in-up">
                    <div class="relative">
                        <form id="profileUploadForm" action="<%= request.getContextPath() %>/uploadProfileImage" method="POST" enctype="multipart/form-data" class="hidden">
                            <input type="file" id="profileImageInput" name="profileImage" accept="image/*" onchange="document.getElementById('profileUploadForm').submit();">
                        </form>
                        <div class="w-32 h-32 md:w-40 md:h-40 rounded-[2.5rem] border-4 border-accent p-1 bg-[#07203B] shadow-2xl overflow-hidden shadow-accent/20">
                            <img src="<%= (agent.getProfileImage() != null && !agent.getProfileImage().isEmpty()) ? agent.getProfileImage() : "https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=400" %>" 
                                 class="w-full h-full rounded-[2rem] object-cover" alt="Avatar">
                        </div>
                        <button onclick="document.getElementById('profileImageInput').click();" class="absolute -bottom-2 -right-2 w-10 h-10 bg-accent rounded-xl text-primary-dark flex items-center justify-center shadow-xl hover:scale-110 transition-all cursor-pointer z-10">
                            <span class="material-icons text-sm">photo_camera</span>
                        </button>
                    </div>
                    <div class="mb-4">
                        <div class="flex items-center gap-3 mb-2">
                            <span class="px-3 py-1 rounded-full bg-accent/20 text-accent text-[9px] font-black uppercase tracking-widest border border-accent/30">Premium Partner</span>
                            <% if(agent.isVerified()) { %>
                            <span class="flex items-center gap-1 text-cyan-400 text-[9px] font-black uppercase tracking-widest">
                                <span class="material-icons text-xs">verified</span> Verified Agency
                            </span>
                            <% } %>
                        </div>
                        <h1 class="text-4xl md:text-5xl font-serif font-bold text-white mb-1"><%= agent.getCompanyName() %></h1>
                        <p class="text-white/60 font-light text-sm italic"><%= agent.getEmail() %></p>
                    </div>
                </div>
                <div class="hidden md:flex items-center gap-8 mb-4 fade-in-up-delay-1">
                    <div class="text-center">
                        <p class="text-3xl font-serif font-bold text-accent">12</p>
                        <p class="text-[9px] text-white/30 uppercase font-black tracking-widest">Packages</p>
                    </div>
                    <div class="w-px h-12 bg-white/10"></div>
                    <div class="text-center">
                        <p class="text-3xl font-serif font-bold text-accent">9.8</p>
                        <p class="text-[9px] text-white/30 uppercase font-black tracking-widest">Rating</p>
                    </div>
                    <div class="w-px h-12 bg-white/10"></div>
                    <div class="text-center">
                        <p class="text-3xl font-serif font-bold text-accent">1.4k</p>
                        <p class="text-[9px] text-white/30 uppercase font-black tracking-widest">Bookings</p>
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
                        <span class="material-icons text-9xl text-accent">business</span>
                    </div>
                    
                    <div class="flex items-center justify-between mb-10">
                        <h3 class="text-2xl font-serif font-bold text-white">Agency <span class="italic text-accent">Dossier</span></h3>
                        <button onclick="document.getElementById('editProfileModal').classList.remove('hidden')" class="px-6 py-2.5 bg-white/5 border border-white/10 rounded-xl text-white/60 text-[10px] font-black uppercase tracking-widest hover:bg-accent hover:text-primary-dark transition-all">Edit Details</button>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-y-10 gap-x-16">
                        <div class="space-y-8">
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-accent transition-colors">Legal Company Name</p>
                                <p class="text-white text-base font-medium font-serif tracking-wide border-b border-white/5 pb-2"><%= agent.getLegalCompanyName() != null ? agent.getLegalCompanyName() : agent.getCompanyName() %></p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-accent transition-colors">Official Email</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2"><%= agent.getEmail() %></p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-accent transition-colors">Contact Number</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2"><%= (agent.getPhoneNo() != null) ? agent.getPhoneNo() : "+977 XXX XXXXXX" %></p>
                            </div>
                        </div>
                        <div class="space-y-8">
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-accent transition-colors">PAN Number</p>
                                <p class="text-white text-base font-medium font-serif tracking-wide border-b border-white/5 pb-2"><%= agent.getPanNumber() != null ? agent.getPanNumber() : "Not Provided" %></p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-accent transition-colors">Headquarters</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2"><%= agent.getLocation() != null ? agent.getLocation() : "Kathmandu, Nepal" %></p>
                            </div>
                            <div class="group">
                                <p class="text-[9px] text-white/30 font-black uppercase tracking-widest mb-2 group-hover:text-accent transition-colors">Website</p>
                                <p class="text-white text-base font-medium tracking-wide border-b border-white/5 pb-2"><%= agent.getWebsite() != null ? agent.getWebsite() : "www.yatraconnect.com" %></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Agency Profile/Bio -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-10 backdrop-blur-xl shadow-2xl">
                    <h3 class="text-2xl font-serif font-bold text-white mb-6">About the <span class="italic text-accent">Agency</span></h3>
                    <p class="text-white/60 font-light leading-relaxed mb-10">
                        <%= (agent.getBio() != null && !agent.getBio().isEmpty()) ? agent.getBio() : "No bio available. Add a description to attract more premium travellers." %>
                    </p>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <div class="bg-white/5 rounded-3xl p-6 border border-white/5 hover:border-accent/30 transition-all group cursor-pointer">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-10 h-10 rounded-xl bg-accent/10 flex items-center justify-center text-accent group-hover:scale-110 transition-transform">
                                    <span class="material-icons text-sm">description</span>
                                </div>
                                <span class="material-icons text-cyan-400 text-sm">task_alt</span>
                            </div>
                            <p class="text-[9px] font-black text-white/40 uppercase tracking-widest mb-1">Registration</p>
                            <p class="text-white font-bold text-sm">Business License Document</p>
                        </div>
                        <div class="bg-white/5 rounded-3xl p-6 border border-white/5 hover:border-accent/30 transition-all group cursor-pointer">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-10 h-10 rounded-xl bg-cyan-400/10 flex items-center justify-center text-cyan-400 group-hover:scale-110 transition-transform">
                                    <span class="material-icons text-sm">badge</span>
                                </div>
                                <span class="material-icons text-cyan-400 text-sm">task_alt</span>
                            </div>
                            <p class="text-[9px] font-black text-white/40 uppercase tracking-widest mb-1">Owner Identity</p>
                            <p class="text-white font-bold text-sm">Citizenship / Identity Proof</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Settings & Quick View -->
            <div class="lg:col-span-4 space-y-12 fade-in-up-delay-3">
                
                <!-- Account Security -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-8 backdrop-blur-xl shadow-2xl">
                    <h4 class="text-lg font-serif font-bold text-white mb-6">Security & <span class="text-accent">Privacy</span></h4>
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
                            <span class="material-icons text-white/20 group-hover:text-accent transition-colors">chevron_right</span>
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
                            <span class="material-icons text-white/20 group-hover:text-accent transition-colors">chevron_right</span>
                        </button>
                    </div>
                </div>

                <!-- Enhancement Tips -->
                <div class="bg-gradient-to-br from-accent/20 to-transparent border border-accent/20 rounded-[3rem] p-8 backdrop-blur-xl relative overflow-hidden group cursor-pointer">
                    <div class="relative z-10">
                        <div class="flex items-center gap-3 mb-6">
                            <span class="material-icons text-accent">lightbulb</span>
                            <h4 class="text-lg font-serif font-bold text-white leading-tight">Enhance Your <br>Presence</h4>
                        </div>
                        <p class="text-white/60 font-light text-sm leading-relaxed mb-6">
                            Agencies with verified documentation and high-quality cover images receive 4x more booking requests. Ensure your bio highlights your unique expertise.
                        </p>
                        <a href="#" class="text-[10px] font-black text-accent uppercase tracking-[0.2em] no-underline flex items-center gap-2 group-hover:gap-4 transition-all">
                            Upgrade Profile <span class="material-icons text-xs">arrow_forward</span>
                        </a>
                    </div>
                </div>

                <!-- Support Concierge -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[3rem] p-10 backdrop-blur-xl text-center">
                    <div class="w-16 h-16 rounded-full bg-white/5 flex items-center justify-center text-accent mx-auto mb-6 border border-white/5">
                        <span class="material-icons text-3xl">support_agent</span>
                    </div>
                    <h4 class="text-white font-serif font-bold text-lg mb-2">Agency Support</h4>
                    <p class="text-white/40 font-light text-xs mb-8">Our dedicated partner support team is available 24/7 to assist with your business needs.</p>
                    <a href="messages.jsp" class="inline-block px-8 py-3 bg-white/5 border border-white/10 text-white text-[10px] font-black uppercase tracking-widest rounded-full hover:bg-white hover:text-primary-dark transition-all no-underline">Contact Partner Support</a>
                </div>

            </div>
        </div>
    </div>

    <!-- Edit Profile Modal -->
    <div id="editProfileModal" class="fixed inset-0 z-[150] flex items-center justify-center px-4 hidden">
        <div class="absolute inset-0 bg-[#07203B]/90 backdrop-blur-md" onclick="this.parentElement.classList.add('hidden')"></div>
        <div class="bg-[#0A1A2F] border border-white/10 rounded-[3rem] w-full max-w-4xl relative z-10 overflow-hidden shadow-[0_50px_100px_-20px_rgba(0,0,0,0.5)] fade-in-up">
            
            <div class="px-12 py-10 bg-white/[0.02] border-b border-white/5 flex items-center justify-between">
                <div>
                    <h3 class="text-3xl font-serif font-bold text-white leading-none mb-3">Update <span class="text-accent italic">Dossier</span></h3>
                    <p class="text-white/40 text-[10px] font-black uppercase tracking-[0.3em]">Configure elite agency offerings</p>
                </div>
                <button onclick="document.getElementById('editProfileModal').classList.add('hidden')" class="w-12 h-12 rounded-full bg-white/5 flex items-center justify-center text-white/40 hover:text-white transition-all">
                    <span class="material-icons">close</span>
                </button>
            </div>

            <form action="<%= request.getContextPath() %>/agency/profile/" method="POST" class="max-h-[70vh] overflow-y-auto custom-scrollbar">
                <div class="p-12 space-y-8">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <div>
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Agency Brand Name</label>
                            <input type="text" name="companyName" value="<%= agent.getCompanyName() != null ? agent.getCompanyName() : "" %>" required class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                        </div>
                        <div>
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Legal Company Name</label>
                            <input type="text" name="legalCompanyName" value="<%= agent.getLegalCompanyName() != null ? agent.getLegalCompanyName() : "" %>" required class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                        </div>
                        <div>
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Company Owner / Rep Name</label>
                            <input type="text" name="fullName" value="<%= agent.getFullName() != null ? agent.getFullName() : "" %>" required class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                        </div>
                        <div>
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Contact Phone</label>
                            <input type="text" name="phone" value="<%= agent.getPhoneNo() != null ? agent.getPhoneNo() : "" %>" required class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                        </div>
                        <div>
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Headquarters</label>
                            <input type="text" name="location" value="<%= agent.getLocation() != null ? agent.getLocation() : "" %>" required class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                        </div>
                        <div>
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Website URL</label>
                            <input type="text" name="website" value="<%= agent.getWebsite() != null ? agent.getWebsite() : "" %>" class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Agency Biography & Expertise</label>
                            <textarea name="bio" rows="4" class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all"><%= agent.getBio() != null ? agent.getBio() : "" %></textarea>
                        </div>
                    </div>
                </div>

                <div class="px-12 py-10 bg-white/[0.02] border-t border-white/5 flex gap-6">
                    <button type="button" onclick="document.getElementById('editProfileModal').classList.add('hidden')" class="flex-1 h-16 rounded-[1.25rem] border border-white/10 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-white/5 transition-all">Cancel</button>
                    <button type="submit" class="flex-[2] h-16 bg-accent text-primary-dark rounded-[1.25rem] text-[11px] font-black uppercase tracking-[0.2em] hover:bg-white hover:scale-[1.02] active:scale-[0.98] transition-all shadow-2xl shadow-accent/20">Save Details</button>
                </div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
