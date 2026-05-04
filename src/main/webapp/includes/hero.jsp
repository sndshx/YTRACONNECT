<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HERO SECTION -->
<section class="relative w-full h-screen font-sans overflow-hidden">
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&auto=format&fit=crop&w=2600&q=80" alt="Mountain" class="w-full h-full object-cover">
        <div class="absolute inset-0 bg-blue-900/40 mix-blend-multiply"></div>
        <div class="absolute inset-0 bg-gradient-to-b from-transparent via-black/40 to-black/90"></div>
    </div>
    <div class="relative z-10 h-full flex flex-col items-center justify-center text-center px-4 pt-24 md:pt-32 pb-16 md:pb-32">
        <h1 class="text-white text-3xl md:text-6xl lg:text-7xl font-sans font-medium tracking-tight uppercase mb-12 drop-shadow-2xl opacity-95 w-full">
            Amazing Mountain<br><span class="font-bold block mt-2">To Explore</span>
        </h1>
        <div class="w-full max-w-xl relative mb-auto px-2">
            <form action="explore.jsp" method="get" class="bg-white/10 backdrop-blur-md border border-white/20 p-2 rounded-full flex items-center shadow-2xl transition-all hover:bg-white/15">
                <input type="text" name="q" placeholder="Search location..." class="flex-1 min-w-0 bg-transparent border-none text-white placeholder-gray-300 px-4 py-3 focus:outline-none text-base font-light tracking-wide">
                <button type="submit" class="bg-[#0F5146] hover:bg-[#0A3D34] text-white px-5 py-3 md:px-10 md:py-4 rounded-full font-bold uppercase tracking-widest text-[10px] md:text-xs transition-colors duration-300 shadow-lg whitespace-nowrap shrink-0">Explore Now</button>
            </form>
        </div>
    </div>
    <!-- Bottom Stats -->
    <div class="absolute bottom-0 left-0 w-full z-20 px-4 md:px-8 pb-8 md:pb-12">
        <div class="max-w-6xl mx-auto border-t border-white/15 pt-8">
            <div class="hidden md:flex flex-row justify-center items-center gap-16 text-white">
                <div class="flex items-center gap-4"><span class="text-5xl font-bold font-serif">12</span><div class="text-xs font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Years of<br>Experience</div></div>
                <div class="w-px h-10 bg-white/20"></div>
                <div class="flex items-center gap-4"><span class="text-5xl font-bold font-serif">2K</span><div class="text-xs font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Camping<br>Destination</div></div>
                <div class="w-px h-10 bg-white/20"></div>
                <div class="flex items-center gap-4"><span class="text-5xl font-bold font-serif">3K</span><div class="text-xs font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Happy<br>Customers</div></div>
                <div class="w-px h-10 bg-white/20"></div>
                <div class="flex items-center gap-4"><span class="text-5xl font-bold font-serif">4.8</span><div class="text-xs font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Overall<br>Rating</div></div>
            </div>
            <div class="grid grid-cols-2 gap-8 md:hidden text-white justify-items-center">
                <div class="flex items-center gap-3"><span class="text-4xl font-bold font-serif">12</span><div class="text-[10px] font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Years of<br>Experience</div></div>
                <div class="flex items-center gap-3"><span class="text-4xl font-bold font-serif">2K</span><div class="text-[10px] font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Camping<br>Destination</div></div>
                <div class="flex items-center gap-3"><span class="text-4xl font-bold font-serif">3K</span><div class="text-[10px] font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Happy<br>Customers</div></div>
                <div class="flex items-center gap-3"><span class="text-4xl font-bold font-serif">4.8</span><div class="text-[10px] font-light text-gray-300 leading-tight uppercase tracking-wider text-left">Overall<br>Rating</div></div>
            </div>
        </div>
    </div>
</section>
