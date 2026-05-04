<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroAgent" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<%
    HamroAgent agent = (HamroAgent) session.getAttribute("user");
    if (agent == null || !"agent".equals(session.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<section class="min-h-screen bg-[#07203B] pb-20">
    <!-- Cinematic Header -->
    <div class="relative h-[40vh] w-full overflow-hidden">
        <img src="<%= (agent.getCoverImage() != null && !agent.getCoverImage().isEmpty()) ? agent.getCoverImage() : "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=2600" %>" 
             class="w-full h-full object-cover" alt="Cover">
        <div class="absolute inset-0 bg-gradient-to-t from-[#07203B] via-[#07203B]/40 to-transparent"></div>
    </div>

    <div class="max-w-7xl mx-auto px-4 md:px-8 -mt-32 relative z-10">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            
            <!-- Left Column: Profile Card -->
            <div class="lg:col-span-4 fade-in-up">
                <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-8 backdrop-blur-xl shadow-2xl sticky top-32">
                    <div class="flex flex-col items-center text-center">
                        <div class="relative mb-6">
                            <div class="w-32 h-32 rounded-full border-4 border-accent p-1 shadow-[0_0_30px_rgba(197,160,89,0.3)]">
                                <img src="<%= (agent.getProfileImage() != null && !agent.getProfileImage().isEmpty()) ? agent.getProfileImage() : "https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=400" %>" 
                                     class="w-full h-full rounded-full object-cover" alt="Profile">
                            </div>
                            <% if(agent.isVerified()) { %>
                                <div class="absolute bottom-0 right-0 w-10 h-10 bg-cyan-400 rounded-full border-4 border-[#07203B] flex items-center justify-center text-primary-dark">
                                    <span class="material-icons text-lg font-bold">verified</span>
                                </div>
                            <% } %>
                        </div>
                        
                        <h2 class="text-2xl font-serif font-bold text-white mb-2"><%= agent.getCompanyName() %></h2>
                        <p class="text-accent text-[10px] font-black uppercase tracking-[0.2em] mb-6">Premium Agency Partner</p>
                        
                        <div class="grid grid-cols-3 w-full gap-4 pt-6 border-t border-white/5 mb-8">
                            <div class="text-center">
                                <p class="text-white font-bold text-lg">12</p>
                                <p class="text-[8px] text-white/30 uppercase font-black">Packages</p>
                            </div>
                            <div class="text-center border-x border-white/5">
                                <p class="text-white font-bold text-lg">9.8</p>
                                <p class="text-[8px] text-white/30 uppercase font-black">Rating</p>
                            </div>
                            <div class="text-center">
                                <p class="text-white font-bold text-lg">1.4k</p>
                                <p class="text-[8px] text-white/30 uppercase font-black">Bookings</p>
                            </div>
                        </div>

                        <div class="flex flex-col w-full gap-3">
                            <button class="w-full py-4 bg-accent text-primary-dark rounded-2xl text-[10px] font-black uppercase tracking-widest hover:bg-white transition-all shadow-xl shadow-accent/10">
                                Edit Profile
                            </button>
                            <button class="w-full py-4 bg-white/5 border border-white/10 text-white text-[10px] font-black uppercase tracking-widest hover:bg-white/10 transition-all rounded-2xl">
                                View Public Page
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column: Details -->
            <div class="lg:col-span-8 space-y-8 fade-in-up-delay-1">
                
                <!-- About Section -->
                <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-10 backdrop-blur-xl shadow-2xl">
                    <h3 class="text-xl font-serif font-bold text-white mb-6">About the <span class="italic text-accent">Agency</span></h3>
                    <p class="text-white/60 font-light leading-relaxed mb-8">
                        <%= (agent.getBio() != null && !agent.getBio().isEmpty()) ? agent.getBio() : "No bio available. Add a description to attract more premium travellers." %>
                    </p>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 pt-8 border-t border-white/5">
                        <div class="space-y-6">
                            <div class="flex items-start gap-4">
                                <div class="w-10 h-10 rounded-xl bg-accent/10 flex items-center justify-center text-accent">
                                    <span class="material-icons text-sm">business</span>
                                </div>
                                <div>
                                    <p class="text-[10px] text-white/30 font-black uppercase tracking-widest mb-1">Legal Company Name</p>
                                    <p class="text-white text-sm font-medium"><%= agent.getLegalCompanyName() != null ? agent.getLegalCompanyName() : agent.getCompanyName() %></p>
                                </div>
                            </div>
                            <div class="flex items-start gap-4">
                                <div class="w-10 h-10 rounded-xl bg-accent/10 flex items-center justify-center text-accent">
                                    <span class="material-icons text-sm">contact_page</span>
                                </div>
                                <div>
                                    <p class="text-[10px] text-white/30 font-black uppercase tracking-widest mb-1">PAN Number</p>
                                    <p class="text-white text-sm font-medium tracking-widest"><%= agent.getPanNumber() != null ? agent.getPanNumber() : "Not Provided" %></p>
                                </div>
                            </div>
                        </div>
                        <div class="space-y-6">
                            <div class="flex items-start gap-4">
                                <div class="w-10 h-10 rounded-xl bg-accent/10 flex items-center justify-center text-accent">
                                    <span class="material-icons text-sm">location_on</span>
                                </div>
                                <div>
                                    <p class="text-[10px] text-white/30 font-black uppercase tracking-widest mb-1">Headquarters</p>
                                    <p class="text-white text-sm font-medium"><%= agent.getLocation() != null ? agent.getLocation() : "Kathmandu, Nepal" %></p>
                                </div>
                            </div>
                            <div class="flex items-start gap-4">
                                <div class="w-10 h-10 rounded-xl bg-accent/10 flex items-center justify-center text-accent">
                                    <span class="material-icons text-sm">language</span>
                                </div>
                                <div>
                                    <p class="text-[10px] text-white/30 font-black uppercase tracking-widest mb-1">Website</p>
                                    <a href="<%= agent.getWebsite() %>" class="text-cyan-400 text-sm font-medium hover:underline no-underline"><%= agent.getWebsite() != null ? agent.getWebsite() : "www.yatraconnect.com" %></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Verified Assets -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-8 backdrop-blur-xl">
                        <div class="flex items-center justify-between mb-6">
                            <h4 class="text-white font-serif font-bold">Registration</h4>
                            <span class="material-icons text-cyan-400">task_alt</span>
                        </div>
                        <div class="aspect-video bg-white/5 rounded-2xl border border-white/5 flex items-center justify-center text-white/20 group hover:bg-white/10 transition-all cursor-pointer">
                            <span class="material-icons text-4xl">description</span>
                        </div>
                        <p class="mt-4 text-[10px] text-white/30 font-black uppercase tracking-widest text-center">Business License Document</p>
                    </div>
                    <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-8 backdrop-blur-xl">
                        <div class="flex items-center justify-between mb-6">
                            <h4 class="text-white font-serif font-bold">Owner Identity</h4>
                            <span class="material-icons text-cyan-400">task_alt</span>
                        </div>
                        <div class="aspect-video bg-white/5 rounded-2xl border border-white/5 flex items-center justify-center text-white/20 group hover:bg-white/10 transition-all cursor-pointer">
                            <span class="material-icons text-4xl">badge</span>
                        </div>
                        <p class="mt-4 text-[10px] text-white/30 font-black uppercase tracking-widest text-center">Citizenship / Identity Proof</p>
                    </div>
                </div>

                <!-- Quick Tips Card -->
                <div class="bg-gradient-to-r from-accent/20 to-transparent border border-accent/20 rounded-[2.5rem] p-10 backdrop-blur-xl">
                    <div class="flex items-start gap-6">
                        <div class="w-16 h-16 rounded-full bg-accent flex items-center justify-center text-primary-dark">
                            <span class="material-icons text-3xl">lightbulb</span>
                        </div>
                        <div>
                            <h3 class="text-xl font-serif font-bold text-white mb-2">Enhance Your Presence</h3>
                            <p class="text-white/60 font-light text-sm leading-relaxed">
                                Agencies with verified documentation and high-quality cover images receive 4x more booking requests. Ensure your bio highlights your unique expertise in the Himalayan region.
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
