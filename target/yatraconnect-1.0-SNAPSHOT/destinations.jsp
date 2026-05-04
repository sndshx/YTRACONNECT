<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/navbar.jsp" />



<main class="bg-[#0F281E] min-h-screen pt-32 pb-20 relative overflow-hidden text-white">
    <!-- Decorative Glows -->
    <div class="absolute top-0 right-0 w-[600px] h-[600px] bg-[#C5A059]/10 rounded-full blur-[150px] pointer-events-none"></div>
    <div class="absolute bottom-0 left-0 w-[500px] h-[500px] bg-cyan-500/10 rounded-full blur-[120px] pointer-events-none"></div>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        
        <!-- A. Page Header -->
        <div class="text-center mb-12 fade-in-up">
            <span class="text-[#C5A059] text-[10px] md:text-xs font-bold tracking-[0.3em] uppercase bg-[#C5A059]/10 px-4 py-2 rounded-full border border-[#C5A059]/30">
                Discover The World
            </span>
            <h1 class="text-5xl md:text-6xl lg:text-7xl font-serif font-black text-white mt-6 mb-4 tracking-tight">
                Explore All <span class="text-[#C5A059] italic">Destinations</span>
            </h1>
            <p class="text-white/60 text-sm md:text-base font-light max-w-2xl mx-auto">
                Choose where your adventure begins. From the majestic peaks of the Himalayas to the lush jungles of Chitwan.
            </p>
        </div>

        <!-- View Toggle & Sort -->
        <div class="flex flex-col md:flex-row justify-between items-center mb-8 gap-4 fade-in-up-delay-1">
            <div class="flex bg-white/5 p-1 rounded-full border border-white/10">
                <button id="gridBtn" class="flex items-center gap-2 px-6 py-2.5 rounded-full bg-[#C5A059] text-[#0F281E] text-xs font-black uppercase tracking-widest transition-all">
                    <span class="material-icons text-sm">grid_view</span> Grid
                </button>
                <button id="mapBtn" class="flex items-center gap-2 px-6 py-2.5 rounded-full text-white/60 hover:text-white text-xs font-black uppercase tracking-widest transition-all">
                    <span class="material-icons text-sm">map</span> Map
                </button>
            </div>
            
            <div class="flex items-center gap-3">
                <span class="text-white/40 text-xs uppercase tracking-widest font-bold">Sort By:</span>
                <select class="bg-white/5 border border-white/10 text-white text-xs px-4 py-2.5 rounded-xl focus:outline-none focus:border-[#C5A059] appearance-none cursor-pointer">
                    <option value="popular" class="text-gray-900">Popularity</option>
                    <option value="price_low" class="text-gray-900">Price (Low to High)</option>
                    <option value="rating" class="text-gray-900">Best Rated</option>
                    <option value="newest" class="text-gray-900">Newest</option>
                </select>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
            
            <!-- B. Search/Filter Options Sidebar -->
            <div class="lg:col-span-1 space-y-6 fade-in-up-delay-1">
                <div class="bg-white/[0.03] backdrop-blur-[20px] border border-white/5 p-6 rounded-3xl shadow-xl">
                    <h3 class="text-lg font-serif font-bold text-white mb-6 border-b border-white/10 pb-4">Refine Search</h3>
                    
                    <!-- Search Bar -->
                    <div class="mb-6 relative">
                        <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/40 text-sm">search</span>
                        <input type="text" id="searchInput" placeholder="Search destination..." class="w-full bg-white/5 border border-white/10 rounded-xl py-3 pl-10 pr-4 text-xs text-white focus:outline-none focus:border-[#C5A059] transition-colors placeholder-white/40">
                    </div>

                    <!-- Region -->
                    <div class="mb-6">
                        <label class="block text-[10px] font-black text-[#C5A059] uppercase tracking-widest mb-3">Region</label>
                        <select id="regionFilter" class="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-xs text-white focus:outline-none focus:border-[#C5A059] cursor-pointer">
                            <option value="all" class="text-gray-900">All Regions</option>
                            <option value="everest" class="text-gray-900">Everest Region</option>
                            <option value="annapurna" class="text-gray-900">Annapurna Region</option>
                            <option value="langtang" class="text-gray-900">Langtang Region</option>
                            <option value="chitwan" class="text-gray-900">Chitwan & Terai</option>
                            <option value="kathmandu" class="text-gray-900">Kathmandu Valley</option>
                        </select>
                    </div>

                    <!-- Tour Type -->
                    <div class="mb-6">
                        <label class="block text-[10px] font-black text-[#C5A059] uppercase tracking-widest mb-3">Tour Type</label>
                        <div class="space-y-2">
                            <label class="flex items-center gap-3 cursor-pointer group">
                                <input type="checkbox" value="trekking" class="filter-type w-4 h-4 rounded border-white/20 bg-white/5 text-[#C5A059] focus:ring-[#C5A059]" checked>
                                <span class="text-xs text-white/70 group-hover:text-white transition-colors">Adventure & Trekking</span>
                            </label>
                            <label class="flex items-center gap-3 cursor-pointer group">
                                <input type="checkbox" value="cultural" class="filter-type w-4 h-4 rounded border-white/20 bg-white/5 text-[#C5A059] focus:ring-[#C5A059]" checked>
                                <span class="text-xs text-white/70 group-hover:text-white transition-colors">Cultural Tours</span>
                            </label>
                            <label class="flex items-center gap-3 cursor-pointer group">
                                <input type="checkbox" value="safari" class="filter-type w-4 h-4 rounded border-white/20 bg-white/5 text-[#C5A059] focus:ring-[#C5A059]" checked>
                                <span class="text-xs text-white/70 group-hover:text-white transition-colors">Wildlife & Safari</span>
                            </label>
                            <label class="flex items-center gap-3 cursor-pointer group">
                                <input type="checkbox" value="luxury" class="filter-type w-4 h-4 rounded border-white/20 bg-white/5 text-[#C5A059] focus:ring-[#C5A059]" checked>
                                <span class="text-xs text-white/70 group-hover:text-white transition-colors">Luxury Retreats</span>
                            </label>
                        </div>
                    </div>

                    <!-- Price Range -->
                    <div class="mb-6">
                        <label class="block text-[10px] font-black text-[#C5A059] uppercase tracking-widest mb-3 flex items-center justify-between">
                            Max Price 
                            <span id="priceDisplay" class="text-white text-[11px] bg-white/10 px-2 py-1 rounded border border-white/10">$2500</span>
                        </label>
                        <input type="range" id="priceRange" min="100" max="5000" value="2500" step="50" oninput="document.getElementById('priceDisplay').innerText = '$' + this.value" class="w-full h-1 bg-white/20 rounded-lg appearance-none cursor-pointer [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:w-4 [&::-webkit-slider-thumb]:h-4 [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:bg-[#C5A059] [&::-webkit-slider-thumb]:cursor-pointer mb-3">
                        <div class="flex justify-between text-[10px] text-white/50 font-bold">
                            <span>$100</span>
                            <span>$5,000+</span>
                        </div>
                    </div>

                    <!-- Duration -->
                    <div class="mb-6">
                        <label class="block text-[10px] font-black text-[#C5A059] uppercase tracking-widest mb-3">Duration</label>
                        <div class="grid grid-cols-2 gap-2">
                            <button data-duration="short" class="filter-duration px-2 py-2 rounded-lg border border-white/10 text-white/60 text-[10px] hover:border-white/30 transition-colors">1-3 Days</button>
                            <button data-duration="medium" class="filter-duration px-2 py-2 rounded-lg border border-white/10 text-white/60 text-[10px] hover:border-white/30 transition-colors">4-7 Days</button>
                            <button data-duration="long" class="filter-duration px-2 py-2 rounded-lg border border-white/10 text-white/60 text-[10px] hover:border-white/30 transition-colors">8-14 Days</button>
                            <button data-duration="extended" class="filter-duration px-2 py-2 rounded-lg border border-white/10 text-white/60 text-[10px] hover:border-white/30 transition-colors">15+ Days</button>
                        </div>
                    </div>
                    
                    <button id="applyFiltersBtn" class="w-full py-3 rounded-xl bg-[#C5A059] text-[#0F281E] text-xs font-black uppercase tracking-widest hover:bg-white transition-all shadow-lg shadow-[#C5A059]/20">
                        Apply Filters
                    </button>
                </div>
            </div>

            <!-- Main Content Area -->
            <div class="lg:col-span-3">
                
                <!-- C. Destination Cards Grid -->
                <div id="gridView" class="grid grid-cols-1 md:grid-cols-2 gap-6 fade-in-up-delay-2">

                    <!-- Card 1 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="everest" data-type="trekking" data-price="850" data-duration="long" data-title="everest region">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Everest Base Camp" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.9</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Everest Region</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Trekking</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 5,364m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">Experience the ultimate adventure to the base of the world's highest peak. Witness breathtaking landscapes and vibrant Sherpa culture.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Hard</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Spring/Autumn</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">groups</span> Guided</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">12 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $850</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="annapurna" data-type="trekking" data-price="650" data-duration="medium" data-title="annapurna base">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Annapurna" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.8</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Annapurna Base</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Trekking</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 4,130m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">A spectacular journey into the heart of the Annapurna sanctuary. Trek through diverse landscapes, terraced fields, and rich rhododendron forests.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Moderate</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Spring/Autumn</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">home</span> Teahouse</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">7 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $650</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="chitwan" data-type="safari" data-price="350" data-duration="medium" data-title="chitwan safari">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Chitwan" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.7</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Chitwan Safari</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Wildlife Safari</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 415m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">Discover the lush jungles of the Terai. Encounter rare one-horned rhinos, Bengal tigers, and experience vibrant Tharu culture.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Easy</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Winter/Spring</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">directions_car</span> Jeep Safari</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">5 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $350</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=travel" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 4 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="kathmandu" data-type="cultural" data-price="150" data-duration="short" data-title="kathmandu valley">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Kathmandu" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.6</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Kathmandu Valley</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Cultural Tour</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 1,400m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">Step back in time in the city of temples. Explore UNESCO World Heritage sites, bustling bazaars, and exquisite ancient architecture.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Easy</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> All Year</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">account_balance</span> Heritage</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">3 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $150</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=travel" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 5 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="annapurna" data-type="trekking" data-price="250" data-duration="short" data-title="poon hill trek">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1581458983995-167812ea1bc8?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Poon Hill" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.7</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Poon Hill Trek</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Trekking</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 3,210m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">A short and stunning trek offering arguably the best panoramic sunrise views of the majestic Annapurna and Dhaulagiri mountain ranges.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Easy-Mod</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Spring/Autumn</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">family_restroom</span> Family</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">3 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $250</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 6 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="langtang" data-type="trekking" data-price="500" data-duration="medium" data-title="langtang valley">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1626206120816-1fba69300ab5?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Langtang" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.8</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Langtang Valley</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Trekking</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 3,870m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">The valley of glaciers. A less-crowded trek offering pristine forests, high alpine meadows, and unique Tibetan-influenced culture.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Moderate</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Spring/Autumn</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">camera_alt</span> Scenic</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">7 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $500</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 7 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="everest" data-type="trekking" data-price="950" data-duration="long" data-title="gokyo lakes">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Gokyo Lakes" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">4.9</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Gokyo Lakes</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Trekking</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 5,357m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">An alternative to the classic EBC trek. Discover pristine turquoise glacial lakes and cross the challenging Cho La Pass.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Hard</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Spring/Autumn</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">explore</span> Remote</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">12 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $950</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- Card 8 -->
                    <div class="destination-card bg-white/[0.03] backdrop-blur-[20px] border border-white/5 rounded-[2rem] overflow-hidden group hover:-translate-y-2 transition-all duration-500" data-region="annapurna" data-type="trekking" data-price="1200" data-duration="extended" data-title="annapurna circuit">
                        <div class="relative h-60 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Annapurna Circuit" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0F281E] via-[#0F281E]/40 to-transparent"></div>
                            <div class="absolute top-4 right-4 bg-white/10 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 border border-white/20">
                                <span class="material-icons text-[#C5A059] text-xs">star</span>
                                <span class="text-xs font-bold text-white">5.0</span>
                            </div>
                            <div class="absolute bottom-4 left-4">
                                <span class="text-white font-serif font-bold text-2xl drop-shadow-lg">Annapurna Circuit</span>
                            </div>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <p class="text-[#C5A059] text-[10px] font-black tracking-widest uppercase">Trekking</p>
                                <span class="text-white/40 text-[10px] font-bold flex items-center gap-1"><span class="material-icons text-[12px]">landscape</span> Max: 5,416m</span>
                            </div>
                            <p class="text-white/70 text-xs font-light mb-4 line-clamp-2 leading-relaxed">The ultimate Himalayan traverse. Cross the mighty Thorong La Pass and witness the dramatic transition from lush tropics to arid Tibetan plateau.</p>
                            <div class="flex flex-wrap gap-2 mb-5">
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">fitness_center</span> Challenging</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">wb_sunny</span> Autumn</span>
                                <span class="px-2 py-1 bg-white/5 border border-white/10 rounded text-[9px] text-white/80 font-bold uppercase tracking-widest flex items-center gap-1"><span class="material-icons text-[10px] text-[#C5A059]">emoji_events</span> Epic</span>
                            </div>
                            <div class="flex items-center justify-between border-t border-white/10 pt-4 mb-5">
                                <div class="flex flex-col">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center gap-1"><span class="material-icons text-[10px]">schedule</span> Duration</span>
                                    <span class="text-white text-sm font-bold">18 Days</span>
                                </div>
                                <div class="flex flex-col text-right">
                                    <span class="text-white/40 text-[9px] uppercase tracking-widest font-bold flex items-center justify-end gap-1"><span class="material-icons text-[10px]">payments</span> Price Range</span>
                                    <span class="text-white text-sm font-bold">from $1200</span>
                                </div>
                            </div>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="block w-full text-center py-3 rounded-xl border border-[#C5A059]/30 text-[#C5A059] text-[10px] font-black uppercase tracking-widest hover:bg-[#C5A059] hover:text-[#0F281E] transition-all no-underline">
                                Explore Tours
                            </a>
                        </div>
                    </div>

                    <!-- No Results -->
                    <div id="noResults" class="hidden col-span-1 md:col-span-2 py-16 text-center bg-white/[0.02] border border-white/5 rounded-[2rem]">
                        <span class="material-icons text-[#C5A059] text-5xl mb-4">search_off</span>
                        <h3 class="text-white font-serif text-2xl font-bold mb-2">No Destinations Found</h3>
                        <p class="text-white/50 text-sm">We couldn't find any destinations matching your exact criteria.</p>
                    </div>
                </div>

                <!-- D. Map View Option (Hidden by default) -->
                <div id="mapView" class="hidden fade-in-up-delay-2">
                    <div class="bg-white/[0.03] backdrop-blur-[20px] border border-white/5 p-2 rounded-3xl">
                        <!-- Changed to an image specifically representing Nepal terrain/map feel -->
                        <div class="h-[600px] bg-[url('https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2000')] bg-center bg-cover rounded-[1.5rem] relative w-full overflow-hidden">
                            <div class="absolute inset-0 bg-[#0F281E]/60 mix-blend-multiply"></div>
                            
                            <!-- Map Pins -->
                            <!-- Everest -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 45%; left: 75%;" data-region="everest">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Everest Region</h4>
                                    <p class="text-[#C5A059] text-[10px]">12 Tours Available</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Annapurna -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 55%; left: 35%;" data-region="annapurna">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Annapurna Base</h4>
                                    <p class="text-[#C5A059] text-[10px]">8 Tours Available</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Chitwan -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 80%; left: 50%;" data-region="chitwan">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Chitwan Safari</h4>
                                    <p class="text-[#C5A059] text-[10px]">5 Tours Available</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=travel" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Kathmandu -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 60%; left: 55%;" data-region="kathmandu">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Kathmandu Valley</h4>
                                    <p class="text-[#C5A059] text-[10px]">15 Tours Available</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=travel" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Poon Hill -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 57%; left: 37%;" data-region="annapurna">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1581458983995-167812ea1bc8?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Poon Hill Trek</h4>
                                    <p class="text-[#C5A059] text-[10px]">3 Days</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Langtang -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 48%; left: 52%;" data-region="langtang">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1626206120816-1fba69300ab5?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Langtang Valley</h4>
                                    <p class="text-[#C5A059] text-[10px]">7 Days</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Gokyo Lakes -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 43%; left: 73%;" data-region="everest">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Gokyo Lakes</h4>
                                    <p class="text-[#C5A059] text-[10px]">12 Days</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                            <!-- Annapurna Circuit -->
                            <div class="map-pin-item absolute w-6 h-6 bg-[#C5A059] rounded-full border-[3px] border-[#0F281E] shadow-[0_0_15px_rgba(197,160,89,0.6)] cursor-pointer -translate-x-1/2 -translate-y-1/2 transition-transform duration-300 hover:scale-125 hover:-translate-x-1/2 hover:-translate-y-1/2 group/pin" style="top: 52%; left: 33%;" data-region="annapurna">
                                <div class="absolute bottom-full left-1/2 -translate-x-1/2 -translate-y-2.5 opacity-0 invisible transition-all duration-300 group-hover/pin:opacity-100 group-hover/pin:visible group-hover/pin:-translate-y-4 bg-white/[0.03] backdrop-blur-[20px] border border-white/5 w-48 p-3 rounded-xl z-50">
                                    <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=200&q=80" class="w-full h-16 object-cover rounded-lg mb-2">
                                    <h4 class="text-white text-xs font-bold">Annapurna Circuit</h4>
                                    <p class="text-[#C5A059] text-[10px]">18 Days</p>
                                    <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking" class="mt-2 block text-center text-[9px] font-black uppercase tracking-widest text-white border border-white/20 rounded-lg py-1 hover:bg-[#C5A059] hover:border-[#C5A059] hover:text-[#0F281E] transition-colors no-underline">View</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const gridBtn = document.getElementById('gridBtn');
        const mapBtn = document.getElementById('mapBtn');
        const gridView = document.getElementById('gridView');
        const mapView = document.getElementById('mapView');

        // View Toggles
        gridBtn.addEventListener('click', () => {
            gridBtn.classList.add('bg-[#C5A059]', 'text-[#0F281E]');
            gridBtn.classList.remove('text-white/60', 'hover:text-white', 'bg-transparent');
            mapBtn.classList.remove('bg-[#C5A059]', 'text-[#0F281E]');
            mapBtn.classList.add('text-white/60', 'hover:text-white');
            gridView.classList.remove('hidden');
            mapView.classList.add('hidden');
        });

        mapBtn.addEventListener('click', () => {
            mapBtn.classList.add('bg-[#C5A059]', 'text-[#0F281E]');
            mapBtn.classList.remove('text-white/60', 'hover:text-white', 'bg-transparent');
            gridBtn.classList.remove('bg-[#C5A059]', 'text-[#0F281E]');
            gridBtn.classList.add('text-white/60', 'hover:text-white');
            mapView.classList.remove('hidden');
            gridView.classList.add('hidden');
        });

        // Filtering Logic
        const regionFilter = document.getElementById('regionFilter');
        const searchInput = document.getElementById('searchInput');
        const priceRange = document.getElementById('priceRange');
        const applyFiltersBtn = document.getElementById('applyFiltersBtn');
        const cards = document.querySelectorAll('.destination-card');
        const mapPins = document.querySelectorAll('.map-pin-item');
        const noResults = document.getElementById('noResults');

        let selectedDuration = null;

        // Setup Duration Selectors
        document.querySelectorAll('.filter-duration').forEach(btn => {
            btn.addEventListener('click', (e) => {
                document.querySelectorAll('.filter-duration').forEach(b => {
                    b.classList.remove('bg-[#C5A059]/10', 'text-[#C5A059]', 'border-[#C5A059]');
                    b.classList.add('border-white/10', 'text-white/60');
                });
                
                if (selectedDuration !== e.target.dataset.duration) {
                    selectedDuration = e.target.dataset.duration;
                    e.target.classList.add('bg-[#C5A059]/10', 'text-[#C5A059]', 'border-[#C5A059]');
                    e.target.classList.remove('border-white/10', 'text-white/60');
                } else {
                    selectedDuration = null;
                }
            });
        });

        const filterItems = () => {
            const region = regionFilter.value;
            const search = searchInput.value.toLowerCase();
            const maxPrice = parseInt(priceRange.value);
            const selectedTypes = Array.from(document.querySelectorAll('.filter-type:checked')).map(cb => cb.value);
            
            let visibleCount = 0;

            cards.forEach(card => {
                const cardRegion = card.dataset.region;
                const cardType = card.dataset.type;
                const cardPrice = parseInt(card.dataset.price);
                const cardDuration = card.dataset.duration;
                const cardTitle = card.dataset.title;

                let show = true;

                if (region !== 'all' && region !== cardRegion) show = false;
                if (search && !cardTitle.includes(search)) show = false;
                if (cardPrice > maxPrice) show = false;
                if (selectedTypes.length > 0 && !selectedTypes.includes(cardType)) show = false;
                if (selectedDuration && selectedDuration !== cardDuration) show = false;

                if (show) {
                    card.classList.remove('hidden');
                    visibleCount++;
                } else {
                    card.classList.add('hidden');
                }
            });

            if (visibleCount === 0) {
                noResults.classList.remove('hidden');
            } else {
                noResults.classList.add('hidden');
            }

            // Map Pins
            mapPins.forEach(pin => {
                if (region !== 'all' && pin.dataset.region !== region) {
                    pin.classList.add('hidden');
                } else {
                    pin.classList.remove('hidden');
                }
            });
        };

        // Attach events
        applyFiltersBtn.addEventListener('click', filterItems);
        priceRange.addEventListener('change', filterItems);
        searchInput.addEventListener('keyup', (e) => {
            if (e.key === 'Enter') filterItems();
        });
        regionFilter.addEventListener('change', filterItems);
    });
</script>

<jsp:include page="includes/footer.jsp" />
