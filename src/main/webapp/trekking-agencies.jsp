<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/navbar.jsp" />

<!-- Hero Section -->
<section class="relative pt-32 pb-20 lg:pt-40 lg:pb-28 overflow-hidden bg-bg-dark">
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-30" alt="Mountain Peak">
        <div class="absolute inset-0 bg-gradient-to-t from-bg-dark via-bg-dark/80 to-transparent"></div>
    </div>
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center fade-in-up">
        <span class="text-accent text-[10px] sm:text-xs font-bold tracking-[0.3em] uppercase mb-4 block">Hamroyatra Network</span>
        <h1 class="text-4xl md:text-6xl lg:text-7xl text-white font-serif font-bold mb-6 tracking-tight">Certified Mountain <span class="text-transparent bg-clip-text bg-gradient-to-r from-accent to-yellow-200">Experts</span></h1>
        <p class="text-gray-400 text-sm md:text-base max-w-2xl mx-auto font-light leading-relaxed mb-10">Discover Nepal's most trusted and highly-rated trekking agencies. Every partner is strictly vetted for safety records, guide certifications, and exceptional service quality.</p>
    </div>
</section>

<!-- Content Section -->
<section class="py-20 bg-bg-light min-h-screen">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Filters -->
        <div class="flex flex-wrap items-center justify-between mb-12 gap-4">
            <h2 class="text-2xl font-serif text-primary font-bold">Top Agencies (21)</h2>
            <div class="flex gap-2">
                <select class="bg-white border border-gray-200 text-gray-700 text-xs font-bold rounded-full px-4 py-2 outline-none focus:border-accent cursor-pointer">
                    <option>Region: Everest</option>
                    <option>Region: Annapurna</option>
                    <option>Region: Langtang</option>
                </select>
                <select class="bg-white border border-gray-200 text-gray-700 text-xs font-bold rounded-full px-4 py-2 outline-none focus:border-accent cursor-pointer">
                    <option>Sort by: Rating</option>
                    <option>Sort by: Experience</option>
                </select>
            </div>
        </div>

        <!-- Agencies Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <% 
                String[][] agencies = {
                    {"Himalayan Masters", "4.9", "Thamel, Kathmandu", "15+ Yrs Exp", "50+ Guides", "Everest Spec.", "https://images.unsplash.com/photo-1522163182402-834f871fd851?q=80&w=800&auto=format&fit=crop", "HM"},
                    {"Annapurna Explorers", "4.8", "Lakeside, Pokhara", "10+ Yrs Exp", "30+ Guides", "Eco-Friendly", "https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=800&auto=format&fit=crop", "AE"},
                    {"Sherpa Trails", "5.0", "Namche Bazaar", "20+ Yrs Exp", "Local Sherpas", "High Alt.", "https://images.unsplash.com/photo-1512100356356-de1b84283e18?q=80&w=800&auto=format&fit=crop", "ST"}
                };

                for(int i = 0; i < 21; i++) { 
                    String[] agency = agencies[i % 3];
            %>
            <div class="bg-white rounded-3xl overflow-hidden border border-gray-100 shadow-[0_10px_40px_-15px_rgba(0,0,0,0.05)] hover:-translate-y-2 transition-all duration-300 group">
                <div class="h-48 relative overflow-hidden">
                    <img src="<%= agency[6] %>" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Agency">
                    <div class="absolute top-4 right-4 bg-white/90 backdrop-blur px-3 py-1 rounded-full flex items-center gap-1 shadow-sm">
                        <span class="material-icons text-accent text-sm">verified</span>
                        <span class="text-[10px] font-black tracking-widest uppercase text-primary">Verified</span>
                    </div>
                    <div class="absolute -bottom-6 left-6 w-16 h-16 bg-white rounded-xl shadow-lg border border-gray-50 flex items-center justify-center p-2 z-10">
                        <img src="https://ui-avatars.com/api/?name=<%= agency[7] %>&background=0F281E&color=C5A059" class="w-full h-full rounded-lg" alt="Logo">
                    </div>
                </div>
                <div class="pt-10 pb-6 px-6 relative z-0">
                    <div class="flex justify-between items-start mb-2">
                        <h3 class="font-serif text-xl font-bold text-primary"><%= agency[0] %> <%= (i > 2) ? (i+1) : "" %></h3>
                        <div class="flex items-center gap-1 bg-yellow-50 px-2 py-0.5 rounded text-yellow-600">
                            <span class="material-icons text-xs">star</span>
                            <span class="text-xs font-bold"><%= agency[1] %></span>
                        </div>
                    </div>
                    <p class="text-xs text-gray-500 mb-4 flex items-center gap-1"><span class="material-icons text-[14px]">location_on</span> <%= agency[2] %></p>
                    <div class="flex flex-wrap gap-2 mb-6">
                        <span class="bg-gray-50 text-gray-600 text-[9px] font-bold uppercase tracking-wider px-2 py-1 rounded"><%= agency[3] %></span>
                        <span class="bg-gray-50 text-gray-600 text-[9px] font-bold uppercase tracking-wider px-2 py-1 rounded"><%= agency[4] %></span>
                        <span class="bg-gray-50 text-gray-600 text-[9px] font-bold uppercase tracking-wider px-2 py-1 rounded"><%= agency[5] %></span>
                    </div>
                    <a href="#" class="block w-full py-3 border border-primary/20 text-primary text-center rounded-xl text-[10px] font-black uppercase tracking-widest hover:bg-primary hover:text-white transition-colors">View Profile</a>
                </div>
            </div>
            <% } %>

        </div>
        
        <div class="mt-12 text-center">
            <button class="bg-white border border-gray-200 text-primary px-8 py-3 rounded-full text-xs font-bold uppercase tracking-widest hover:border-primary transition-colors shadow-sm">Load More Agencies</button>
        </div>
    </div>
</section>

</body>
</html>
