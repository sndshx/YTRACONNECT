<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <jsp:include page="includes/header.jsp" />
    <jsp:include page="includes/navbar.jsp" />

    <!-- Enhanced Explore Header Section with Gradient Background -->
    <section
        class="relative bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 pt-32 pb-20 min-h-[600px] flex items-center overflow-hidden">
        <!-- Animated Background Elements -->
        <div class="absolute inset-0 overflow-hidden">
            <div class="absolute -top-40 -right-40 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl animate-pulse"></div>
            <div
                class="absolute -bottom-40 -left-40 w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl animate-pulse animation-delay-2000">
            </div>
        </div>

        <div
            class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full relative z-10 flex flex-col lg:flex-row items-center gap-16">
            <!-- Enhanced Text Content -->
            <div class="flex-1 text-left fade-in-up">
                <div class="flex items-center gap-4 mb-6">
                    <div class="h-1 w-12 bg-gradient-to-r from-cyan-400 to-blue-500"></div>
                    <span
                        class="text-cyan-400 text-[10px] md:text-xs font-bold tracking-widest uppercase bg-cyan-400/10 px-4 py-2 rounded-full border border-cyan-400/30">✨
                        Curated Collection</span>
                </div>
                <h1 class="text-5xl md:text-7xl lg:text-8xl font-sans font-black text-white leading-[1.05] mb-8">
                    EXPLORE<br>
                    THE <span
                        class="bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent font-serif italic">WORLD</span><br>
                    TODAY
                </h1>
                <p class="text-gray-300 text-sm md:text-lg font-light max-w-lg leading-relaxed mb-8">
                    Discover handpicked luxury hotels, breathtaking treks & unforgettable travel experiences across the
                    majestic Himalayas of Nepal.
                </p>
                <button
                    class="group px-8 py-4 bg-gradient-to-r from-cyan-400 to-blue-500 text-white font-bold rounded-full text-sm uppercase tracking-widest shadow-lg hover:shadow-cyan-500/50 transition-all duration-300 hover:scale-105">
                    START EXPLORING
                    <span
                        class="material-icons inline-block ml-2 group-hover:translate-x-1 transition-transform">arrow_forward</span>
                </button>
            </div>

            <!-- Enhanced Image Collage with Better Effects -->
            <div class="flex-1 flex gap-5 h-[350px] md:h-[450px] w-full max-w-2xl fade-in-up-delay-1">
                <!-- Main Large Image -->
                <div
                    class="flex-[1.5] h-full rounded-[2.5rem] overflow-hidden shadow-2xl border border-white/10 backdrop-blur-sm relative group cursor-pointer">
                    <img src="https://images.unsplash.com/photo-1501555088652-021faa106b9b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1473&q=80"
                        alt="Canyon View"
                        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-125">
                    <div
                        class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    </div>
                    <div class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity">
                        <p class="text-white font-bold text-sm">Mountain Panorama</p>
                    </div>
                </div>
                <!-- Smaller Images Column -->
                <div class="flex-1 flex flex-col gap-5 h-full">
                    <div
                        class="flex-1 rounded-[2.5rem] overflow-hidden shadow-xl border border-white/10 backdrop-blur-sm relative group cursor-pointer">
                        <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80"
                            alt="Luxury Hotel Pool"
                            class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-125">
                        <div
                            class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent opacity-0 group-hover:opacity-100 transition-opacity">
                        </div>
                    </div>
                    <div
                        class="flex-1 rounded-[2.5rem] overflow-hidden shadow-xl border border-white/10 backdrop-blur-sm relative group cursor-pointer">
                        <img src="https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?ixlib=rb-4.0.3&auto=format&fit=crop&w=1632&q=80"
                            alt="Elephant in Safari"
                            class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-125">
                        <div
                            class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent opacity-0 group-hover:opacity-100 transition-opacity">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Enhanced Filter and Search Bar with Glassmorphism -->
    <section
        class="bg-gradient-to-r from-white to-slate-50 border-b border-gray-200 sticky top-0 z-40 shadow-lg backdrop-blur-md py-5">
        <div
            class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row items-center justify-between gap-6">
            <!-- Categories with Enhanced Styling -->
            <div class="flex items-center gap-3 overflow-x-auto w-full md:w-auto pb-2 md:pb-0 no-scrollbar">
                <button
                    class="flex items-center gap-2 px-6 py-3 rounded-full bg-gradient-to-r from-cyan-400 to-blue-500 text-white text-[10px] font-bold tracking-widest uppercase transition-all shadow-lg hover:shadow-cyan-400/50 shrink-0 whitespace-nowrap">
                    <span class="material-icons text-sm">dashboard</span> All
                </button>
                <button
                    class="flex items-center gap-2 px-6 py-3 rounded-full bg-white text-gray-600 hover:bg-slate-100 hover:text-slate-900 text-[10px] font-bold tracking-widest uppercase transition-all border border-gray-200 hover:border-gray-300 shrink-0 whitespace-nowrap shadow-sm">
                    <span class="material-icons text-sm">hotel</span> Hotel
                </button>
                <button
                    class="flex items-center gap-2 px-6 py-3 rounded-full bg-white text-gray-600 hover:bg-slate-100 hover:text-slate-900 text-[10px] font-bold tracking-widest uppercase transition-all border border-gray-200 hover:border-gray-300 shrink-0 whitespace-nowrap shadow-sm">
                    <span class="material-icons text-sm">terrain</span> Trekking
                </button>
                <button
                    class="flex items-center gap-2 px-6 py-3 rounded-full bg-white text-gray-600 hover:bg-slate-100 hover:text-slate-900 text-[10px] font-bold tracking-widest uppercase transition-all border border-gray-200 hover:border-gray-300 shrink-0 whitespace-nowrap shadow-sm">
                    <span class="material-icons text-sm">explore</span> Travel
                </button>
            </div>

            <!-- Enhanced Search Input -->
            <div class="w-full md:w-[380px] relative group">
                <span
                    class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-sm group-focus-within:text-cyan-400 transition-colors">search</span>
                <input type="text" placeholder="Search experiences..."
                    class="w-full bg-white border border-gray-200 rounded-full py-3 pl-12 pr-5 text-xs font-medium text-gray-700 focus:outline-none focus:ring-2 focus:ring-cyan-400/30 focus:border-cyan-400 transition-all shadow-sm hover:border-gray-300">
            </div>
        </div>
    </section>


    <!-- Main Content Area with Improved Background -->
    <section class="bg-gradient-to-b from-slate-50 via-white to-slate-50 py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Enhanced Section Header -->
            <div class="mb-16 flex flex-col md:flex-row md:items-end justify-between gap-6">
                <div class="space-y-3">
                    <h2 class="text-4xl md:text-5xl font-black text-slate-900 tracking-tight">
                        FEATURED <span
                            class="bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent font-serif italic">EXPERIENCES</span>
                    </h2>
                    <p class="text-gray-500 text-base font-light max-w-2xl">Handpicked luxury destinations and
                        unforgettable adventures across the breathtaking landscapes of Nepal.</p>
                </div>
                <div class="flex items-center gap-3 px-6 py-3 bg-white rounded-full border border-gray-200 shadow-sm">
                    <span class="material-icons text-cyan-400 text-lg">list</span>
                    <span id="itemCount" class="text-lg font-black text-slate-900">60</span>
                    <span class="text-xs font-bold text-gray-400 uppercase tracking-widest">Found</span>
                </div>
            </div>

            <!-- Enhanced Experience Grid -->
            <div id="experienceGrid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                <!-- Items will be injected by JavaScript -->
            </div>

            <!-- Enhanced No Results State -->
            <div id="noResults"
                class="hidden flex flex-col items-center justify-center py-32 text-center animate-fade-in">
                <div
                    class="w-32 h-32 rounded-full bg-gradient-to-br from-slate-100 to-slate-200 flex items-center justify-center text-slate-300 mb-8 shadow-lg">
                    <span class="material-icons text-6xl">search_off</span>
                </div>
                <h3 class="text-3xl font-black text-slate-900 mb-3">No Experiences Found</h3>
                <p class="text-gray-500 text-base font-light max-w-md mx-auto mb-8">We couldn't find any listings
                    matching your criteria. Try adjusting your filters or search terms.</p>
                <button onclick="window.location.reload()"
                    class="px-8 py-4 bg-gradient-to-r from-cyan-400 to-blue-500 text-white rounded-full text-[10px] font-black uppercase tracking-widest shadow-lg hover:shadow-cyan-400/50 hover:scale-105 transition-all">Refresh
                    Page</button>
            </div>
        </div>
    </section>

    <script>
        let experiences = [];

        async function loadExperiences() {
            try {
                const apiUrl = '<%= request.getContextPath() %>/api/listings/';
                console.log('Fetching experiences from:', apiUrl);

                const response = await fetch(apiUrl);
                if (!response.ok) {
                    console.error('API response error:', response.status, response.statusText);
                    throw new Error('Network response was not ok');
                }

                const data = await response.json();
                console.log('Received data:', data);

                if (!Array.isArray(data)) {
                    console.error('Expected an array of experiences, but got:', typeof data);
                    throw new Error('Data format error: expected an array');
                }

                experiences = data.map(item => {
                    let images = [];
                    if (item.images) {
                        try {
                            // Safely handle potential JSON string or already parsed object/array
                            if (typeof item.images === 'string') {
                                const parsed = JSON.parse(item.images);
                                images = Array.isArray(parsed) ? parsed : [parsed];
                            } else if (Array.isArray(item.images)) {
                                images = item.images;
                            }
                        } catch (e) {
                            console.warn('Failed to parse images for item:', item.id, item.images);
                            images = [item.images];
                        }
                    }

                    return {
                        id: item.id,
                        type: item.type,
                        title: item.title,
                        location: item.location || 'Nepal',
                        price: item.price,
                        rating: item.avgRating || 0,
                        img: (Array.isArray(images) && images.length > 0) ? images[0] : 'https://images.unsplash.com/photo-1501555088652-021faa106b9b?q=80&w=800',
                        map: item.location ? `https://www.google.com/maps/search/\${encodeURIComponent(item.location)}` : '#',
                        desc: item.description,
                        region: item.difficulty || 'Discovery',
                        distance: item.duration ? `\${item.duration} days` : 'Flexible'
                    };
                });

                // Append requested hardcoded hotels
                const extraHotels = [
                    { id: 'h1', type: 'hotel', title: 'Hotel Everest View', location: 'Everest Region', price: 120, rating: 4.8, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Spectacular views of Mt. Everest.', region: 'Luxury', distance: 'Instant' },
                    { id: 'h2', type: 'hotel', title: 'Yeti Mountain Home Namche', location: 'Namche Bazaar', price: 130, rating: 4.9, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Cozy mountain home near Namche.', region: 'Luxury', distance: 'Instant' },
                    { id: 'h3', type: 'hotel', title: 'Everest Summit Lodge', location: 'Everest Base Camp', price: 150, rating: 4.9, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Lodge at the summit approach.', region: 'Luxury', distance: 'Instant' },
                    { id: 'h4', type: 'hotel', title: 'Ama Dablam Lodge', location: 'Ama Dablam Area', price: 110, rating: 4.7, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Elegant lodge near Ama Dablam.', region: 'Comfort', distance: 'Instant' },
                    { id: 'h5', type: 'hotel', title: 'Trekkers Lodge Tengboche', location: 'Tengboche', price: 100, rating: 4.6, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Traditional lodge in Tengboche.', region: 'Comfort', distance: 'Instant' },
                    { id: 'h6', type: 'hotel', title: 'Hotel Grand View', location: 'Annapurna Region', price: 75, rating: 4.8, img: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b', desc: 'Panoramic views of Annapurna.', region: 'Luxury', distance: 'Instant' },
                    { id: 'h7', type: 'hotel', title: 'Himalaya Guest House', location: 'Annapurna Region', price: 40, rating: 4.7, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Peaceful guest house.', region: 'Comfort', distance: 'Instant' },
                    { id: 'h8', type: 'hotel', title: 'Annapurna Guest House', location: 'Annapurna Region', price: 35, rating: 4.5, img: 'https://images.unsplash.com/photo-1581458983995-167812ea1bc8', desc: 'Authentic Himalayan hospitality.', region: 'Comfort', distance: 'Instant' },
                    { id: 'h9', type: 'hotel', title: 'Mardi Himal Eco Lodge', location: 'Annapurna Region', price: 50, rating: 4.9, img: 'https://images.unsplash.com/photo-1495365200479-c4ed1d35e1aa', desc: 'Eco-friendly lodge.', region: 'Eco', distance: 'Instant' },
                    { id: 'h10', type: 'hotel', title: 'Snowland Lodge', location: 'Annapurna Region', price: 55, rating: 4.6, img: 'https://images.unsplash.com/photo-1527004013197-933c4bb611b3', desc: 'Lodge with sunrise views.', region: 'Luxury', distance: 'Instant' },
                    { id: 'h11', type: 'hotel', title: 'Hotel Yala Peak', location: 'Annapurna Region', price: 60, rating: 4.6, img: 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c', desc: 'Adventure hotel.', region: 'Adventure', distance: 'Instant' },
                    { id: 'h12', type: 'hotel', title: 'Langtang View Hotel', location: 'Langtang Region', price: 55, rating: 4.7, img: 'https://images.unsplash.com/photo-1566073771259-6a8506099945', desc: 'Scenic Langtang views.', region: 'Scenic', distance: 'Instant' },
                    { id: 'h13', type: 'hotel', title: 'Friendly Guest House', location: 'Annapurna Region', price: 45, rating: 4.5, img: 'https://images.unsplash.com/photo-1495365200479-c4ed1d35e1aa', desc: 'Friendly atmosphere.', region: 'Comfort', distance: 'Instant' },
                    { id: 'h14', type: 'hotel', title: 'Lo Manthang Guest House', location: 'Upper Mustang', price: 70, rating: 4.8, img: 'https://images.unsplash.com/photo-1581442111029-798889506680', desc: 'Cultural guest house.', region: 'Cultural', distance: 'Instant' },
                    { id: 'h15', type: 'hotel', title: 'Kagbeni Guest House', location: 'Upper Mustang', price: 65, rating: 4.7, img: 'https://images.unsplash.com/photo-1581442111029-798889506680', desc: 'Guest house in Kagbeni.', region: 'Cultural', distance: 'Instant' }
                ];

                const extraTreks = [
                    { id: 't1', type: 'trekking', title: 'Everest Base Camp Trek', location: 'Everest Region', price: 1500, rating: 4.9, img: 'https://images.unsplash.com/photo-1522163182402-834f871fd851', desc: 'Iconic trek to Everest Base Camp.', region: 'Hard', distance: '14 days' },
                    { id: 't2', type: 'trekking', title: 'Annapurna Circuit Trek', location: 'Annapurna Region', price: 1100, rating: 4.8, img: 'https://images.unsplash.com/photo-1585016495481-91613a3f58ea', desc: 'Classic circuit trek.', region: 'Hard', distance: '18 days' },
                    { id: 't3', type: 'trekking', title: 'Annapurna Base Camp Trek', location: 'Annapurna Region', price: 950, rating: 4.8, img: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb', desc: 'Base camp trek.', region: 'Moderate', distance: '10 days' },
                    { id: 't4', type: 'trekking', title: 'Langtang Valley Trek', location: 'Langtang Region', price: 600, rating: 4.6, img: 'https://images.unsplash.com/photo-1518002022254-b3f163f3c5de', desc: 'Valley trek.', region: 'Moderate', distance: '8 days' },
                    { id: 't5', type: 'trekking', title: 'Ghorepani Poon Hill Trek', location: 'Annapurna Region', price: 450, rating: 4.7, img: 'https://images.unsplash.com/photo-1581458983995-167812ea1bc8', desc: 'Sunrise trek.', region: 'Easy', distance: '5 days' },
                    { id: 't6', type: 'trekking', title: 'Manaslu Circuit Trek', location: 'Manaslu Region', price: 1250, rating: 4.9, img: 'https://images.unsplash.com/photo-1544735745-b89b1da64bcc', desc: 'Remote circuit trek.', region: 'Hard', distance: '16 days' },
                    { id: 't7', type: 'trekking', title: 'Upper Mustang Trek', location: 'Upper Mustang', price: 1850, rating: 4.8, img: 'https://images.unsplash.com/photo-1581442111029-798889506680', desc: 'Tibetan kingdom trek.', region: 'Moderate', distance: '14 days' },
                    { id: 't8', type: 'trekking', title: 'Kanchenjunga Base Camp Trek', location: 'Taplejung', price: 1600, rating: 4.9, img: 'https://images.unsplash.com/photo-1522163182402-834f871fd851', desc: 'Base camp trek of Kanchenjunga.', region: 'Hard', distance: '21 days' },
                    { id: 't9', type: 'trekking', title: 'Mardi Himal Trek', location: 'Annapurna Region', price: 500, rating: 4.8, img: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b', desc: 'Scenic ridge trek.', region: 'Moderate', distance: '6 days' },
                    { id: 't10', type: 'trekking', title: 'Tilicho Lake Trek', location: 'Manang', price: 1150, rating: 4.8, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'High altitude lake trek.', region: 'Hard', distance: '15 days' },
                    { id: 't11', type: 'trekking', title: 'Gokyo Lakes Trek', location: 'Solu-Khumbu', price: 1350, rating: 4.9, img: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b', desc: 'Glacial lakes trek.', region: 'Hard', distance: '13 days' },
                    { id: 't12', type: 'trekking', title: 'Everest Three Passes Trek', location: 'Solu-Khumbu', price: 1750, rating: 5.0, img: 'https://images.unsplash.com/photo-1527004013197-933c4bb611b3', desc: 'Three high passes.', region: 'Hard', distance: '19 days' },
                    { id: 't13', type: 'trekking', title: 'Dhaulagiri Circuit Trek', location: 'Myagdi', price: 2100, rating: 4.9, img: 'https://images.unsplash.com/photo-1512100356356-de1b84283e18', desc: 'Remote circuit.', region: 'Hard', distance: '18 days' },
                    { id: 't14', type: 'trekking', title: 'Makalu Base Camp Trek', location: 'Sankhuwasabha', price: 1550, rating: 4.8, img: 'https://images.unsplash.com/photo-1605640840605-14ac1855827b', desc: 'Base camp trek.', region: 'Hard', distance: '17 days' },
                    { id: 't15', type: 'trekking', title: 'Rara Lake Trek', location: 'Mugu', price: 1400, rating: 4.7, img: 'https://images.unsplash.com/photo-1581458983995-167812ea1bc8', desc: 'Trek to Rara Lake.', region: 'Moderate', distance: '12 days' },
                    { id: 't16', type: 'trekking', title: 'Api Himal Trek', location: 'Darchula', price: 1650, rating: 4.8, img: 'https://images.unsplash.com/photo-1626206120816-1fba69300ab5', desc: 'Off‑beat Far‑Western trek.', region: 'Hard', distance: '15 days' },
                    { id: 't17', type: 'trekking', title: 'Pikey Peak Trek', location: 'Lower Solukhumbu', price: 650, rating: 4.7, img: 'https://images.unsplash.com/photo-1469796466635-455ede028ace', desc: 'Great views of Everest.', region: 'Moderate', distance: '7 days' },
                    { id: 't18', type: 'trekking', title: 'Helambu Trek', location: 'Sindhupalchok', price: 400, rating: 4.5, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b3', desc: 'Low‑altitude cultural trek.', region: 'Easy', distance: '6 days' },
                    { id: 't19', type: 'trekking', title: 'Tamang Heritage Trail', location: 'Tamang Region', price: 350, rating: 4.6, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Cultural heritage trail.', region: 'Easy', distance: '5 days' },
                    { id: 't20', type: 'trekking', title: 'Ruby Valley Trek', location: 'Ruby Valley', price: 500, rating: 4.7, img: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b', desc: 'Scenic valley trek.', region: 'Moderate', distance: '8 days' }
                ];

                // Extra Travel Packages
const extraTravel = [
    { id: 'tr1', type: 'travel', title: 'Kathmandu Heritage Tour', location: 'Kathmandu', price: 2500, rating: 4.8, img: 'https://images.unsplash.com/photo-1522120693490-657e6fa5eff5', desc: 'Durbar Square, Swayambhunath & Boudhanath visit', region: '', distance: '1 Day' },
    { id: 'tr2', type: 'travel', title: 'Nagarkot Sunrise Tour', location: 'Kathmandu', price: 2800, rating: 4.8, img: 'https://images.unsplash.com/photo-1516574187845-4aedbe0896b5', desc: 'Himalayan sunrise viewpoint trip', region: '', distance: '1 Day' },
    { id: 'tr3', type: 'travel', title: 'Pokhara City Tour', location: 'Pokhara', price: 3000, rating: 4.8, img: 'https://images.unsplash.com/photo-1502810190500-347e84af8acc', desc: 'Lake, caves & waterfall sightseeing', region: '', distance: '1 Day' },
    { id: 'tr4', type: 'travel', title: 'Sarangkot Sunrise Tour', location: 'Pokhara', price: 2500, rating: 4.8, img: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e', desc: 'Best sunrise over Annapurna range', region: '', distance: '1 Day' },
    { id: 'tr5', type: 'travel', title: 'Chitwan Jungle Safari', location: 'Chitwan National Park', price: 8000, rating: 4.8, img: 'https://images.unsplash.com/photo-1504376378476-f1b8a733c716', desc: 'Jeep safari, canoe ride & wildlife', region: '', distance: '2 Days' },
    { id: 'tr6', type: 'travel', title: 'Lumbini Spiritual Tour', location: 'Lumbini', price: 6500, rating: 4.8, img: 'https://images.unsplash.com/photo-1550542079-a5985d5e0534', desc: 'Monasteries & Buddha birthplace visit', region: '', distance: '2 Days' },
    { id: 'tr7', type: 'travel', title: 'Bhaktapur Cultural Tour', location: 'Bhaktapur', price: 2000, rating: 4.8, img: 'https://images.unsplash.com/photo-1545100295-7011c3e3901e', desc: 'Ancient temples & Newari heritage', region: '', distance: '1 Day' },
    { id: 'tr8', type: 'travel', title: 'Patan Heritage Tour', location: 'Patan', price: 2200, rating: 4.8, img: 'https://images.unsplash.com/photo-1589652717473-4acd95d7e16b', desc: 'Art, museums & Durbar Square', region: '', distance: '1 Day' },
    { id: 'tr9', type: 'travel', title: 'Bandipur Hill Tour', location: 'Bandipur', price: 5500, rating: 4.8, img: 'https://images.unsplash.com/photo-1507608869270-30a30819d3f2', desc: 'Peaceful village & mountain views', region: '', distance: '2 Days' },
    { id: 'tr10', type: 'travel', title: 'Rara Lake Adventure Tour', location: 'Rara Lake', price: 25000, rating: 4.8, img: 'https://images.unsplash.com/photo-1523741543316-5e3f0c562ebd', desc: "Nepal’s biggest and cleanest lake", region: '', distance: '4 Days' },
    { id: 'tr11', type: 'travel', title: 'Bardia Jungle Safari', location: 'Bardia National Park', price: 15000, rating: 4.8, img: 'https://images.unsplash.com/photo-1515553884-d083e586b5b4', desc: 'Tiger, rhino & jungle exploration', region: '', distance: '3 Days' },
    { id: 'tr12', type: 'travel', title: 'Gosaikunda Lake Tour', location: 'Gosaikunda', price: 12000, rating: 4.8, img: 'https://images.unsplash.com/photo-1519183071298-a2962ec7761b', desc: 'Sacred alpine lake trekking trip', region: '', distance: '3 Days' },
    { id: 'tr13', type: 'travel', title: 'Ilam Tea Garden Tour', location: 'Ilam', price: 10000, rating: 4.8, img: 'https://images.unsplash.com/photo-1531242169150-1f5e5ba20e77', desc: 'Green hills & tea estates visit', region: '', distance: '3 Days' },
    { id: 'tr14', type: 'travel', title: 'Daman Mountain View Tour', location: 'Daman', price: 3500, rating: 4.8, img: 'https://images.unsplash.com/photo-1491929818056-875613aa3f70', desc: 'Panoramic Himalayan range view', region: '', distance: '1 Day' },
    { id: 'tr15', type: 'travel', title: 'Upper Mustang Cultural Tour', location: 'Mustang', price: 40000, rating: 4.8, img: 'https://images.unsplash.com/photo-1552522565-5c2171be8b96', desc: 'Desert mountains & Tibetan culture', region: '', distance: '5 Days' }
];

// Merge API data with hardcoded listings
experiences = [...experiences, ...extraHotels, ...extraTreks, ...extraTravel];
                renderGrid();
            } catch (error) {
                console.error('Error loading experiences:', error);
                document.getElementById('experienceGrid').classList.add('hidden');
                document.getElementById('noResults').classList.remove('hidden');
            }
        }

        function renderGrid(filter = 'all', search = '') {
            const grid = document.getElementById('experienceGrid');
            const noResults = document.getElementById('noResults');
            const countDisplay = document.getElementById('itemCount');

            const filtered = experiences.filter(ex => {
                const matchesFilter = filter === 'all' || ex.type === filter;
                const matchesSearch = ex.title.toLowerCase().includes(search.toLowerCase()) ||
                    ex.location.toLowerCase().includes(search.toLowerCase());
                return matchesFilter && matchesSearch;
            });

            countDisplay.innerText = filtered.length;
            grid.innerHTML = '';

            if (filtered.length === 0) {
                grid.classList.add('hidden');
                noResults.classList.remove('hidden');
            } else {
                grid.classList.remove('hidden');
                noResults.classList.add('hidden');

                filtered.forEach((ex, index) => {
                    const extraTag = ex.type === 'trekking' ? `<div class="flex items-center gap-1 text-blue-600"><span class="material-icons text-[10px]">terrain</span><span class="text-[8px] font-black uppercase tracking-widest">\${ex.region}</span></div>` :
                        ex.type === 'travel' ? `<div class="flex items-center gap-1 text-blue-600"><span class="material-icons text-[10px]">route</span><span class="text-[8px] font-black uppercase tracking-widest">\${ex.distance}</span></div>` : '';

                    const card = `
                <div onclick="if(window.isLoggedIn) { window.location.href='<%= request.getContextPath() %>/package-details.jsp?id=\${ex.id}'; } else { window.location.href='<%= request.getContextPath() %>/login.jsp?redirect=explore.jsp'; }" class="group bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-2xl border border-gray-100 transition-all duration-500 hover:-translate-y-3 cursor-pointer flex flex-col h-full" style="animation-delay: \${index * 50}ms;">
                    <div class="relative h-56 overflow-hidden bg-gradient-to-br from-slate-200 to-slate-100 shrink-0">
                        <img src="\${ex.img}" alt="\${ex.title}" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-125">
                        
                        <!-- Rating Badge -->
                        <div class="absolute top-4 right-4 bg-white/95 backdrop-blur-md px-3 py-1.5 rounded-full flex items-center gap-1 shadow-lg border border-white/50">
                            <span class="material-icons text-yellow-500 text-[14px]">star_rate</span>
                            <span class="text-[11px] font-bold text-gray-900">\${ex.rating}</span>
                        </div>
                        
                        <!-- Wishlist Button -->
                        <button class="absolute top-4 left-4 w-10 h-10 rounded-full bg-white/20 backdrop-blur-md border border-white/20 flex items-center justify-center text-white hover:bg-red-500 hover:text-white transition-all shadow-xl opacity-0 group-hover:opacity-100 transform -translate-x-4 group-hover:translate-x-0 transition-all duration-500 z-10" onclick="event.stopPropagation();">
                            <span class="material-icons text-sm">favorite_border</span>
                        </button>

                        <!-- Type Badge -->
                        <div class="absolute bottom-4 left-4">
                            <span class="px-4 py-2 rounded-full bg-gradient-to-r from-cyan-400 to-blue-500 text-white text-[8px] font-black tracking-widest uppercase shadow-lg">
                                \${ex.type}
                            </span>
                        </div>
                        
                        <!-- Overlay on Hover -->
                        <div class="absolute inset-0 bg-black/20 opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
                    </div>
                    
                    <div class="p-6 flex flex-col flex-1">
                        <div class="space-y-2 mb-4">
                            <div class="flex items-center justify-between gap-2 flex-wrap">
                                <div class="flex items-center gap-1 text-blue-600">
                                    <span class="material-icons text-[13px]">location_on</span>
                                    <span class="text-[9px] font-bold tracking-widest uppercase">\${ex.location}</span>
                                </div>
                                \${extraTag}
                            </div>
                            <h3 class="text-base font-black text-slate-900 leading-tight group-hover:text-cyan-500 transition-colors line-clamp-2">\${ex.title}</h3>
                        </div>
                        
                        <p class="text-gray-500 text-[12px] font-light leading-relaxed line-clamp-2 mb-6 flex-1">\${ex.desc}</p>
                        
                        <div class="pt-5 border-t border-gray-100 flex flex-col gap-4 mt-auto">
                            <div class="flex items-center justify-between">
                                <div class="flex flex-col">
                                    <span class="text-gray-400 text-[9px] font-bold uppercase tracking-widest mb-0.5">Starting Price</span>
                                    <span class="text-slate-900 font-black text-xl">NPR \${ex.price}<span class="text-[10px] text-gray-400 font-medium">/pax</span></span>
                                </div>
                                <div class="flex items-center gap-1">
                                    <span class="material-icons text-green-500 text-[14px]">bolt</span>
                                    <span class="text-[9px] font-bold text-gray-500 uppercase tracking-widest">Instant</span>
                                </div>
                            </div>
                            <button class="w-full bg-slate-900 hover:bg-gradient-to-r hover:from-cyan-400 hover:to-blue-500 text-white text-[11px] font-black uppercase tracking-widest h-12 rounded-xl transition-all duration-300 shadow-md hover:shadow-cyan-500/40 flex items-center justify-center gap-2 group/btn relative overflow-hidden">
                                <span class="relative z-10 flex items-center gap-2">
                                    View Details & Book <span class="material-icons text-[14px] group-hover/btn:translate-x-1 transition-transform">arrow_forward</span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            `;
                    grid.innerHTML += card;
                });
            }
        }

        async function init() {
            await loadExperiences();

            const urlParams = new URLSearchParams(window.location.search);
            const typeParam = urlParams.get('type');

            if (typeParam) {
                document.querySelectorAll('button[class*="rounded-full"]').forEach(btn => {
                    const label = btn.innerText.toLowerCase();
                    if (label.includes(typeParam)) {
                        document.querySelectorAll('button[class*="rounded-full"]').forEach(b => {
                            b.classList.remove('bg-gradient-to-r', 'from-cyan-400', 'to-blue-500', 'text-white', 'shadow-lg');
                            b.classList.add('bg-white', 'text-gray-600', 'border-gray-200');
                        });
                        btn.classList.remove('bg-white', 'text-gray-600', 'border-gray-200');
                        btn.classList.add('bg-gradient-to-r', 'from-cyan-400', 'to-blue-500', 'text-white', 'shadow-lg');
                    }
                });

                renderGrid(typeParam, document.querySelector('input').value);
            }

            document.querySelectorAll('button[class*="rounded-full"]').forEach(btn => {
                btn.addEventListener('click', function () {
                    document.querySelectorAll('button[class*="rounded-full"]').forEach(b => {
                        b.classList.remove('bg-gradient-to-r', 'from-cyan-400', 'to-blue-500', 'text-white', 'shadow-lg');
                        b.classList.add('bg-white', 'text-gray-600', 'border-gray-200');
                    });
                    this.classList.remove('bg-white', 'text-gray-600', 'border-gray-200');
                    this.classList.add('bg-gradient-to-r', 'from-cyan-400', 'to-blue-500', 'text-white', 'shadow-lg');

                    const filterLabel = this.innerText.toLowerCase();
                    let filter = 'all';
                    if (filterLabel.includes('hotel')) filter = 'hotel';
                    else if (filterLabel.includes('trekking')) filter = 'trekking';
                    else if (filterLabel.includes('travel')) filter = 'travel';
                    renderGrid(filter, document.querySelector('input').value);
                });
            });

            document.querySelector('input').addEventListener('input', function (e) {
                const activeFilterBtn = document.querySelector('button.bg-gradient-to-r');
                const filterLabel = activeFilterBtn ? activeFilterBtn.innerText.toLowerCase() : 'all';
                let filter = 'all';
                if (filterLabel.includes('hotel')) filter = 'hotel';
                else if (filterLabel.includes('trekking')) filter = 'trekking';
                else if (filterLabel.includes('travel')) filter = 'travel';
                renderGrid(filter, e.target.value);
            });
        }

        init();
    </script>

    </body>

    </html>