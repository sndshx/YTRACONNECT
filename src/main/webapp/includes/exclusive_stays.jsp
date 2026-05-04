<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- EXCLUSIVE STAYS SECTION -->
    <section class="py-20 md:py-32 bg-[#FAF9F8] relative overflow-hidden">
        <div class="max-w-[1600px] mx-auto px-4 md:px-20">
            <div class="mb-12 md:mb-16">
                <span class="text-accent font-bold tracking-[0.4em] uppercase text-[10px] mb-4 block">Handpicked
                    Accommodations</span>
                <h2 class="font-serif text-3xl md:text-5xl text-primary font-bold tracking-tight">Exclusive Stays</h2>
                <p class="text-gray-500 font-light mt-4 max-w-xl text-sm md:text-base">Find sanctuary in our curated
                    selection of luxury hotels and authentic local homestays across Nepal.</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-12 gap-6 lg:gap-8">
                <!-- Large Left Card (Hotels) -->
                <div
                    class="md:col-span-12 lg:col-span-7 bg-white rounded-[2rem] overflow-hidden group cursor-pointer relative min-h-[400px] shadow-lg border border-gray-100">
                    <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1470&auto=format&fit=crop"
                        class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-700"
                        alt="Luxury Hotel">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent"></div>

                    <div
                        class="absolute top-6 right-6 w-12 h-12 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center border border-white/30 text-white z-10 transition-transform group-hover:scale-110">
                        <span class="material-icons">arrow_outward</span>
                    </div>

                    <div class="absolute bottom-0 left-0 w-full p-8 md:p-12 z-20">
                        <h3 class="font-serif text-4xl md:text-5xl text-white font-bold mb-4 drop-shadow-lg">Hotels</h3>
                        <p class="text-white/90 text-sm md:text-base font-light max-w-md mb-8">Experience world-class
                            luxury combined with traditional Nepali hospitality in our premium hotel selections.</p>
                        <div class="flex items-center gap-4">
                            <span
                                class="bg-white text-primary px-6 py-3 rounded-full text-xs font-bold uppercase tracking-widest shadow-lg">Explore
                                All</span>
                            <span class="text-white text-xs tracking-widest font-bold uppercase">124+ Properties</span>
                        </div>
                    </div>
                </div>

                <!-- Right Column Grid -->
                <div class="md:col-span-12 lg:col-span-5 grid grid-cols-2 gap-4 lg:gap-6">

                    <!-- Small Card 1 -->
                    <div
                        class="col-span-1 bg-white rounded-3xl overflow-hidden group cursor-pointer shadow-md border border-gray-100 h-[220px] md:h-[250px] relative">
                        <img src="https://images.unsplash.com/photo-1578683010236-d716f9a3f461?q=80&w=1470&auto=format&fit=crop"
                            class="w-full h-[140px] object-cover group-hover:scale-110 transition-transform duration-700"
                            alt="Boutique">
                        <div
                            class="absolute top-3 left-3 bg-white/90 backdrop-blur-sm px-2 py-1 rounded flex items-center gap-1 z-10">
                            <span class="material-icons text-primary text-[10px]">verified</span>
                        </div>
                        <div
                            class="absolute top-3 right-3 w-8 h-8 bg-white/90 rounded-full flex items-center justify-center text-gray-400 z-10">
                            <span class="material-icons text-[16px]">favorite_border</span>
                        </div>
                        <div class="p-4 bg-white relative z-20">
                            <h4 class="font-serif font-bold text-gray-900 text-sm mb-1 truncate">Mountain View Boutique
                            </h4>
                            <div class="flex justify-between items-center mt-2">
                                <span class="text-[10px] text-gray-400">Kathmandu</span>
                                <span class="text-primary font-bold text-sm">$120<span
                                        class="text-[9px] text-gray-400 font-normal">/nt</span></span>
                            </div>
                        </div>
                    </div>

                    <!-- Small Card 2 -->
                    <div
                        class="col-span-1 bg-white rounded-3xl overflow-hidden group cursor-pointer shadow-md border border-gray-100 h-[220px] md:h-[250px] relative">
                        <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?q=80&w=1470&auto=format&fit=crop"
                            class="w-full h-[140px] object-cover group-hover:scale-110 transition-transform duration-700"
                            alt="Resort">
                        <div
                            class="absolute top-3 right-3 w-8 h-8 bg-white/90 rounded-full flex items-center justify-center text-gray-400 z-10">
                            <span class="material-icons text-[16px]">favorite_border</span>
                        </div>
                        <div class="p-4 bg-white relative z-20">
                            <h4 class="font-serif font-bold text-gray-900 text-sm mb-1 truncate">Royal Jungle Resort
                            </h4>
                            <div class="flex justify-between items-center mt-2">
                                <span class="text-[10px] text-gray-400">Chitwan</span>
                                <span class="text-primary font-bold text-sm">$250<span
                                        class="text-[9px] text-gray-400 font-normal">/nt</span></span>
                            </div>
                        </div>
                    </div>

                    <!-- Large Horizontal Card (Homestays) -->
                    <div
                        class="col-span-2 bg-gray-900 rounded-[2rem] overflow-hidden group cursor-pointer relative h-[250px] shadow-lg">
                        <img src="https://images.unsplash.com/photo-1518780664697-55e3ad937233?q=80&w=1530&auto=format&fit=crop"
                            class="absolute inset-0 w-full h-full object-cover opacity-60 group-hover:scale-105 transition-transform duration-700"
                            alt="Homestay">
                        <div class="absolute inset-0 bg-gradient-to-r from-black/80 to-transparent"></div>

                        <div
                            class="absolute top-4 right-4 w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center border border-white/30 text-white z-10">
                            <span class="material-icons text-[18px]">arrow_outward</span>
                        </div>

                        <div class="absolute top-0 left-0 w-full h-full p-6 md:p-8 flex flex-col justify-center z-20">
                            <h3 class="font-serif text-2xl md:text-3xl text-white font-bold mb-2">Homestays</h3>
                            <p class="text-white/80 text-xs md:text-sm font-light max-w-[200px] mb-4">Connect with
                                locals and experience authentic rural life.</p>
                            <span
                                class="text-accent text-[10px] tracking-widest font-bold uppercase flex items-center gap-1"><span
                                    class="material-icons text-[14px]">explore</span> Discover 50+ Homes</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>