<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/navbar.jsp" />

<style>
    /* Premium Glass UI */
    .glass-card {
        background: rgba(255, 255, 255, 0.03);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid rgba(255, 255, 255, 0.05);
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    }
    
    .glass-panel {
        background: linear-gradient(135deg, rgba(255,255,255,0.05) 0%, rgba(255,255,255,0.01) 100%);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.08);
    }

    /* Card Animations */
    .pkg-card {
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        transform-origin: center bottom;
    }
    .pkg-card:hover {
        transform: translateY(-8px) scale(1.01);
        box-shadow: 0 30px 60px -12px rgba(0, 0, 0, 0.5), 0 0 40px rgba(197, 160, 89, 0.1);
        border-color: rgba(197, 160, 89, 0.3);
    }
    .pkg-card .card-img { transition: transform 0.7s ease; }
    .pkg-card:hover .card-img { transform: scale(1.08); }

    /* Custom Scrollbar for sidebar */
    .custom-scrollbar::-webkit-scrollbar { width: 4px; }
    .custom-scrollbar::-webkit-scrollbar-track { background: transparent; }
    .custom-scrollbar::-webkit-scrollbar-thumb { background: rgba(197, 160, 89, 0.3); border-radius: 4px; }

    /* Filter Chips */
    .filter-chip {
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }
    .filter-chip::before {
        content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: all 0.5s ease;
    }
    .filter-chip:hover::before { left: 100%; }
    .filter-chip.active {
        background: linear-gradient(135deg, #C5A059, #b8904f);
        color: #07203B;
        font-weight: 700;
        border-color: transparent;
        box-shadow: 0 4px 15px rgba(197, 160, 89, 0.3);
    }

    /* Range Slider */
    .range-slider { -webkit-appearance: none; width: 100%; height: 4px; background: rgba(255,255,255,0.1); border-radius: 2px; outline: none; }
    .range-slider::-webkit-slider-thumb {
        -webkit-appearance: none; appearance: none; width: 20px; height: 20px; border-radius: 50%;
        background: #C5A059; cursor: pointer; box-shadow: 0 0 10px rgba(197, 160, 89, 0.5);
        border: 2px solid #07203B; transition: transform 0.2s;
    }
    .range-slider::-webkit-slider-thumb:hover { transform: scale(1.2); }

    /* Grid Stagger Animation */
    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    .animate-grid-item { animation: fadeUp 0.6s ease-out forwards; opacity: 0; }
</style>

<!-- Hero Section -->
<section class="relative pt-32 pb-20 overflow-hidden bg-[#07203B]">
    <!-- Background Elements -->
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-20" alt="Nepal">
        <div class="absolute inset-0 bg-gradient-to-b from-[#07203B]/90 via-[#07203B]/70 to-[#07203B]"></div>
        <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-[#C5A059]/10 rounded-full blur-[120px] pointer-events-none"></div>
    </div>

    <div class="relative z-10 max-w-7xl mx-auto px-4 text-center">
        <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 backdrop-blur-md mb-6 fade-in-up">
            <span class="w-2 h-2 rounded-full bg-[#C5A059] animate-pulse"></span>
            <span class="text-[#C5A059] text-xs font-bold tracking-[0.2em] uppercase">Explore The Himalayas</span>
        </div>
        <h1 class="font-serif text-5xl md:text-7xl text-white font-bold mb-6 fade-in-up leading-tight">
            Find Your Next <span class="text-transparent bg-clip-text bg-gradient-to-r from-[#C5A059] to-[#E8D099]">Adventure</span>
        </h1>
        <p class="text-white/60 max-w-2xl mx-auto mb-12 text-lg fade-in-up-delay-1">
            Curated treks, luxury stays, and unforgettable experiences. Filter, search, and book your perfect Nepal journey.
        </p>

        <!-- Search Bar (Premium) -->
        <div class="max-w-3xl mx-auto fade-in-up-delay-2 relative group">
            <div class="absolute -inset-1 bg-gradient-to-r from-[#C5A059]/30 to-transparent rounded-2xl blur opacity-25 group-hover:opacity-50 transition duration-1000 group-hover:duration-200"></div>
            <div class="relative flex items-center bg-[#0A1A2F]/80 backdrop-blur-xl border border-white/10 rounded-2xl overflow-hidden shadow-2xl p-2">
                <div class="flex items-center pl-4 pr-2">
                    <span class="material-icons text-[#C5A059] text-2xl">search</span>
                </div>
                <input id="search-input" type="text" placeholder="Where do you want to go? (e.g., Everest, Pokhara)"
                    class="flex-1 bg-transparent text-white placeholder-white/40 px-4 py-4 text-base outline-none w-full">
                <button onclick="doSearch()"
                    class="bg-gradient-to-r from-[#C5A059] to-[#b8904f] hover:from-[#b8904f] hover:to-[#9a7840] text-[#07203B] font-bold text-sm tracking-wider uppercase px-8 py-4 rounded-xl transition-all shadow-lg hover:shadow-[#C5A059]/40 transform hover:-translate-y-0.5">
                    Search
                </button>
            </div>
        </div>
    </div>
</section>

<!-- Main Content -->
<section class="bg-[#07203B] min-h-screen pb-20 -mt-2 relative z-20">
    <div class="max-w-7xl mx-auto px-4 flex flex-col lg:flex-row gap-8">

        <!-- Sidebar Filters -->
        <aside class="lg:w-80 shrink-0">
            <div class="glass-panel rounded-3xl p-6 sticky top-24 custom-scrollbar max-h-[calc(100vh-8rem)] overflow-y-auto">
                <div class="flex items-center justify-between mb-8 pb-4 border-b border-white/10">
                    <h2 class="text-white font-display font-bold text-lg flex items-center gap-2">
                        <span class="material-icons text-[#C5A059]">tune</span> Filters
                    </h2>
                    <button onclick="resetFilters()" class="text-[#C5A059] text-xs font-bold hover:text-white transition-colors uppercase tracking-wider">Reset All</button>
                </div>

                <!-- Category Filter -->
                <div class="mb-8">
                    <p class="text-white/40 text-xs font-bold uppercase tracking-widest mb-4">Category</p>
                    <div class="flex flex-col gap-3">
                        <button onclick="setType('all')" class="filter-chip active w-full flex items-center justify-between px-4 py-3 rounded-xl bg-white/5 text-white text-sm border border-white/5" data-type="all">
                            <span class="flex items-center gap-2"><span class="material-icons text-sm opacity-70">apps</span> All Experiences</span>
                        </button>
                        <button onclick="setType('trekking')" class="filter-chip w-full flex items-center justify-between px-4 py-3 rounded-xl bg-white/5 text-white text-sm border border-white/5 hover:border-white/20" data-type="trekking">
                            <span class="flex items-center gap-2"><span class="material-icons text-sm text-blue-400">landscape</span> Trekking</span>
                        </button>
                        <button onclick="setType('travel')" class="filter-chip w-full flex items-center justify-between px-4 py-3 rounded-xl bg-white/5 text-white text-sm border border-white/5 hover:border-white/20" data-type="travel">
                            <span class="flex items-center gap-2"><span class="material-icons text-sm text-emerald-400">flight_takeoff</span> Tours & Travel</span>
                        </button>
                        <button onclick="setType('hotel')" class="filter-chip w-full flex items-center justify-between px-4 py-3 rounded-xl bg-white/5 text-white text-sm border border-white/5 hover:border-white/20" data-type="hotel">
                            <span class="flex items-center gap-2"><span class="material-icons text-sm text-purple-400">hotel</span> Hotels & Stays</span>
                        </button>
                    </div>
                </div>

                <!-- Budget Filter -->
                <div class="mb-8">
                    <div class="flex items-center justify-between mb-4">
                        <p class="text-white/40 text-xs font-bold uppercase tracking-widest">Max Budget</p>
                        <span id="budget-label" class="text-[#C5A059] font-bold text-sm bg-[#C5A059]/10 px-2 py-1 rounded-md">NPR 200,000</span>
                    </div>
                    <div class="px-2">
                        <input id="budget-filter" type="range" min="1000" max="200000" step="1000" value="200000"
                            class="range-slider w-full"
                            oninput="updateBudgetLabel(this.value); applyFilters()">
                        <div class="flex justify-between text-white/30 text-[10px] mt-2 font-bold tracking-wider">
                            <span>1K</span><span>200K+</span>
                        </div>
                    </div>
                </div>

                <!-- Region Filter -->
                <div class="mb-8">
                    <p class="text-white/40 text-xs font-bold uppercase tracking-widest mb-4">Region</p>
                    <div class="relative">
                        <select id="region-filter" onchange="applyFilters()"
                            class="w-full bg-[#0A1A2F] border border-white/10 text-white text-sm rounded-xl px-4 py-3 outline-none appearance-none cursor-pointer hover:border-white/30 transition-colors">
                            <option value="">🌎 All Regions</option>
                            <option value="Everest">🏔️ Everest Region</option>
                            <option value="Annapurna">⛰️ Annapurna Region</option>
                            <option value="Langtang">🌲 Langtang Region</option>
                            <option value="Mustang">🏜️ Mustang</option>
                            <option value="Pokhara">🛶 Pokhara</option>
                            <option value="Chitwan">🦏 Chitwan</option>
                            <option value="Kathmandu">⛩️ Kathmandu Valley</option>
                            <option value="Lumbini">🛕 Lumbini</option>
                        </select>
                        <span class="material-icons absolute right-4 top-1/2 -translate-y-1/2 text-white/40 pointer-events-none">expand_more</span>
                    </div>
                </div>

                <!-- Duration Filter -->
                <div class="mb-8">
                    <p class="text-white/40 text-xs font-bold uppercase tracking-widest mb-4">Duration</p>
                    <div class="space-y-3">
                        <label class="group flex items-center gap-3 cursor-pointer">
                            <div class="relative flex items-center">
                                <input type="radio" name="duration" value="" class="peer sr-only" checked onchange="applyFilters()">
                                <div class="w-5 h-5 rounded border-2 border-white/20 peer-checked:border-[#C5A059] peer-checked:bg-[#C5A059] transition-all flex items-center justify-center">
                                    <span class="material-icons text-xs text-[#07203B] opacity-0 peer-checked:opacity-100 transition-opacity">check</span>
                                </div>
                            </div>
                            <span class="text-white/70 text-sm group-hover:text-white transition-colors">Any Duration</span>
                        </label>
                        <label class="group flex items-center gap-3 cursor-pointer">
                            <div class="relative flex items-center">
                                <input type="radio" name="duration" value="1-3" class="peer sr-only" onchange="applyFilters()">
                                <div class="w-5 h-5 rounded border-2 border-white/20 peer-checked:border-[#C5A059] peer-checked:bg-[#C5A059] transition-all flex items-center justify-center">
                                    <span class="material-icons text-xs text-[#07203B] opacity-0 peer-checked:opacity-100 transition-opacity">check</span>
                                </div>
                            </div>
                            <span class="text-white/70 text-sm group-hover:text-white transition-colors">1–3 Days (Short)</span>
                        </label>
                        <label class="group flex items-center gap-3 cursor-pointer">
                            <div class="relative flex items-center">
                                <input type="radio" name="duration" value="4-7" class="peer sr-only" onchange="applyFilters()">
                                <div class="w-5 h-5 rounded border-2 border-white/20 peer-checked:border-[#C5A059] peer-checked:bg-[#C5A059] transition-all flex items-center justify-center">
                                    <span class="material-icons text-xs text-[#07203B] opacity-0 peer-checked:opacity-100 transition-opacity">check</span>
                                </div>
                            </div>
                            <span class="text-white/70 text-sm group-hover:text-white transition-colors">4–7 Days (Standard)</span>
                        </label>
                        <label class="group flex items-center gap-3 cursor-pointer">
                            <div class="relative flex items-center">
                                <input type="radio" name="duration" value="8-14" class="peer sr-only" onchange="applyFilters()">
                                <div class="w-5 h-5 rounded border-2 border-white/20 peer-checked:border-[#C5A059] peer-checked:bg-[#C5A059] transition-all flex items-center justify-center">
                                    <span class="material-icons text-xs text-[#07203B] opacity-0 peer-checked:opacity-100 transition-opacity">check</span>
                                </div>
                            </div>
                            <span class="text-white/70 text-sm group-hover:text-white transition-colors">8–14 Days (Extended)</span>
                        </label>
                        <label class="group flex items-center gap-3 cursor-pointer">
                            <div class="relative flex items-center">
                                <input type="radio" name="duration" value="15+" class="peer sr-only" onchange="applyFilters()">
                                <div class="w-5 h-5 rounded border-2 border-white/20 peer-checked:border-[#C5A059] peer-checked:bg-[#C5A059] transition-all flex items-center justify-center">
                                    <span class="material-icons text-xs text-[#07203B] opacity-0 peer-checked:opacity-100 transition-opacity">check</span>
                                </div>
                            </div>
                            <span class="text-white/70 text-sm group-hover:text-white transition-colors">15+ Days (Expedition)</span>
                        </label>
                    </div>
                </div>

            </div>
        </aside>

        <!-- Results Area -->
        <div class="flex-1">
            <!-- Top Bar: Count & Sort -->
            <div class="glass-card rounded-2xl p-4 mb-8 flex flex-col sm:flex-row items-center justify-between gap-4">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-full bg-[#C5A059]/10 flex items-center justify-center text-[#C5A059]">
                        <span class="material-icons">travel_explore</span>
                    </div>
                    <div>
                        <p class="text-white font-bold text-lg leading-tight"><span id="count-num" class="text-[#C5A059]">0</span> Packages</p>
                        <p class="text-white/40 text-xs">Matching your preferences</p>
                    </div>
                </div>
                
                <div class="flex items-center gap-3 w-full sm:w-auto">
                    <span class="text-white/40 text-sm hidden sm:inline">Sort by:</span>
                    <div class="relative w-full sm:w-48">
                        <select id="sort-select" onchange="applyFilters()"
                            class="w-full bg-[#0A1A2F] border border-white/10 text-white text-sm rounded-xl px-4 py-2.5 outline-none appearance-none cursor-pointer">
                            <option value="default">✨ Recommended</option>
                            <option value="price-asc">💰 Price: Low to High</option>
                            <option value="price-desc">💎 Price: High to Low</option>
                            <option value="rating">⭐ Top Rated</option>
                            <option value="duration-asc">⏱️ Duration: Shortest</option>
                        </select>
                        <span class="material-icons absolute right-3 top-1/2 -translate-y-1/2 text-white/40 pointer-events-none text-sm">expand_more</span>
                    </div>
                </div>
            </div>

            <!-- Loading Skeleton -->
            <div id="skeleton-grid" class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <% for(int i=0;i<4;i++) { %>
                <div class="glass-card rounded-2xl h-96 animate-pulse">
                    <div class="h-56 bg-white/5 rounded-t-2xl"></div>
                    <div class="p-6 space-y-4">
                        <div class="h-4 bg-white/10 rounded w-1/4"></div>
                        <div class="h-6 bg-white/10 rounded w-3/4"></div>
                        <div class="h-4 bg-white/10 rounded w-full"></div>
                        <div class="flex justify-between pt-4">
                            <div class="h-6 bg-white/10 rounded w-1/3"></div>
                            <div class="h-8 bg-white/10 rounded w-1/4"></div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>

            <!-- Packages Grid -->
            <div id="packages-grid" class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-2 gap-6 hidden"></div>

            <!-- Empty State -->
            <div id="empty-state" class="hidden glass-card rounded-3xl p-16 text-center">
                <div class="w-24 h-24 bg-white/5 rounded-full flex items-center justify-center mx-auto mb-6 border border-white/10">
                    <span class="material-icons text-5xl text-white/20">search_off</span>
                </div>
                <h3 class="text-white font-display text-2xl font-bold mb-2">No packages found</h3>
                <p class="text-white/50 mb-8 max-w-md mx-auto">We couldn't find any packages matching your current filters. Try adjusting your budget, region, or duration.</p>
                <button onclick="resetFilters()" class="bg-[#C5A059] hover:bg-[#b8904f] text-[#07203B] font-bold px-8 py-3 rounded-full transition-colors">
                    Clear All Filters
                </button>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
    let allPackages = [];
    let filtered = [];
    let activeType = 'all';

    // Premium Image Fallbacks
    const typeImages = {
        trekking: [
            'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&q=80',
            'https://images.unsplash.com/photo-1522163182402-834f871fd851?w=800&q=80'
        ],
        hotel: [
            'https://images.unsplash.com/photo-1542314831-c6a4d14d8373?w=800&q=80',
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80'
        ],
        travel: [
            'https://images.unsplash.com/photo-1544735716-392fe2489ffa?w=800&q=80',
            'https://images.unsplash.com/photo-1581793541457-3f33ed1a71c8?w=800&q=80'
        ]
    };

    function getImage(pkg, idx) {
        if (pkg.images) {
            try {
                const imgs = JSON.parse(pkg.images);
                if (imgs && imgs.length > 0) return imgs[0];
            } catch(e) {}
        }
        const arr = typeImages[pkg.type] || typeImages.travel;
        return arr[idx % arr.length];
    }

    function formatPrice(price) {
        if (!price) return 'Contact Agency';
        return 'NPR ' + Number(price).toLocaleString('en-IN');
    }

    function renderStars(rating) {
        let stars = '';
        const r = Math.round(rating);
        for (let i = 1; i <= 5; i++) {
            stars += `<span class="material-icons text-[14px] ${i <= r ? 'text-[#C5A059]' : 'text-white/20'}">star</span>`;
        }
        return stars;
    }

    function typeConfig(type) {
        const conf = {
            trekking: { icon: 'landscape', color: 'text-blue-400', bg: 'bg-blue-500/20', border: 'border-blue-500/30', label: 'Trek' },
            hotel: { icon: 'hotel', color: 'text-purple-400', bg: 'bg-purple-500/20', border: 'border-purple-500/30', label: 'Hotel' },
            travel: { icon: 'flight', color: 'text-emerald-400', bg: 'bg-emerald-500/20', border: 'border-emerald-500/30', label: 'Tour' }
        };
        return conf[type] || conf.travel;
    }

    function renderCard(pkg, idx) {
        const img = getImage(pkg, idx);
        const tConf = typeConfig(pkg.type);
        const animationDelay = (idx * 0.1) + 's';
        
        return `
        <div class="pkg-card glass-panel rounded-3xl overflow-hidden cursor-pointer flex flex-col h-full animate-grid-item" 
             style="animation-delay: ${animationDelay}"
             onclick="window.location.href='package-details.jsp?id=${pkg.id}'">
            
            <!-- Image Section -->
            <div class="relative h-64 overflow-hidden">
                <img src="${img}" alt="${pkg.title}" class="card-img w-full h-full object-cover" loading="lazy">
                <div class="absolute inset-0 bg-gradient-to-t from-[#0A1A2F] via-transparent to-black/30"></div>
                
                <!-- Top Badges -->
                <div class="absolute top-4 left-4 flex gap-2">
                    <span class="flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-bold backdrop-blur-md ${tConf.bg} ${tConf.color} ${tConf.border} border">
                        <span class="material-icons text-[14px]">${tConf.icon}</span> ${tConf.label}
                    </span>
                    ${pkg.difficulty ? `
                    <span class="flex items-center gap-1 px-3 py-1.5 rounded-full text-xs font-bold backdrop-blur-md bg-orange-500/20 text-orange-400 border border-orange-500/30">
                        <span class="material-icons text-[14px]">terrain</span> ${pkg.difficulty}
                    </span>` : ''}
                </div>
                
                <!-- Wishlist Btn -->
                <button class="absolute top-4 right-4 w-10 h-10 rounded-full bg-black/20 backdrop-blur-md border border-white/10 flex items-center justify-center text-white hover:text-[#C5A059] hover:bg-white/10 transition-colors" onclick="event.stopPropagation();">
                    <span class="material-icons text-sm">favorite_border</span>
                </button>

                <!-- Duration -->
                ${pkg.duration ? `
                <div class="absolute bottom-4 left-4 flex items-center gap-1.5 bg-black/50 backdrop-blur-md px-3 py-1.5 rounded-lg border border-white/10">
                    <span class="material-icons text-[#C5A059] text-sm">schedule</span>
                    <span class="text-white text-xs font-bold">${pkg.duration} Days</span>
                </div>` : ''}
            </div>

            <!-- Content Section -->
            <div class="p-6 flex flex-col flex-1 relative">
                <!-- Location -->
                ${pkg.location ? `
                <div class="flex items-center gap-1 text-white/50 text-xs mb-2 uppercase tracking-wider font-bold">
                    <span class="material-icons text-[#C5A059] text-[14px]">place</span> ${pkg.location}
                </div>` : ''}
                
                <h3 class="text-white font-display font-bold text-xl leading-tight mb-3 line-clamp-2 group-hover:text-[#C5A059] transition-colors">${pkg.title}</h3>
                
                <p class="text-white/50 text-sm leading-relaxed mb-6 line-clamp-2 flex-1">${pkg.description || 'Experience the beauty of Nepal with this curated package.'}</p>
                
                <!-- Footer Info -->
                <div class="mt-auto pt-4 border-t border-white/10 flex items-end justify-between">
                    <div>
                        <div class="flex items-center gap-1 mb-1">
                            ${renderStars(pkg.avgRating || 0)}
                            <span class="text-white/40 text-xs ml-1 font-medium">(${pkg.reviewCount || 0})</span>
                        </div>
                        <p class="text-white/40 text-[10px] uppercase tracking-widest mb-0.5">Starting from</p>
                        <p class="text-[#C5A059] font-bold text-xl">${formatPrice(pkg.price)}</p>
                    </div>
                    <div class="w-12 h-12 rounded-full bg-[#C5A059]/10 flex items-center justify-center border border-[#C5A059]/30 text-[#C5A059] transition-transform group-hover:scale-110 group-hover:bg-[#C5A059] group-hover:text-[#07203B]">
                        <span class="material-icons">arrow_forward</span>
                    </div>
                </div>
            </div>
        </div>`;
    }

    // Filter Logic
    function updateBudgetLabel(val) {
        document.getElementById('budget-label').textContent = 'NPR ' + Number(val).toLocaleString('en-IN');
    }

    function setType(type) {
        activeType = type;
        document.querySelectorAll('.filter-chip').forEach(btn => {
            btn.classList.toggle('active', btn.dataset.type === type);
            // reset borders on active
            if(btn.dataset.type === type) {
                btn.classList.remove('border-white/5', 'hover:border-white/20');
            } else {
                btn.classList.add('border-white/5', 'hover:border-white/20');
            }
        });
        applyFilters();
    }

    function applyFilters() {
        const budget = parseInt(document.getElementById('budget-filter').value);
        const region = document.getElementById('region-filter').value.toLowerCase();
        const duration = document.querySelector('input[name="duration"]:checked').value;
        const sort = document.getElementById('sort-select').value;
        const q = document.getElementById('search-input').value.toLowerCase().trim();

        filtered = allPackages.filter(pkg => {
            if (activeType !== 'all' && pkg.type !== activeType) return false;
            if (pkg.price && parseFloat(pkg.price) > budget) return false;
            if (region && pkg.location && !pkg.location.toLowerCase().includes(region)) return false;
            if (duration) {
                const d = pkg.duration || 0;
                if (duration === '1-3' && (d < 1 || d > 3)) return false;
                if (duration === '4-7' && (d < 4 || d > 7)) return false;
                if (duration === '8-14' && (d < 8 || d > 14)) return false;
                if (duration === '15+' && d < 15) return false;
            }
            if (q) {
                const haystack = (pkg.title||'') + (pkg.location||'') + (pkg.description||'') + (pkg.type||'');
                if (!haystack.toLowerCase().includes(q)) return false;
            }
            return true;
        });

        // Sort
        if (sort === 'price-asc') filtered.sort((a,b) => parseFloat(a.price||0)-parseFloat(b.price||0));
        else if (sort === 'price-desc') filtered.sort((a,b) => parseFloat(b.price||0)-parseFloat(a.price||0));
        else if (sort === 'rating') filtered.sort((a,b) => (b.avgRating||0)-(a.avgRating||0));
        else if (sort === 'duration-asc') filtered.sort((a,b) => (a.duration||0)-(b.duration||0));

        renderGrid();
    }

    function renderGrid() {
        const grid = document.getElementById('packages-grid');
        const empty = document.getElementById('empty-state');
        
        // Animate counter
        const counter = document.getElementById('count-num');
        const targetCount = filtered.length;
        counter.textContent = targetCount;

        if (filtered.length === 0) {
            grid.classList.add('hidden');
            empty.classList.remove('hidden');
        } else {
            empty.classList.add('hidden');
            grid.classList.remove('hidden');
            grid.innerHTML = filtered.map((pkg, i) => renderCard(pkg, i)).join('');
        }
    }

    function resetFilters() {
        setType('all');
        document.getElementById('region-filter').value = '';
        document.getElementById('budget-filter').value = 200000;
        updateBudgetLabel(200000);
        document.getElementById('sort-select').value = 'default';
        document.querySelector('input[name="duration"][value=""]').checked = true;
        document.getElementById('search-input').value = '';
        applyFilters();
    }

    function doSearch() { applyFilters(); }

    document.getElementById('search-input').addEventListener('keydown', e => {
        if (e.key === 'Enter') doSearch();
    });

    // Fetch Data
    async function loadPackages() {
        try {
            const res = await fetch('api/listings/');
            const data = await res.json();
            allPackages = Array.isArray(data) ? data : [];
        } catch(e) {
            console.error("Failed to load packages", e);
            allPackages = [];
        }
        
        // Small delay to show off the skeleton loader (feels more real)
        setTimeout(() => {
            document.getElementById('skeleton-grid').classList.add('hidden');
            applyFilters();
        }, 800);
    }

    // Init
    loadPackages();
</script>
</body>
</html>
