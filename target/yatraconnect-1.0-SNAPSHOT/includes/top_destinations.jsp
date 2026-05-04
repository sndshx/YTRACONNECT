<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- TOP DESTINATIONS SECTION -->
    <section class="bg-primary pt-20 md:pt-32 pb-0 relative overflow-visible">
        <div class="max-w-7xl mx-auto px-0 md:px-8">
            <div class="text-center mb-12 md:mb-16 relative z-10">
                <span class="text-accent font-bold tracking-[0.4em] uppercase text-[10px] mb-4 block">Regional
                    Gems</span>
                <h2 class="font-serif text-4xl md:text-5xl lg:text-6xl text-white font-bold tracking-tight">Top
                    Destinations</h2>
            </div>

            <!-- Premium Map Section -->
            <div class="relative w-full h-[400px] md:h-[500px] lg:h-[650px] mb-12 md:mb-20 group/map flex items-center justify-center perspective-[1000px]">
                
                <!-- Background Map Image (3D floating effect) -->
                <img src="<%= request.getContextPath() %>/assets/images/Nepallogo.png"
                    class="absolute inset-0 w-full h-full object-contain transition-transform duration-[15s] group-hover/map:scale-105 ease-out drop-shadow-[0_40px_30px_rgba(0,0,0,0.8)] filter contrast-125 brightness-110"
                    alt="Map of Nepal">

                <!-- Enhanced Interactive Pins (3D Style) -->

                <!-- Khaptad NP -->
                <div class="absolute z-30" style="left: 28%; top: 35%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Khaptad NP</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 25px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Bardia NP -->
                <div class="absolute z-30" style="left: 32%; top: 52%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Bardia NP</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 35px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Lumbini -->
                <div class="absolute z-30" style="left: 45%; top: 62%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Lumbini</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 35px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Mustang -->
                <div class="absolute z-30" style="left: 50%; top: 32%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Mustang</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 85px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Pokhara -->
                <div class="absolute z-30" style="left: 52%; top: 48%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Pokhara</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 45px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Chitwan -->
                <div class="absolute z-30" style="left: 56%; top: 60%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Chitwan</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 35px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Everest -->
                <div class="absolute z-30" style="left: 68%; top: 40%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Everest</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 45px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Pathibhara Temple -->
                <div class="absolute z-30" style="left: 74%; top: 42%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Pathibhara Temple</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 45px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>

                <!-- Ilam -->
                <div class="absolute z-30" style="left: 75%; top: 54%;">
                    <div class="relative -translate-x-1/2 -translate-y-full flex flex-col items-center cursor-pointer group">
                        <span class="text-[#C5A059] text-[8px] md:text-[10px] font-bold tracking-widest uppercase whitespace-nowrap mb-1 opacity-90 group-hover:text-white transition-all drop-shadow-md">Ilam</span>
                        <div class="relative flex items-center justify-center">
                            <div class="absolute w-8 h-8 bg-[#C5A059]/40 rounded-full blur-md group-hover:bg-[#C5A059]/60 transition-all duration-300"></div>
                            <div class="w-3 h-3 bg-[#C5A059] rounded-full shadow-[0_0_15px_rgba(197,160,89,1)] group-hover:scale-125 transition-transform duration-300"></div>
                        </div>
                        <div class="w-[1px] bg-gradient-to-b from-[#C5A059]/80 to-transparent" style="height: 35px;"></div>
                        <div class="w-1.5 h-1.5 bg-[#C5A059]/60 rounded-full mt-[-1px]"></div>
                    </div>
                </div>
            </div>

            <!-- Hover Cards Section -->
            <div class="relative z-20 grid grid-cols-2 gap-0 md:flex w-full h-auto md:h-[500px] overflow-hidden md:rounded-t-[3rem] shadow-[0_-10px_40px_rgba(0,0,0,0.3)]">
                <!-- Everest -->
                <div class="relative group cursor-pointer overflow-hidden transition-all duration-[800ms] ease-[cubic-bezier(0.25,1,0.5,1)] md:flex-1 hover:md:flex-[3] h-[300px] sm:h-[350px] md:h-full">
                    <img src="https://images.unsplash.com/photo-1544735749-2e78311e09f1?q=80&w=1470&auto=format&fit=crop"
                        class="absolute inset-0 w-full h-full object-cover transition-transform duration-[10s] ease-out group-hover:scale-110"
                        alt="Everest">
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/10 to-black/90 transition-opacity duration-500 group-hover:opacity-80"></div>

                    <!-- Expanded Content -->
                    <div class="absolute inset-0 p-6 md:p-10 flex flex-col justify-end opacity-100 md:opacity-0 md:translate-y-10 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-[600ms] ease-out z-20 bg-gradient-to-t from-[#0F281E]/90 via-[#0F281E]/40 to-transparent">
                        <div class="transform md:translate-y-4 group-hover:translate-y-0 transition-all duration-500 delay-100">
                            <div class="flex items-center gap-3 mb-4">
                                <span class="w-10 h-[2px] bg-[#C5A059]"></span>
                                <span class="text-[#C5A059] text-[10px] md:text-xs font-black uppercase tracking-widest">Majestic</span>
                            </div>
                            <h3 class="font-serif text-3xl md:text-5xl lg:text-6xl text-white font-bold tracking-tight mb-4 drop-shadow-lg">EVEREST</h3>
                            <p class="text-gray-300 text-xs md:text-sm font-light leading-relaxed mb-8 max-w-sm">The ultimate pilgrimage for trekkers, reimagined with luxury lodges and breathtaking panoramas.</p>
                            <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking"
                                class="inline-flex items-center gap-3 bg-[#C5A059] text-[#0F281E] px-6 py-3 rounded-full text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all duration-300 shadow-[0_10px_20px_rgba(197,160,89,0.3)]">
                                Explore Region <span class="material-icons text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>

                    <!-- Vertical text -->
                    <div class="absolute bottom-10 left-10 md:-rotate-90 origin-left transition-all duration-500 group-hover:opacity-0 group-hover:-translate-x-4 z-10 hidden md:flex items-center gap-4 w-[300px]">
                        <span class="w-8 h-[2px] bg-[#C5A059]"></span>
                        <h3 class="font-serif text-3xl text-white font-bold tracking-widest whitespace-nowrap drop-shadow-md m-0">EVEREST</h3>
                        <p class="text-[#C5A059] text-[9px] font-bold uppercase tracking-widest m-0 ml-auto">Majestic</p>
                    </div>
                </div>

                <!-- Pokhara -->
                <div class="relative group cursor-pointer overflow-hidden transition-all duration-[800ms] ease-[cubic-bezier(0.25,1,0.5,1)] md:flex-1 hover:md:flex-[3] h-[300px] sm:h-[350px] md:h-full md:border-l border-white/10">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=1470&auto=format&fit=crop"
                        class="absolute inset-0 w-full h-full object-cover transition-transform duration-[10s] ease-out group-hover:scale-110"
                        alt="Pokhara">
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/10 to-black/90 transition-opacity duration-500 group-hover:opacity-80"></div>

                    <!-- Expanded Content -->
                    <div class="absolute inset-0 p-6 md:p-10 flex flex-col justify-end opacity-100 md:opacity-0 md:translate-y-10 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-[600ms] ease-out z-20 bg-gradient-to-t from-[#0F281E]/90 via-[#0F281E]/40 to-transparent">
                        <div class="transform md:translate-y-4 group-hover:translate-y-0 transition-all duration-500 delay-100">
                            <div class="flex items-center gap-3 mb-4">
                                <span class="w-10 h-[2px] bg-[#C5A059]"></span>
                                <span class="text-[#C5A059] text-[10px] md:text-xs font-black uppercase tracking-widest">Lakes & Treks</span>
                            </div>
                            <h3 class="font-serif text-3xl md:text-5xl lg:text-6xl text-white font-bold tracking-tight mb-4 drop-shadow-lg">POKHARA</h3>
                            <p class="text-gray-300 text-xs md:text-sm font-light leading-relaxed mb-8 max-w-sm">The valley of lakes, where the majestic Annapurna range mirrors in calm, pristine waters.</p>
                            <a href="<%= request.getContextPath() %>/explore.jsp"
                                class="inline-flex items-center gap-3 bg-[#C5A059] text-[#0F281E] px-6 py-3 rounded-full text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all duration-300 shadow-[0_10px_20px_rgba(197,160,89,0.3)]">
                                Explore Region <span class="material-icons text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>

                    <!-- Vertical text -->
                    <div class="absolute bottom-10 left-10 md:-rotate-90 origin-left transition-all duration-500 group-hover:opacity-0 group-hover:-translate-x-4 z-10 hidden md:flex items-center gap-4 w-[300px]">
                        <span class="w-8 h-[2px] bg-[#C5A059]"></span>
                        <h3 class="font-serif text-3xl text-white font-bold tracking-widest whitespace-nowrap drop-shadow-md m-0">POKHARA</h3>
                        <p class="text-[#C5A059] text-[9px] font-bold uppercase tracking-widest m-0 ml-auto">Lakes & Treks</p>
                    </div>
                </div>

                <!-- Chitwan -->
                <div class="relative group cursor-pointer overflow-hidden transition-all duration-[800ms] ease-[cubic-bezier(0.25,1,0.5,1)] md:flex-1 hover:md:flex-[3] h-[300px] sm:h-[350px] md:h-full md:border-l border-white/10">
                    <img src="https://images.unsplash.com/photo-1540541338287-41700207dee6?q=80&w=1470&auto=format&fit=crop"
                        class="absolute inset-0 w-full h-full object-cover transition-transform duration-[10s] ease-out group-hover:scale-110"
                        alt="Chitwan">
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/10 to-black/90 transition-opacity duration-500 group-hover:opacity-80"></div>

                    <!-- Expanded Content -->
                    <div class="absolute inset-0 p-6 md:p-10 flex flex-col justify-end opacity-100 md:opacity-0 md:translate-y-10 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-[600ms] ease-out z-20 bg-gradient-to-t from-[#0F281E]/90 via-[#0F281E]/40 to-transparent">
                        <div class="transform md:translate-y-4 group-hover:translate-y-0 transition-all duration-500 delay-100">
                            <div class="flex items-center gap-3 mb-4">
                                <span class="w-10 h-[2px] bg-[#C5A059]"></span>
                                <span class="text-[#C5A059] text-[10px] md:text-xs font-black uppercase tracking-widest">Wilderness</span>
                            </div>
                            <h3 class="font-serif text-3xl md:text-5xl lg:text-6xl text-white font-bold tracking-tight mb-4 drop-shadow-lg">CHITWAN</h3>
                            <p class="text-gray-300 text-xs md:text-sm font-light leading-relaxed mb-8 max-w-sm">Perched on the banks of Rapti river, offering an unparalleled blend of wild safaris and luxury.</p>
                            <a href="<%= request.getContextPath() %>/explore.jsp"
                                class="inline-flex items-center gap-3 bg-[#C5A059] text-[#0F281E] px-6 py-3 rounded-full text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all duration-300 shadow-[0_10px_20px_rgba(197,160,89,0.3)]">
                                Explore Region <span class="material-icons text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>

                    <!-- Vertical text -->
                    <div class="absolute bottom-10 left-10 md:-rotate-90 origin-left transition-all duration-500 group-hover:opacity-0 group-hover:-translate-x-4 z-10 hidden md:flex items-center gap-4 w-[300px]">
                        <span class="w-8 h-[2px] bg-[#C5A059]"></span>
                        <h3 class="font-serif text-3xl text-white font-bold tracking-widest whitespace-nowrap drop-shadow-md m-0">CHITWAN</h3>
                        <p class="text-[#C5A059] text-[9px] font-bold uppercase tracking-widest m-0 ml-auto">Wilderness</p>
                    </div>
                </div>

                <!-- Mustang -->
                <div class="relative group cursor-pointer overflow-hidden transition-all duration-[800ms] ease-[cubic-bezier(0.25,1,0.5,1)] md:flex-1 hover:md:flex-[3] h-[300px] sm:h-[350px] md:h-full md:border-l border-white/10">
                    <img src="https://images.unsplash.com/photo-1627814441551-9f9392e276b6?q=80&w=1470&auto=format&fit=crop"
                        class="absolute inset-0 w-full h-full object-cover transition-transform duration-[10s] ease-out group-hover:scale-110"
                        alt="Mustang">
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/10 to-black/90 transition-opacity duration-500 group-hover:opacity-80"></div>

                    <!-- Expanded Content -->
                    <div class="absolute inset-0 p-6 md:p-10 flex flex-col justify-end opacity-100 md:opacity-0 md:translate-y-10 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-[600ms] ease-out z-20 bg-gradient-to-t from-[#0F281E]/90 via-[#0F281E]/40 to-transparent">
                        <div class="transform md:translate-y-4 group-hover:translate-y-0 transition-all duration-500 delay-100">
                            <div class="flex items-center gap-3 mb-4">
                                <span class="w-10 h-[2px] bg-[#C5A059]"></span>
                                <span class="text-[#C5A059] text-[10px] md:text-xs font-black uppercase tracking-widest">Mystical</span>
                            </div>
                            <h3 class="font-serif text-3xl md:text-5xl lg:text-6xl text-white font-bold tracking-tight mb-4 drop-shadow-lg">MUSTANG</h3>
                            <p class="text-gray-300 text-xs md:text-sm font-light leading-relaxed mb-8 max-w-sm">A mystical journey into the forbidden kingdom, revealing ancient caves and arid beauty.</p>
                            <a href="<%= request.getContextPath() %>/explore.jsp"
                                class="inline-flex items-center gap-3 bg-[#C5A059] text-[#0F281E] px-6 py-3 rounded-full text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all duration-300 shadow-[0_10px_20px_rgba(197,160,89,0.3)]">
                                Explore Region <span class="material-icons text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>

                    <!-- Vertical text -->
                    <div class="absolute bottom-10 left-10 md:-rotate-90 origin-left transition-all duration-500 group-hover:opacity-0 group-hover:-translate-x-4 z-10 hidden md:flex items-center gap-4 w-[300px]">
                        <span class="w-8 h-[2px] bg-[#C5A059]"></span>
                        <h3 class="font-serif text-3xl text-white font-bold tracking-widest whitespace-nowrap drop-shadow-md m-0">MUSTANG</h3>
                        <p class="text-[#C5A059] text-[9px] font-bold uppercase tracking-widest m-0 ml-auto">Mystical</p>
                    </div>
                </div>

                <!-- Lumbini -->
                <div class="relative group cursor-pointer overflow-hidden transition-all duration-[800ms] ease-[cubic-bezier(0.25,1,0.5,1)] col-span-2 md:col-span-1 md:flex-1 hover:md:flex-[3] h-[300px] sm:h-[350px] md:h-full md:border-l border-white/10">
                    <img src="https://images.unsplash.com/photo-1488085061387-422e29b40080?q=80&w=1471&auto=format&fit=crop"
                        class="absolute inset-0 w-full h-full object-cover transition-transform duration-[10s] ease-out group-hover:scale-110"
                        alt="Lumbini">
                    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-black/10 to-black/90 transition-opacity duration-500 group-hover:opacity-80"></div>

                    <!-- Expanded Content -->
                    <div class="absolute inset-0 p-6 md:p-10 flex flex-col justify-end opacity-100 md:opacity-0 md:translate-y-10 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-[600ms] ease-out z-20 bg-gradient-to-t from-[#0F281E]/90 via-[#0F281E]/40 to-transparent">
                        <div class="transform md:translate-y-4 group-hover:translate-y-0 transition-all duration-500 delay-100">
                            <div class="flex items-center gap-3 mb-4">
                                <span class="w-10 h-[2px] bg-[#C5A059]"></span>
                                <span class="text-[#C5A059] text-[10px] md:text-xs font-black uppercase tracking-widest">Peaceful</span>
                            </div>
                            <h3 class="font-serif text-3xl md:text-5xl lg:text-6xl text-white font-bold tracking-tight mb-4 drop-shadow-lg">LUMBINI</h3>
                            <p class="text-gray-300 text-xs md:text-sm font-light leading-relaxed mb-8 max-w-sm">Birthplace of Lord Buddha, a peaceful pilgrimage destination offering deep spiritual awakening.</p>
                            <a href="<%= request.getContextPath() %>/explore.jsp"
                                class="inline-flex items-center gap-3 bg-[#C5A059] text-[#0F281E] px-6 py-3 rounded-full text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all duration-300 shadow-[0_10px_20px_rgba(197,160,89,0.3)]">
                                Explore Region <span class="material-icons text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>

                    <!-- Vertical text -->
                    <div class="absolute bottom-10 left-10 md:-rotate-90 origin-left transition-all duration-500 group-hover:opacity-0 group-hover:-translate-x-4 z-10 hidden md:flex items-center gap-4 w-[300px]">
                        <span class="w-8 h-[2px] bg-[#C5A059]"></span>
                        <h3 class="font-serif text-3xl text-white font-bold tracking-widest whitespace-nowrap drop-shadow-md m-0">LUMBINI</h3>
                        <p class="text-[#C5A059] text-[9px] font-bold uppercase tracking-widest m-0 ml-auto">Peaceful</p>
                    </div>
                </div>
            </div>
        </div>
    </section>