<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- TRENDING EXPERIENCES SECTION -->
<section class="py-20 md:py-32 bg-white relative overflow-hidden">
    <div class="max-w-[1600px] mx-auto px-4 md:px-20 relative z-10">
        <div class="mb-12 md:mb-16 flex flex-col md:flex-row justify-between items-end gap-6 md:gap-0">
            <div>
                <span class="text-accent font-bold tracking-[0.4em] uppercase text-[10px] mb-4 block">Handpicked Journeys</span>
                <h2 class="font-serif text-3xl md:text-5xl text-primary font-bold tracking-tight">Trending Experiences</h2>
                <p class="text-gray-500 font-light mt-4 max-w-xl text-sm md:text-base">Immerse yourself in our highly sought-after experiences, designed to challenge the ordinary and inspire your spirit.</p>
            </div>
            <div class="flex gap-4">
                <button class="w-12 h-12 rounded-full border border-gray-200 flex items-center justify-center hover:bg-primary hover:text-white hover:border-primary transition-all duration-300 text-gray-400 group">
                    <span class="material-icons transition-transform group-hover:-translate-x-1">arrow_back</span>
                </button>
                <button class="w-12 h-12 rounded-full border border-gray-200 flex items-center justify-center hover:bg-primary hover:text-white hover:border-primary transition-all duration-300 text-gray-400 group">
                    <span class="material-icons transition-transform group-hover:translate-x-1">arrow_forward</span>
                </button>
            </div>
        </div>

        <!-- Carousel -->
        <div class="flex gap-4 md:gap-8 overflow-x-auto pb-12 pt-4 no-scrollbar scroll-smooth snap-x">
            
            <!-- Experience Card 1 -->
            <div class="min-w-[280px] w-[280px] md:min-w-[380px] md:w-[380px] bg-white rounded-3xl border border-gray-100 overflow-hidden group hover:shadow-[0_20px_50px_-15px_rgba(0,0,0,0.1)] transition-all duration-500 snap-center shrink-0">
                <div class="relative h-[250px] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=1471&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Everest Base Camp">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center border border-white/30 cursor-pointer hover:bg-white hover:text-red-500 transition-colors text-white z-10">
                        <span class="material-icons text-sm">favorite_border</span>
                    </div>
                    <div class="absolute bottom-4 left-4 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-lg flex items-center gap-1">
                        <span class="material-icons text-yellow-500 text-[14px]">star</span>
                        <span class="text-xs font-bold text-gray-900">4.9</span>
                    </div>
                </div>
                <div class="p-6">
                    <div class="flex items-center justify-between mb-3">
                        <span class="text-[10px] font-bold text-accent tracking-widest uppercase">Trekking • 14 Days</span>
                        <span class="text-[10px] text-gray-400 flex items-center gap-1"><span class="material-icons text-[12px]">group</span> Small Group</span>
                    </div>
                    <h3 class="font-serif text-xl font-bold text-gray-900 mb-2 group-hover:text-primary transition-colors">Everest Base Camp</h3>
                    <p class="text-gray-500 text-xs font-light leading-relaxed mb-6 line-clamp-2">The ultimate trekking adventure to the foot of the world's highest peak.</p>
                    <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                        <div><span class="text-xs text-gray-400 block mb-0.5">From</span><span class="text-lg font-bold text-gray-900">$1,499</span></div>
                        <a href="#" class="bg-gray-900 text-white px-6 py-3 rounded-xl text-[10px] font-bold uppercase tracking-widest hover:bg-primary transition-colors no-underline">Book Now</a>
                    </div>
                </div>
            </div>

            <!-- Experience Card 2 -->
            <div class="min-w-[280px] w-[280px] md:min-w-[380px] md:w-[380px] bg-white rounded-3xl border border-gray-100 overflow-hidden group hover:shadow-[0_20px_50px_-15px_rgba(0,0,0,0.1)] transition-all duration-500 snap-center shrink-0">
                <div class="relative h-[250px] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?q=80&w=1470&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Yoga Retreat">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center border border-white/30 cursor-pointer hover:bg-white hover:text-red-500 transition-colors text-white z-10">
                        <span class="material-icons text-sm">favorite_border</span>
                    </div>
                    <div class="absolute bottom-4 left-4 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-lg flex items-center gap-1">
                        <span class="material-icons text-yellow-500 text-[14px]">star</span>
                        <span class="text-xs font-bold text-gray-900">4.8</span>
                    </div>
                </div>
                <div class="p-6">
                    <div class="flex items-center justify-between mb-3">
                        <span class="text-[10px] font-bold text-accent tracking-widest uppercase">Wellness • 7 Days</span>
                        <span class="text-[10px] text-gray-400 flex items-center gap-1"><span class="material-icons text-[12px]">group</span> Intimate</span>
                    </div>
                    <h3 class="font-serif text-xl font-bold text-gray-900 mb-2 group-hover:text-primary transition-colors">Himalayan Yoga Retreat</h3>
                    <p class="text-gray-500 text-xs font-light leading-relaxed mb-6 line-clamp-2">Rejuvenate your mind and body with sunrise yoga facing the Annapurnas.</p>
                    <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                        <div><span class="text-xs text-gray-400 block mb-0.5">From</span><span class="text-lg font-bold text-gray-900">$899</span></div>
                        <a href="#" class="bg-gray-900 text-white px-6 py-3 rounded-xl text-[10px] font-bold uppercase tracking-widest hover:bg-primary transition-colors no-underline">Book Now</a>
                    </div>
                </div>
            </div>

            <!-- Experience Card 3 -->
            <div class="min-w-[280px] w-[280px] md:min-w-[380px] md:w-[380px] bg-white rounded-3xl border border-gray-100 overflow-hidden group hover:shadow-[0_20px_50px_-15px_rgba(0,0,0,0.1)] transition-all duration-500 snap-center shrink-0">
                <div class="relative h-[250px] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?q=80&w=1632&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Safari">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center border border-white/30 cursor-pointer hover:bg-white hover:text-red-500 transition-colors text-white z-10">
                        <span class="material-icons text-sm">favorite_border</span>
                    </div>
                    <div class="absolute bottom-4 left-4 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-lg flex items-center gap-1">
                        <span class="material-icons text-yellow-500 text-[14px]">star</span>
                        <span class="text-xs font-bold text-gray-900">4.7</span>
                    </div>
                </div>
                <div class="p-6">
                    <div class="flex items-center justify-between mb-3">
                        <span class="text-[10px] font-bold text-accent tracking-widest uppercase">Wildlife • 4 Days</span>
                        <span class="text-[10px] text-gray-400 flex items-center gap-1"><span class="material-icons text-[12px]">group</span> Private</span>
                    </div>
                    <h3 class="font-serif text-xl font-bold text-gray-900 mb-2 group-hover:text-primary transition-colors">Chitwan Wildlife Safari</h3>
                    <p class="text-gray-500 text-xs font-light leading-relaxed mb-6 line-clamp-2">Encounter rhinos and tigers in their natural habitat deep in the jungle.</p>
                    <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                        <div><span class="text-xs text-gray-400 block mb-0.5">From</span><span class="text-lg font-bold text-gray-900">$599</span></div>
                        <a href="#" class="bg-gray-900 text-white px-6 py-3 rounded-xl text-[10px] font-bold uppercase tracking-widest hover:bg-primary transition-colors no-underline">Book Now</a>
                    </div>
                </div>
            </div>

            <!-- Experience Card 4 -->
            <div class="min-w-[280px] w-[280px] md:min-w-[380px] md:w-[380px] bg-white rounded-3xl border border-gray-100 overflow-hidden group hover:shadow-[0_20px_50px_-15px_rgba(0,0,0,0.1)] transition-all duration-500 snap-center shrink-0">
                <div class="relative h-[250px] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1540339832862-474599807371?q=80&w=1470&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Helicopter Tour">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center border border-white/30 cursor-pointer hover:bg-white hover:text-red-500 transition-colors text-white z-10">
                        <span class="material-icons text-sm">favorite_border</span>
                    </div>
                    <div class="absolute bottom-4 left-4 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-lg flex items-center gap-1">
                        <span class="material-icons text-yellow-500 text-[14px]">star</span>
                        <span class="text-xs font-bold text-gray-900">5.0</span>
                    </div>
                </div>
                <div class="p-6">
                    <div class="flex items-center justify-between mb-3">
                        <span class="text-[10px] font-bold text-accent tracking-widest uppercase">Luxury • 1 Day</span>
                        <span class="text-[10px] text-gray-400 flex items-center gap-1"><span class="material-icons text-[12px]">group</span> Private</span>
                    </div>
                    <h3 class="font-serif text-xl font-bold text-gray-900 mb-2 group-hover:text-primary transition-colors">Luxury Heli Tour</h3>
                    <p class="text-gray-500 text-xs font-light leading-relaxed mb-6 line-clamp-2">A luxurious private helicopter flight showcasing the majestic Everest.</p>
                    <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                        <div><span class="text-xs text-gray-400 block mb-0.5">From</span><span class="text-lg font-bold text-gray-900">$2,499</span></div>
                        <a href="#" class="bg-gray-900 text-white px-6 py-3 rounded-xl text-[10px] font-bold uppercase tracking-widest hover:bg-primary transition-colors no-underline">Book Now</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
