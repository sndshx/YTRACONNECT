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
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-8 mb-12 fade-in-up">
            <div class="space-y-4">
                <div class="flex items-center gap-2 text-[#C5A059]">
                    <a href="dashboard.jsp" class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Dashboard</a>
                    <span class="material-icons text-xs">chevron_right</span>
                    <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-white/40">Account Settings</span>
                </div>
                <h1 class="text-4xl md:text-5xl font-serif font-bold text-white tracking-tight">Personal <span class="italic text-[#C5A059]">Preferences</span></h1>
                <p class="text-white/40 font-light text-sm max-w-xl">Customize your profile, secure your account, and manage how you experience YatraConnect.</p>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">
            <!-- Sidebar Navigation -->
            <div class="lg:col-span-3 space-y-4 fade-in-up-delay-1">
                <div class="glass-card rounded-[2.5rem] p-4 border border-white/5 backdrop-blur-xl">
                    <nav class="space-y-1">
                        <button class="w-full flex items-center gap-4 px-6 py-4 rounded-2xl bg-[#C5A059] text-primary shadow-lg transition-all text-left">
                            <span class="material-icons text-xl">person</span>
                            <span class="text-[11px] font-black uppercase tracking-widest">Profile</span>
                        </button>
                        <button class="w-full flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all text-left group">
                            <span class="material-icons text-xl">security</span>
                            <span class="text-[11px] font-black uppercase tracking-widest">Security</span>
                        </button>
                        <button class="w-full flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all text-left group">
                            <span class="material-icons text-xl">notifications</span>
                            <span class="text-[11px] font-black uppercase tracking-widest">Notifications</span>
                        </button>
                        <button class="w-full flex items-center gap-4 px-6 py-4 rounded-2xl text-white/60 hover:bg-white/5 hover:text-white transition-all text-left group">
                            <span class="material-icons text-xl">payment</span>
                            <span class="text-[11px] font-black uppercase tracking-widest">Billing</span>
                        </button>
                    </nav>
                </div>
            </div>

            <!-- Content Area -->
            <div class="lg:col-span-9 space-y-12 fade-in-up-delay-2">
                
                <!-- Profile Section -->
                <div class="glass-card rounded-[3rem] p-10 border border-white/5 backdrop-blur-xl shadow-2xl relative overflow-hidden">
                    <div class="flex items-center justify-between mb-10">
                        <h3 class="text-2xl font-serif font-bold text-white">Public <span class="italic text-[#C5A059]">Profile</span></h3>
                        <button class="px-8 py-3 bg-[#C5A059] text-primary rounded-xl text-[10px] font-black uppercase tracking-widest hover:scale-105 transition-all shadow-xl shadow-[#C5A059]/20">Save Changes</button>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                        <!-- Avatar Upload -->
                        <div class="flex flex-col items-center justify-center p-8 border-2 border-dashed border-white/10 rounded-[2.5rem] bg-white/5 group hover:border-[#C5A059]/50 transition-all cursor-pointer">
                            <div class="relative mb-6">
                                <img src="https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=200" 
                                     class="w-32 h-32 rounded-full object-cover border-4 border-white/10 group-hover:border-[#C5A059]/50 transition-all" alt="Avatar">
                                <div class="absolute inset-0 rounded-full bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-all">
                                    <span class="material-icons text-white">photo_camera</span>
                                </div>
                            </div>
                            <p class="text-[10px] font-black text-[#C5A059] uppercase tracking-widest">Update Photo</p>
                        </div>

                        <!-- Form Fields -->
                        <div class="space-y-6">
                            <div class="space-y-2">
                                <label class="text-[9px] font-black text-white/40 uppercase tracking-widest ml-1">Display Name</label>
                                <input type="text" value="<%= user.getFullName() %>" 
                                       class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-sm text-white focus:border-[#C5A059] outline-none transition-all">
                            </div>
                            <div class="space-y-2">
                                <label class="text-[9px] font-black text-white/40 uppercase tracking-widest ml-1">Email Address</label>
                                <input type="email" value="<%= user.getEmail() %>" disabled
                                       class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-sm text-white/30 outline-none cursor-not-allowed">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Security Section -->
                <div class="glass-card rounded-[3rem] p-10 border border-white/5 backdrop-blur-xl shadow-2xl">
                    <h3 class="text-2xl font-serif font-bold text-white mb-10">Security & <span class="italic text-[#C5A059]">Access</span></h3>
                    
                    <div class="space-y-6">
                        <div class="flex items-center justify-between p-6 bg-white/5 rounded-[2rem] border border-white/5 group hover:border-[#C5A059]/30 transition-all">
                            <div class="flex items-center gap-6">
                                <div class="w-12 h-12 rounded-2xl bg-white/5 flex items-center justify-center text-[#C5A059]">
                                    <span class="material-icons">password</span>
                                </div>
                                <div>
                                    <h4 class="text-white font-bold text-sm mb-1">Update Password</h4>
                                    <p class="text-[9px] text-white/30 uppercase tracking-widest">Ensure your account is using a strong password</p>
                                </div>
                            </div>
                            <button class="px-6 py-2.5 bg-white/5 border border-white/10 text-white text-[9px] font-black uppercase tracking-widest rounded-xl hover:bg-white hover:text-primary transition-all">Change</button>
                        </div>

                        <div class="flex items-center justify-between p-6 bg-white/5 rounded-[2rem] border border-white/5 group hover:border-[#C5A059]/30 transition-all">
                            <div class="flex items-center gap-6">
                                <div class="w-12 h-12 rounded-2xl bg-emerald-500/10 flex items-center justify-center text-emerald-400">
                                    <span class="material-icons">verified_user</span>
                                </div>
                                <div>
                                    <h4 class="text-white font-bold text-sm mb-1">Two-Factor Auth</h4>
                                    <p class="text-[9px] text-emerald-400 font-black uppercase tracking-widest">Enhanced Security Active</p>
                                </div>
                            </div>
                            <div class="w-12 h-6 bg-emerald-500 rounded-full relative cursor-pointer shadow-lg shadow-emerald-500/20">
                                <div class="absolute right-1 top-1 w-4 h-4 bg-white rounded-full"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Danger Zone -->
                <div class="pt-8 flex justify-center">
                    <button class="text-[10px] font-black text-red-500/40 hover:text-red-500 uppercase tracking-[0.3em] transition-all">Deactivate Account</button>
                </div>

            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
