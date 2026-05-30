<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/navbar.jsp" />
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?redirect=" + request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : ""));
        return;
    }
%>

<style>
    /* Premium UI Utilities */
    .glass-panel {
        background: rgba(255, 255, 255, 0.03);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: 1px solid rgba(255, 255, 255, 0.08);
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
    }
    
    .text-gradient {
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-image: linear-gradient(135deg, #C5A059, #E8D099);
    }

    /* Hero Parallax Setup */
    .hero-parallax {
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }

    /* Custom Tabs */
    .tab-btn {
        position: relative;
        padding-bottom: 12px;
        transition: color 0.3s ease;
    }
    .tab-btn::after {
        content: ''; position: absolute; bottom: 0; left: 0; width: 100%; height: 2px;
        background: #C5A059; transform: scaleX(0); transition: transform 0.3s ease; transform-origin: left;
    }
    .tab-btn.active { color: #C5A059; }
    .tab-btn.active::after { transform: scaleX(1); }
    
    .tab-panel {
        opacity: 0; visibility: hidden; position: absolute; top: 0; left: 0; width: 100%; transition: all 0.4s ease; transform: translateY(10px);
    }
    .tab-panel.active {
        opacity: 1; visibility: visible; position: relative; transform: translateY(0);
    }
    .tabs-container { position: relative; min-height: 300px; } /* Prevent layout jumping */

    /* Itinerary Timeline */
    .timeline-item { position: relative; padding-left: 2rem; border-left: 2px dashed rgba(197, 160, 89, 0.3); padding-bottom: 2rem; }
    .timeline-item:last-child { border-left: 2px dashed transparent; padding-bottom: 0; }
    .timeline-dot { position: absolute; left: -9px; top: 0; width: 16px; height: 16px; border-radius: 50%; background: #07203B; border: 3px solid #C5A059; box-shadow: 0 0 10px rgba(197, 160, 89, 0.5); }

    /* Amenity Chips */
    .amenity-chip {
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        transition: all 0.3s ease;
    }
    .amenity-chip:hover {
        background: rgba(197, 160, 89, 0.1);
        border-color: rgba(197, 160, 89, 0.3);
        transform: translateY(-2px);
    }
</style>

<!-- Loading State -->
<div id="loading-state" class="min-h-screen bg-[#07203B] flex flex-col items-center justify-center fixed inset-0 z-50">
    <div class="relative w-20 h-20 mb-6">
        <div class="absolute inset-0 border-4 border-[#C5A059]/20 rounded-full"></div>
        <div class="absolute inset-0 border-4 border-[#C5A059] rounded-full border-t-transparent animate-spin"></div>
        <span class="material-icons absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-[#C5A059]">landscape</span>
    </div>
    <h2 class="font-serif text-2xl text-white mb-2">Preparing Details</h2>
    <p class="text-white/50 text-sm tracking-widest uppercase">Please wait...</p>
</div>

<!-- Error State -->
<div id="error-state" class="min-h-screen bg-[#07203B] flex flex-col items-center justify-center fixed inset-0 z-50 hidden">
    <div class="w-24 h-24 rounded-full bg-red-500/10 flex items-center justify-center border border-red-500/20 mb-6">
        <span class="material-icons text-5xl text-red-400">error_outline</span>
    </div>
    <h2 class="font-serif text-3xl text-white mb-2">Package Unavailable</h2>
    <p class="text-white/50 text-sm mb-8">This package might have been removed or the link is invalid.</p>
    <a href="packages.jsp" class="bg-[#C5A059] hover:bg-[#b8904f] text-[#07203B] font-bold px-8 py-3 rounded-full transition-colors">
        Browse Packages
    </a>
</div>

<!-- Main Content (Hidden initially) -->
<div id="detail-content" class="hidden bg-[#07203B] min-h-screen pb-20">

    <!-- Premium Hero Section -->
    <div id="hero-bg" class="relative h-[60vh] min-h-[500px] w-full hero-parallax flex items-end" style="background-image: url('https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600');">
        <!-- Overlays -->
        <div class="absolute inset-0 bg-black/30"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-[#07203B] via-[#07203B]/60 to-transparent"></div>
        
        <!-- Back Button -->
        <a href="packages.jsp" class="absolute top-28 left-4 md:left-10 glass-panel text-white text-xs font-bold uppercase tracking-widest px-5 py-2.5 rounded-full flex items-center gap-2 hover:bg-white/10 transition-colors z-10 group">
            <span class="material-icons text-sm group-hover:-translate-x-1 transition-transform">west</span> Back
        </a>

        <!-- Content -->
        <div class="relative z-10 w-full max-w-7xl mx-auto px-4 pb-12">
            <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                <div class="max-w-3xl fade-in-up">
                    <div id="hero-badges" class="flex flex-wrap gap-3 mb-4"></div>
                    <h1 id="pkg-title" class="font-serif text-4xl md:text-6xl lg:text-7xl text-white font-bold mb-4 leading-tight drop-shadow-lg"></h1>
                    <div class="flex flex-wrap items-center gap-6 text-white/80">
                        <span id="pkg-location" class="flex items-center gap-1.5 font-medium"><span class="material-icons text-[#C5A059]">place</span> Location</span>
                        <span id="pkg-duration-hero" class="flex items-center gap-1.5 font-medium hidden"><span class="material-icons text-[#C5A059]">schedule</span> Duration</span>
                        <span id="pkg-agency-hero" class="flex items-center gap-1.5 font-medium"><span class="material-icons text-[#C5A059]">business</span> Agency</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Grid -->
    <div class="max-w-7xl mx-auto px-4 pt-10 grid grid-cols-1 lg:grid-cols-12 gap-10 relative">

        <!-- Left Column: Details -->
        <div class="lg:col-span-8 fade-in-up-delay-1">
            
            <!-- Quick Highlights (Stats) -->
            <div id="stats-row" class="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-12"></div>

            <!-- Tab Navigation -->
            <div class="flex overflow-x-auto custom-scrollbar gap-8 border-b border-white/10 mb-8 pb-1">
                <button class="tab-btn active text-sm font-bold uppercase tracking-widest text-white whitespace-nowrap" onclick="switchTab('overview')">Overview</button>
                <button class="tab-btn text-sm font-bold uppercase tracking-widest text-white/50 whitespace-nowrap" onclick="switchTab('itinerary')">Itinerary</button>
                <button class="tab-btn text-sm font-bold uppercase tracking-widest text-white/50 whitespace-nowrap" onclick="switchTab('amenities')">Amenities & Includes</button>
            </div>

            <!-- Tab Panels Container -->
            <div class="tabs-container">
                
                <!-- OVERVIEW -->
                <div id="tab-overview" class="tab-panel active">
                    <h2 class="font-display text-2xl text-white font-bold mb-6">About This Experience</h2>
                    <p id="pkg-description" class="text-white/70 text-base leading-relaxed mb-8 whitespace-pre-line font-light"></p>
                    
                    <div id="pkg-offers" class="hidden mb-8">
                        <div class="bg-gradient-to-r from-[#C5A059]/20 to-transparent border-l-4 border-[#C5A059] p-6 rounded-r-2xl relative overflow-hidden">
                            <span class="material-icons absolute -right-4 -bottom-4 text-8xl text-[#C5A059]/10 rotate-12">local_offer</span>
                            <h3 class="text-[#C5A059] font-bold text-lg mb-2 flex items-center gap-2">
                                <span class="material-icons text-base">auto_awesome</span> Special Offer
                            </h3>
                            <p id="offers-content" class="text-white/80 text-sm leading-relaxed"></p>
                        </div>
                    </div>
                </div>

                <!-- ITINERARY -->
                <div id="tab-itinerary" class="tab-panel">
                    <h2 class="font-display text-2xl text-white font-bold mb-8">Journey Plan</h2>
                    <div id="itinerary-content" class="ml-2 mt-4"></div>
                    <div id="no-itinerary" class="hidden glass-panel p-8 rounded-3xl text-center">
                        <span class="material-icons text-4xl text-white/20 mb-3">map</span>
                        <p class="text-white/50">Detailed itinerary is not provided. <br>Our agency partner will guide you through the custom plan.</p>
                    </div>
                </div>

                <!-- AMENITIES & INCLUDES -->
                <div id="tab-amenities" class="tab-panel">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                        <!-- What's Included / Excluded -->
                        <div class="space-y-6">
                            <h2 class="font-display text-xl text-white font-bold mb-4">Inclusions & Exclusions</h2>
                            <div class="bg-emerald-500/10 border border-emerald-500/20 rounded-2xl p-6">
                                <h3 class="text-emerald-400 font-bold mb-4 flex items-center gap-2"><span class="material-icons text-sm">check_circle</span> What's Included</h3>
                                <ul id="included-list" class="space-y-3 text-white/70 text-sm"></ul>
                            </div>
                            <div class="bg-red-500/10 border border-red-500/20 rounded-2xl p-6 mt-4">
                                <h3 class="text-red-400 font-bold mb-4 flex items-center gap-2"><span class="material-icons text-sm">cancel</span> What's Not Included</h3>
                                <ul id="excluded-list" class="space-y-3 text-white/70 text-sm"></ul>
                            </div>
                        </div>

                        <!-- Amenities -->
                        <div>
                            <h2 class="font-display text-xl text-white font-bold mb-6">Facilities & Amenities</h2>
                            <div id="amenities-content" class="flex flex-wrap gap-3"></div>
                            <div id="no-amenities" class="hidden">
                                <p class="text-white/50 text-sm italic">Specific amenities are not listed. Standard facilities apply based on package type.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Right Column: Sticky Booking Card -->
        <div class="lg:col-span-4 relative fade-in-up-delay-2">
            <div class="glass-panel rounded-3xl p-8 sticky top-28">
                
                <!-- Header -->
                <div class="mb-6 pb-6 border-b border-white/10">
                    <p class="text-white/40 text-[10px] font-bold uppercase tracking-widest mb-1">Starting Price</p>
                    <div class="flex items-end gap-2">
                        <p id="card-price" class="text-4xl font-bold text-gradient">NPR 0</p>
                        <p class="text-white/40 text-sm pb-1">/ person</p>
                    </div>
                </div>

                <!-- Summary List -->
                <div id="card-quick" class="space-y-4 mb-8"></div>

                <!-- Review Snippet -->
                <div class="bg-white/5 rounded-2xl p-4 mb-8 flex items-center gap-4 border border-white/5">
                    <div class="bg-[#C5A059]/20 w-12 h-12 rounded-full flex items-center justify-center text-[#C5A059] font-bold text-lg" id="card-rating-num">0</div>
                    <div>
                        <div id="card-rating-stars" class="flex mb-0.5"></div>
                        <p class="text-white/50 text-xs"><span id="card-review-count">0</span> verified reviews</p>
                    </div>
                </div>

                <!-- Actions -->
                <button id="book-btn" onclick="goBook()" class="w-full bg-gradient-to-r from-[#C5A059] to-[#b8904f] hover:from-[#b8904f] hover:to-[#9a7840] text-[#07203B] font-bold text-sm tracking-wider uppercase py-4 rounded-xl transition-all shadow-[0_10px_20px_rgba(197,160,89,0.2)] hover:shadow-[0_15px_30px_rgba(197,160,89,0.4)] transform hover:-translate-y-1 mb-4">
                    Book This Experience
                </button>

                <button onclick="toggleWishlist()" id="wishlist-btn" class="w-full bg-white/5 hover:bg-white/10 text-white font-bold text-sm py-4 rounded-xl transition-all border border-white/10 flex items-center justify-center gap-2">
                    <span class="material-icons text-lg">favorite_border</span> Save to Wishlist
                </button>
                
                <p class="text-white/30 text-[10px] text-center mt-6 uppercase tracking-widest">Secure booking via YatraConnect</p>
            </div>
        </div>

    </div>
</div>

<jsp:include page="includes/footer.jsp" />

<script>
    let currentPackage = null;

    function getParam(name) { return new URLSearchParams(window.location.search).get(name); }

    function switchTab(name) {
        // Handle Buttons
        document.querySelectorAll('.tab-btn').forEach(btn => {
            const isMatch = btn.getAttribute('onclick').includes(name);
            btn.classList.toggle('active', isMatch);
            btn.classList.toggle('text-white', isMatch);
            btn.classList.toggle('text-white/50', !isMatch);
        });
        
        // Handle Panels
        document.querySelectorAll('.tab-panel').forEach(p => {
            p.classList.remove('active');
            if(p.id === 'tab-' + name) {
                // slight delay to allow display:block to apply before opacity transition
                setTimeout(() => p.classList.add('active'), 10);
            }
        });
    }

    function formatPrice(p) { return p ? 'NPR ' + Number(p).toLocaleString('en-IN') : 'Contact Agency'; }

    function renderStars(rating, sizeClass = 'text-[14px]') {
        let s = '';
        const r = Math.round(rating || 0);
        for (let i = 1; i <= 5; i++) s += `<span class="material-icons ${sizeClass} ${i <= r ? 'text-[#C5A059]' : 'text-white/20'}">star</span>`;
        return s;
    }

    function goBook() {
        if (!currentPackage) return;
        window.location.href = 'traveller/booking.jsp?listingId=' + currentPackage.id
            + '&agentId=' + currentPackage.agentId
            + '&title=' + encodeURIComponent(currentPackage.title)
            + '&price=' + (currentPackage.price || '')
            + '&type=' + currentPackage.type
            + '&agency=' + encodeURIComponent(currentPackage.companyName || '');
    }

    async function toggleWishlist() {
        if (!currentPackage) return;
        const btn = document.getElementById('wishlist-btn');
        const icon = btn.querySelector('.material-icons');
        
        try {
            const res = await fetch('wishlist', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({ action: 'toggle', listingId: currentPackage.id })
            });
            if (res.status === 401) {
                window.location.href = 'login.jsp?redirect=' + encodeURIComponent(window.location.href);
                return;
            }
            if (!res.ok) throw new Error('Network error');
            const data = await res.json();
            if (data.success) {
                const saved = data.status === 'added';
                icon.textContent = saved ? 'favorite' : 'favorite_border';
                icon.style.color = saved ? '#C5A059' : '';
                
                // Optional: Add a little pop animation
                icon.style.transform = 'scale(1.2)';
                setTimeout(() => icon.style.transform = 'scale(1)', 200);
            }
        } catch (e) {
            console.error('Error toggling wishlist', e);
            alert('Failed to update wishlist. Please try again.');
        }
    }

    function typeConfig(type) {
        const conf = {
            trekking: { icon: 'landscape', label: 'Trek', bg: 'bg-blue-500/20 text-blue-400 border-blue-500/30' },
            hotel: { icon: 'hotel', label: 'Hotel', bg: 'bg-purple-500/20 text-purple-400 border-purple-500/30' },
            travel: { icon: 'flight', label: 'Tour', bg: 'bg-emerald-500/20 text-emerald-400 border-emerald-500/30' }
        };
        return conf[type] || conf.travel;
    }

    function loadDetails(pkg) {
        currentPackage = pkg;

        // --- Hero Section ---
        let img = 'https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600';
        if (pkg.images) { try { const imgs=JSON.parse(pkg.images); if(imgs&&imgs[0]) img=imgs[0]; } catch(e){} }
        document.getElementById('hero-bg').style.backgroundImage = `url('${img}')`;
        
        document.getElementById('pkg-title').textContent = pkg.title || '';
        document.getElementById('pkg-location').innerHTML = `<span class="material-icons text-[#C5A059] text-lg">place</span> ${pkg.location || 'Nepal'}`;
        document.getElementById('pkg-agency-hero').innerHTML = `<span class="material-icons text-[#C5A059] text-lg">business</span> By ${pkg.companyName || 'Verified Partner'}`;
        
        if (pkg.duration) {
            const durEl = document.getElementById('pkg-duration-hero');
            durEl.innerHTML = `<span class="material-icons text-[#C5A059] text-lg">schedule</span> ${pkg.duration} Days`;
            durEl.classList.remove('hidden');
        }

        // Badges
        const tConf = typeConfig(pkg.type);
        const badgesHtml = `
            <span class="flex items-center gap-1.5 px-4 py-1.5 rounded-full text-xs font-bold backdrop-blur-md border ${tConf.bg}">
                <span class="material-icons text-[14px]">${tConf.icon}</span> ${tConf.label}
            </span>
            ${pkg.difficulty ? `
            <span class="flex items-center gap-1.5 px-4 py-1.5 rounded-full text-xs font-bold backdrop-blur-md bg-orange-500/20 text-orange-400 border border-orange-500/30 uppercase">
                <span class="material-icons text-[14px]">terrain</span> ${pkg.difficulty}
            </span>` : ''}
        `;
        document.getElementById('hero-badges').innerHTML = badgesHtml;

        // --- Quick Stats Row ---
        const stats = [
            { icon:'schedule', label:'Duration', val: pkg.duration ? `${pkg.duration} Days` : 'Flexible' },
            { icon:'group', label:'Group Size', val: pkg.maxGroupSize ? `Max ${pkg.maxGroupSize}` : 'Private/Open' },
            { icon:'trending_up', label:'Activity Level', val: pkg.difficulty ? pkg.difficulty.charAt(0).toUpperCase()+pkg.difficulty.slice(1) : 'All Levels' },
            { icon:'child_care', label:'Min Age', val: pkg.minAge ? `${pkg.minAge}+ Years` : 'Any Age' },
        ];
        document.getElementById('stats-row').innerHTML = stats.map(s => `
            <div class="glass-panel rounded-2xl p-5 flex flex-col items-center justify-center text-center">
                <div class="w-10 h-10 rounded-full bg-white/5 flex items-center justify-center mb-3">
                    <span class="material-icons text-[#C5A059]">${s.icon}</span>
                </div>
                <p class="text-white font-bold text-sm mb-1">${s.val}</p>
                <p class="text-white/40 text-[10px] uppercase tracking-widest">${s.label}</p>
            </div>`).join('');

        // --- Overview ---
        document.getElementById('pkg-description').textContent = pkg.description || 'Experience the beauty of Nepal.';
        if (pkg.offers) {
            document.getElementById('pkg-offers').classList.remove('hidden');
            document.getElementById('offers-content').textContent = pkg.offers;
        }

        // --- Itinerary ---
        if (pkg.itinerary) {
            try {
                const itinerary = JSON.parse(pkg.itinerary);
                const cont = document.getElementById('itinerary-content');
                if (Array.isArray(itinerary) && itinerary.length > 0) {
                    cont.innerHTML = itinerary.map((day, i) => `
                        <div class="timeline-item">
                            <div class="timeline-dot"></div>
                            <div class="bg-white/5 border border-white/10 rounded-2xl p-5 hover:bg-white/10 transition-colors">
                                <span class="inline-block px-2 py-1 rounded bg-[#C5A059]/20 text-[#C5A059] text-[10px] font-bold uppercase tracking-widest mb-2">Day ${i+1}</span>
                                <h4 class="text-white font-bold text-lg mb-2">${day.title || day}</h4>
                                ${day.description ? `<p class="text-white/60 text-sm leading-relaxed">${day.description}</p>` : ''}
                            </div>
                        </div>`).join('');
                } else document.getElementById('no-itinerary').classList.remove('hidden');
            } catch(e) { document.getElementById('no-itinerary').classList.remove('hidden'); }
        } else document.getElementById('no-itinerary').classList.remove('hidden');

        // --- Amenities & Includes ---
        if (pkg.amenities) {
            try {
                const am = JSON.parse(pkg.amenities);
                const cont = document.getElementById('amenities-content');
                if (Array.isArray(am) && am.length > 0) {
                    cont.innerHTML = am.map(a => `
                        <div class="amenity-chip px-4 py-2 rounded-xl flex items-center gap-2 text-white/80 text-sm font-medium">
                            <span class="material-icons text-[#C5A059] text-sm">check</span> ${a}
                        </div>`).join('');
                } else document.getElementById('no-amenities').classList.remove('hidden');
            } catch(e) { document.getElementById('no-amenities').classList.remove('hidden'); }
        } else document.getElementById('no-amenities').classList.remove('hidden');

        const defaultIncluded = {
            trekking: ['Experienced Government Licensed Guide','Trekking permits & TIMS','Accommodation during trek (Teahouse)','Meals (Breakfast, Lunch, Dinner)','Emergency evacuation coordination'],
            hotel: ['Luxury Room accommodation','Daily Breakfast buffet','24/7 Front desk & Concierge','High-speed Wi-Fi','Daily Housekeeping'],
            travel: ['Private Transportation','Professional Tour Guide','Monument Entry tickets','Standard Hotel accommodation','Welcome/Farewell dinner'],
        };
        const defaultExcluded = ['International flights & Visa fees','Personal Travel insurance','Personal expenses (Laundry, calls, etc)','Tips & gratuities for staff','Alcoholic & cold beverages'];
        
        const included = defaultIncluded[pkg.type] || defaultIncluded.travel;
        document.getElementById('included-list').innerHTML = included.map(i => `<li class="flex items-start gap-2"><span class="material-icons text-emerald-400 text-[18px] mt-0.5">check</span> <span>${i}</span></li>`).join('');
        document.getElementById('excluded-list').innerHTML = defaultExcluded.map(i => `<li class="flex items-start gap-2"><span class="material-icons text-red-400 text-[18px] mt-0.5">close</span> <span>${i}</span></li>`).join('');

        // --- Right Card ---
        document.getElementById('card-price').textContent = formatPrice(pkg.price);
        
        // Rating Block
        const rating = pkg.avgRating || 0;
        document.getElementById('card-rating-num').textContent = rating.toFixed(1);
        document.getElementById('card-rating-stars').innerHTML = renderStars(rating, 'text-[16px]');
        document.getElementById('card-review-count').textContent = pkg.reviewCount || 0;

        // Quick Highlights List
        const quickItems = [
            pkg.duration ? { icon:'schedule', text: `${pkg.duration} Days Journey` } : null,
            pkg.location ? { icon:'place', text: `Located in ${pkg.location}` } : null,
            pkg.difficulty ? { icon:'terrain', text: `Difficulty: ${pkg.difficulty}` } : null,
            { icon:'verified', text: `Operated by ${pkg.companyName || 'YatraConnect Partner'}` }
        ].filter(Boolean);
        
        document.getElementById('card-quick').innerHTML = quickItems.map(q =>
            `<div class="flex items-center gap-3 text-white/70 text-sm">
                <div class="w-8 h-8 rounded-full bg-white/5 flex items-center justify-center border border-white/5">
                    <span class="material-icons text-[16px] text-[#C5A059]">${q.icon}</span>
                </div>
                ${q.text}
            </div>`).join('');
    }

    async function init() {
        const id = getParam('id');
        if (!id) { showError(); return; }
        try {
            const res = await fetch('api/listings/' + id);
            if (!res.ok) throw new Error('not found');
            const pkg = await res.json();
            if (!pkg || pkg.error) { showError(); return; }
            
            // Check wishlist status
            try {
                const wRes = await fetch('wishlist', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: new URLSearchParams({ action: 'check', listingId: id })
                });
                if (wRes.ok) {
                    const wData = await wRes.json();
                    if (wData.success && wData.isWishlisted) {
                        const icon = document.querySelector('#wishlist-btn .material-icons');
                        icon.textContent = 'favorite';
                        icon.style.color = '#C5A059';
                    }
                }
            } catch(e) {}
            
            // Artificial delay for smooth transition feeling
            setTimeout(() => {
                document.getElementById('loading-state').classList.add('hidden');
                document.getElementById('detail-content').classList.remove('hidden');
                loadDetails(pkg);
            }, 600);
            
        } catch(e) {
            showError();
        }
    }

    function showError() {
        document.getElementById('loading-state').classList.add('hidden');
        document.getElementById('error-state').classList.remove('hidden');
    }

    init();
</script>
</body>
</html>
