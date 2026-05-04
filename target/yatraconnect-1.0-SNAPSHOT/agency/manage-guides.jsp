<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.Guide, java.util.List" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<%
    List<Guide> guides = (List<Guide>) request.getAttribute("guides");
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (successMessage != null) session.removeAttribute("successMessage");
    if (errorMessage != null) session.removeAttribute("errorMessage");
%>

<section class="min-h-screen bg-[#07203B] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <!-- Header -->
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-12 fade-in-up">
            <div>
                <a href="dashboard" class="text-accent text-[10px] font-bold uppercase tracking-[0.3em] mb-4 inline-block hover:text-white transition-colors no-underline">
                    <span class="material-icons text-xs align-middle mr-1">arrow_back</span> Back to Dashboard
                </a>
                <h1 class="text-4xl md:text-5xl font-serif font-bold text-white mb-2">Guide Management</h1>
                <p class="text-white/50 font-light">Manage your professional guides and their certifications.</p>
            </div>
            <button onclick="document.getElementById('addGuideModal').classList.remove('hidden')"
                class="px-8 py-4 bg-accent text-primary-dark rounded-xl text-[11px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all shadow-xl shadow-accent/10">
                Register New Guide
            </button>
        </div>

        <% if (successMessage != null) { %>
            <div class="mb-8 p-4 bg-green-500/10 border border-green-500/20 rounded-2xl text-green-400 text-xs font-bold uppercase tracking-widest text-center">
                <%= successMessage %>
            </div>
        <% } %>
        <% if (errorMessage != null) { %>
            <div class="mb-8 p-4 bg-red-500/10 border border-red-500/20 rounded-2xl text-red-400 text-xs font-bold uppercase tracking-widest text-center">
                <%= errorMessage %>
            </div>
        <% } %>

        <!-- Guides Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 fade-in-up-delay-1">
            <% if (guides != null && !guides.isEmpty()) { 
                for (Guide guide : guides) { %>
                <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-8 backdrop-blur-xl group hover:border-accent/30 transition-all duration-500">
                    <div class="flex items-center gap-6 mb-8">
                        <div class="w-20 h-20 rounded-2xl overflow-hidden border-2 border-white/10 group-hover:border-accent/50 transition-colors">
                            <img src="<%= guide.getProfileImage() %>" alt="<%= guide.getFullName() %>" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h3 class="text-xl font-bold text-white mb-1"><%= guide.getFullName() %></h3>
                            <p class="text-accent text-[10px] font-bold uppercase tracking-widest"><%= guide.getExperienceYears() %> Years Experience</p>
                        </div>
                    </div>

                    <div class="space-y-4 mb-8">
                        <div class="flex items-center gap-3 text-white/50">
                            <span class="material-icons text-sm">mail_outline</span>
                            <span class="text-xs font-medium"><%= guide.getEmail() %></span>
                        </div>
                        <div class="flex items-center gap-3 text-white/50">
                            <span class="material-icons text-sm">phone_iphone</span>
                            <span class="text-xs font-medium"><%= guide.getPhoneNo() %></span>
                        </div>
                        <div class="pt-4 border-t border-white/5">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[9px] font-black text-white/30 uppercase tracking-widest">Certificate Expiry</p>
                                <span class="text-[10px] font-bold text-cyan-400"><%= guide.getCertificateExpiry() %></span>
                            </div>
                        </div>
                    </div>

                    <div class="flex items-center gap-4">
                        <button class="flex-1 py-3 rounded-xl bg-white/5 border border-white/10 text-white text-[10px] font-bold uppercase tracking-widest hover:bg-white/10 transition-all">
                            View Docs
                        </button>
                        <form action="guides" method="POST" onsubmit="return confirm('Remove this guide?');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="guideId" value="<%= guide.getId() %>">
                            <button type="submit" class="w-12 h-12 rounded-xl bg-red-500/10 border border-red-500/20 text-red-500 hover:bg-red-500 hover:text-white transition-all flex items-center justify-center">
                                <span class="material-icons text-lg">delete_outline</span>
                            </button>
                        </form>
                    </div>
                </div>
            <% } } else { %>
                <div class="col-span-full py-20 text-center">
                    <div class="w-20 h-20 rounded-full bg-white/5 flex items-center justify-center mx-auto mb-6 text-white/20">
                        <span class="material-icons text-4xl">hiking</span>
                    </div>
                    <h3 class="text-xl font-serif font-bold text-white mb-2">No Guides Registered</h3>
                    <p class="text-white/40 text-sm">Start adding your team to assign them to upcoming trips.</p>
                </div>
            <% } %>
        </div>
    </div>
</section>

<!-- Add Guide Modal -->
<div id="addGuideModal" class="fixed inset-0 z-[200] hidden">
    <div class="absolute inset-0 bg-black/80 backdrop-blur-sm" onclick="this.parentElement.classList.add('hidden')"></div>
    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full max-w-lg px-4">
        <div class="bg-[#0A1A2F] border border-white/10 rounded-[2.5rem] p-10 shadow-2xl">
            <h2 class="text-2xl font-serif font-bold text-white mb-8">Register Guide</h2>
            <form action="guides" method="POST" class="space-y-6">
                <input type="hidden" name="action" value="add">
                
                <div class="space-y-2">
                    <label class="text-[10px] font-bold text-white/30 uppercase tracking-widest ml-1">Full Name</label>
                    <input type="text" name="fullName" required class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-white text-sm focus:border-accent outline-none transition-all">
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="space-y-2">
                        <label class="text-[10px] font-bold text-white/30 uppercase tracking-widest ml-1">Email</label>
                        <input type="email" name="email" required class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-white text-sm focus:border-accent outline-none transition-all">
                    </div>
                    <div class="space-y-2">
                        <label class="text-[10px] font-bold text-white/30 uppercase tracking-widest ml-1">Phone</label>
                        <input type="text" name="phoneNo" required class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-white text-sm focus:border-accent outline-none transition-all">
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="space-y-2">
                        <label class="text-[10px] font-bold text-white/30 uppercase tracking-widest ml-1">Years Experience</label>
                        <input type="number" name="experienceYears" required class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-white text-sm focus:border-accent outline-none transition-all">
                    </div>
                    <div class="space-y-2">
                        <label class="text-[10px] font-bold text-white/30 uppercase tracking-widest ml-1">License Expiry</label>
                        <input type="date" name="certificateExpiry" required class="w-full h-14 bg-white/5 border border-white/10 rounded-2xl px-6 text-white text-sm focus:border-accent outline-none transition-all">
                    </div>
                </div>

                <div class="flex gap-4 pt-4">
                    <button type="button" onclick="document.getElementById('addGuideModal').classList.add('hidden')"
                        class="flex-1 h-14 rounded-2xl border border-white/10 text-white text-[11px] font-bold uppercase tracking-widest hover:bg-white/5 transition-all">
                        Cancel
                    </button>
                    <button type="submit"
                        class="flex-1 h-14 bg-accent text-primary-dark rounded-2xl text-[11px] font-black uppercase tracking-widest hover:bg-white transition-all shadow-xl shadow-accent/10">
                        Add Guide
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(1);
    }
</style>

<jsp:include page="../includes/footer.jsp" />
