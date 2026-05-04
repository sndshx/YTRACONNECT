<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HERITAGE GALLERY SECTION -->
<section class="py-20 md:py-32 bg-white overflow-hidden">
    <div class="text-center mb-12 md:mb-16">
        <span class="text-accent font-bold tracking-[0.4em] uppercase text-[10px] mb-4 block">Visual Journey</span>
        <h2 class="font-serif text-3xl md:text-5xl text-primary font-bold tracking-tight">Our Heritage Gallery</h2>
        <p class="text-gray-500 font-light mt-4 text-sm md:text-base max-w-xl mx-auto px-4">A glimpse into the stunning landscapes and rich culture waiting to be explored.</p>
    </div>

    <!-- Marquee Row 1 (Moving Left) -->
    <div class="relative w-[150vw] md:w-[120vw] flex overflow-hidden mb-4 md:mb-6 -ml-[25vw] md:-ml-[10vw]">
        <div class="flex items-center w-max animate-marquee-left gap-4 md:gap-6 pr-4 md:pr-6">
            <!-- Items duplicated for seamless loop -->
            <% for(int i=0; i<2; i++) { %>
            <div class="w-[200px] md:w-[350px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=1471&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Mountain">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Everest Base Camp</span>
                </div>
            </div>
            <div class="w-[300px] md:w-[450px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?q=80&w=1470&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Lake">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Phewa Lake</span>
                </div>
            </div>
            <div class="w-[250px] md:w-[380px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1501555088652-021faa106b9b?q=80&w=1473&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Canyon">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Mustang Valleys</span>
                </div>
            </div>
            <div class="w-[200px] md:w-[300px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1518780664697-55e3ad937233?q=80&w=1530&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Village">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Rural Homestays</span>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Marquee Row 2 (Moving Right) -->
    <div class="relative w-[150vw] md:w-[120vw] flex overflow-hidden -ml-[25vw] md:-ml-[10vw]">
        <div class="flex items-center w-max animate-marquee-right gap-4 md:gap-6 pr-4 md:pr-6">
            <!-- Items duplicated for seamless loop -->
            <% for(int i=0; i<2; i++) { %>
            <div class="w-[280px] md:w-[400px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1540339832862-474599807371?q=80&w=1470&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Heli">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Himalayan Flights</span>
                </div>
            </div>
            <div class="w-[220px] md:w-[320px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1540541338287-41700207dee6?q=80&w=1470&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Rhino">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Chitwan Safari</span>
                </div>
            </div>
            <div class="w-[300px] md:w-[420px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1488085061387-422e29b40080?q=80&w=1471&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Monastery">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Ancient Temples</span>
                </div>
            </div>
            <div class="w-[200px] md:w-[300px] h-[150px] md:h-[220px] rounded-2xl md:rounded-[2rem] overflow-hidden relative group shrink-0">
                <img src="https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?q=80&w=1632&auto=format&fit=crop" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" alt="Elephant">
                <div class="absolute inset-0 bg-black/20 group-hover:bg-black/0 transition-colors duration-500"></div>
                <div class="absolute bottom-4 left-4 md:bottom-6 md:left-6 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <span class="text-white font-serif text-lg md:text-xl font-bold drop-shadow-md">Wildlife Encounters</span>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
