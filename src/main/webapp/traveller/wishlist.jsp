<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroTraveller" %>
<%@ page import="com.yatraconnect.model.Listing" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    HamroTraveller user = (HamroTraveller) session.getAttribute("user");
    if (user == null || !"traveller".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    List<Listing> wishlists = (List<Listing>) request.getAttribute("wishlists");
    if (wishlists == null) {
        wishlists = new ArrayList<>();
    }
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="min-h-screen bg-[#0F281E] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <!-- Header Section -->
        <div class="flex flex-col lg:flex-row lg:items-end justify-between gap-12 mb-16 fade-in-up">
            <div class="space-y-6">
                <div class="flex items-center gap-3 text-[#C5A059]">
                    <a href="dashboard.jsp" class="text-[10px] font-black uppercase tracking-[0.3em] hover:text-white transition-all no-underline">Portal</a>
                    <span class="material-icons text-xs opacity-30">chevron_right</span>
                    <span class="text-[10px] font-black uppercase tracking-[0.3em] text-white/40">Wishlist Gallery</span>
                </div>
                <h1 class="text-5xl md:text-7xl font-serif font-bold text-white leading-tight">Dream <span class="italic text-[#C5A059]">Journeys</span></h1>
                <p class="text-white/40 font-light text-lg max-w-2xl leading-relaxed">Your curated sanctuary of future Himalayan expeditions. Compare your favorites and plan your next legacy adventure.</p>
            </div>
            
            <div class="flex items-center gap-4">
                <button class="group flex items-center gap-3 px-8 py-4 bg-white/5 border border-white/10 rounded-2xl text-white hover:bg-white hover:text-primary transition-all duration-500">
                    <span class="material-icons text-lg group-hover:rotate-12 transition-transform">share</span>
                    <span class="text-[10px] font-black uppercase tracking-widest">Share Wishlist</span>
                </button>
            </div>
        </div>

        <!-- Advanced Filter Bar -->
        <div class="flex flex-col md:flex-row items-center justify-between gap-8 mb-12 fade-in-up-delay-1 p-8 bg-white/[0.02] border border-white/5 rounded-[2.5rem] backdrop-blur-xl">
            <div class="flex items-center gap-3 overflow-x-auto no-scrollbar w-full md:w-auto">
                <button class="px-8 py-3 rounded-xl bg-[#C5A059] text-primary text-[10px] font-black uppercase tracking-widest shadow-xl shadow-[#C5A059]/20 whitespace-nowrap">All Saved</button>
                <button class="px-8 py-3 rounded-xl bg-white/5 border border-white/5 text-white/60 hover:text-white hover:bg-white/10 transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Hotels</button>
                <button class="px-8 py-3 rounded-xl bg-white/5 border border-white/5 text-white/60 hover:text-white hover:bg-white/10 transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Treks</button>
                <button class="px-8 py-3 rounded-xl bg-white/5 border border-white/5 text-white/60 hover:text-white hover:bg-white/10 transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Experiences</button>
            </div>
            
            <div class="flex items-center gap-6">
                <div class="text-right hidden sm:block">
                    <p class="text-[9px] font-black text-white/20 uppercase tracking-widest mb-1">Total Value</p>
                    <p class="text-xl font-bold text-white">$2,180.00 <span class="text-[10px] text-[#C5A059] font-normal uppercase ml-1">Est.</span></p>
                </div>
            </div>
        </div>

        <!-- Wishlist Content Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-10 fade-in-up-delay-2">
            <% if (wishlists.isEmpty()) { %>
                <div class="col-span-full text-center py-20 bg-white/[0.02] border border-white/5 rounded-[3.5rem] backdrop-blur-xl">
                    <span class="material-icons text-6xl text-white/20 mb-4">favorite_border</span>
                    <h3 class="text-3xl font-serif font-bold text-white mb-2">Your wishlist is empty</h3>
                    <p class="text-white/40 mb-8">Start exploring and save your favorite experiences for later.</p>
                    <a href="../explore.jsp" class="px-10 py-4 bg-[#C5A059] text-primary rounded-2xl font-black uppercase text-[10px] tracking-widest shadow-2xl shadow-[#C5A059]/20 hover:scale-105 transition-all no-underline inline-block">Explore Packages</a>
                </div>
            <% } else {
                for (Listing item : wishlists) {
                    String imgUrl = "https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=1200";
                    if (item.getImages() != null && item.getImages().contains("[")) {
                        try {
                            String[] imgs = item.getImages().replaceAll("[\\[\\]\"]", "").split(",");
                            if (imgs.length > 0 && !imgs[0].trim().isEmpty()) {
                                imgUrl = imgs[0].trim();
                            }
                        } catch (Exception e) {}
                    }
                    String typeColor = "emerald";
                    String tagLabel = item.getType();
                    if ("hotel".equals(item.getType())) { typeColor = "cyan"; tagLabel = "Verified Stay"; }
                    else if ("trekking".equals(item.getType())) { typeColor = "emerald"; tagLabel = "Best Seller"; }
                    else { typeColor = "blue"; tagLabel = "Experience"; }
            %>
            <div class="group bg-white/[0.03] border border-white/5 rounded-[3.5rem] overflow-hidden backdrop-blur-xl flex flex-col md:flex-row hover:border-[#C5A059]/30 transition-all duration-700 shadow-2xl relative">
                <button onclick="removeFromWishlist('<%= item.getId() %>')" class="absolute top-6 right-6 z-20 w-12 h-12 rounded-2xl bg-black/40 backdrop-blur-md hover:bg-red-500 border border-white/10 text-white flex items-center justify-center transition-all duration-300">
                    <span class="material-icons">delete_outline</span>
                </button>
                <div class="md:w-2/5 h-80 md:h-auto relative overflow-hidden">
                    <img src="<%= imgUrl %>" 
                         class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-[2s]" alt="<%= item.getTitle() %>">
                    <div class="absolute inset-0 bg-gradient-to-r from-[#0F281E]/40 to-transparent"></div>
                    <div class="absolute top-8 left-8 flex flex-col gap-2">
                        <span class="px-4 py-1.5 rounded-full bg-<%= typeColor %>-500/20 text-<%= typeColor %>-400 text-[8px] font-black uppercase tracking-widest border border-<%= typeColor %>-500/30 backdrop-blur-md"><%= tagLabel %></span>
                    </div>
                </div>
                
                <div class="flex-1 p-10 flex flex-col">
                    <div class="flex justify-between items-start mb-6">
                        <div class="pr-12">
                            <h3 class="text-3xl font-serif font-bold text-white mb-2 leading-tight"><%= item.getTitle() %></h3>
                            <p class="text-white/40 text-xs flex items-center gap-2">
                                <span class="material-icons text-sm text-[#C5A059]">location_on</span> <%= item.getLocation() != null ? item.getLocation() : "Nepal" %>
                            </p>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-2 gap-6 mb-10 pt-6 border-t border-white/5">
                        <div>
                            <p class="text-[8px] text-white/20 font-black uppercase tracking-widest mb-1"><%= "hotel".equals(item.getType()) ? "Luxury Class" : "Difficulty" %></p>
                            <p class="text-white font-bold text-xs uppercase tracking-wider"><%= "hotel".equals(item.getType()) ? (item.getHotelCategory() != null ? item.getHotelCategory() : "Hotel") : (item.getDifficulty() != null ? item.getDifficulty() : "All Levels") %></p>
                        </div>
                        <div>
                            <p class="text-[8px] text-white/20 font-black uppercase tracking-widest mb-1">Avg Rating</p>
                            <div class="flex items-center gap-1">
                                <span class="material-icons text-xs text-[#C5A059]">star</span>
                                <span class="text-white font-bold text-xs"><%= String.format("%.1f", item.getAvgRating()) %>/5.0</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-auto flex items-center justify-between">
                        <div>
                            <p class="text-[9px] text-white/20 font-black uppercase tracking-widest mb-1"><%= "hotel".equals(item.getType()) ? "Daily Rate" : "Trip Value" %></p>
                            <p class="text-3xl font-serif font-bold <%= "hotel".equals(item.getType()) ? "text-white" : "text-[#C5A059]" %>">NPR <%= item.getPrice() %></p>
                        </div>
                        <a href="../package-details.jsp?id=<%= item.getId() %>" class="px-10 py-4 <%= "hotel".equals(item.getType()) ? "bg-white/5 border border-white/10 text-white hover:bg-white hover:text-primary" : "bg-[#C5A059] text-primary shadow-2xl shadow-[#C5A059]/20" %> rounded-2xl text-[10px] font-black uppercase tracking-widest hover:scale-105 transition-all no-underline">View Details</a>
                    </div>
                </div>
            </div>
            <% } } %>
        </div>

        <!-- Floating Quick Action -->
        <a href="../explore.jsp" class="fixed bottom-12 right-12 w-20 h-20 rounded-full bg-[#C5A059] text-primary flex items-center justify-center shadow-[0_20px_50px_rgba(197,160,89,0.4)] hover:scale-110 transition-all group z-50 no-underline">
            <span class="material-icons text-3xl group-hover:rotate-90 transition-transform">add</span>
        </a>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />

<script>
    async function removeFromWishlist(id) {
        if (!confirm('Remove this item from your wishlist?')) return;
        try {
            const res = await fetch('<%= request.getContextPath() %>/wishlist', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({ action: 'toggle', listingId: id })
            });
            if (res.ok) {
                window.location.reload();
            } else {
                alert('Failed to remove item. Please try again.');
            }
        } catch(e) {
            console.error('Error removing from wishlist', e);
        }
    }
</script>
</body>
</html>
