<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- TESTIMONIALS SECTION -->
<section class="py-20 md:py-32 bg-[#FAF9F8] relative overflow-hidden">
    <!-- Decorative background elements -->
    <div class="absolute top-0 right-0 w-[500px] h-[500px] bg-accent/5 rounded-full blur-[100px] pointer-events-none"></div>
    <div class="absolute bottom-0 left-0 w-[400px] h-[400px] bg-primary/5 rounded-full blur-[80px] pointer-events-none"></div>

    <div class="max-w-[1400px] mx-auto px-4 md:px-12 relative z-10">
        <div class="text-center mb-16 md:mb-24">
            <span class="text-accent font-bold tracking-[0.4em] uppercase text-[10px] mb-4 block">Traveler Stories</span>
            <h2 class="font-serif text-3xl md:text-5xl lg:text-6xl text-primary font-bold tracking-tight">Voices of Our Community</h2>
            <p class="text-gray-500 font-light mt-6 max-w-2xl mx-auto text-sm md:text-base">Discover how our curated journeys have transformed the way people experience the profound beauty of Nepal.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-12 gap-6 lg:gap-8 items-center">
            
            <!-- Left Card - Rating Summary -->
            <div class="md:col-span-4 flex justify-center md:justify-end mb-8 md:mb-0">
                <div class="bg-[#1A2B23] text-white rounded-[2.5rem] p-8 md:p-10 w-[280px] md:w-[320px] shadow-2xl relative transform md:-rotate-3 hover:rotate-0 transition-transform duration-500">
                    <div class="absolute -top-6 -right-6 w-20 h-20 bg-accent rounded-full flex items-center justify-center animate-[spin_10s_linear_infinite]">
                        <svg viewBox="0 0 100 100" class="w-16 h-16 text-[#1A2B23]">
                            <path id="curve" d="M 50,50 m -30,0 a 30,30 0 1,1 60,0 a 30,30 0 1,1 -60,0" fill="transparent" />
                            <text class="text-[14px] font-bold tracking-widest uppercase">
                                <textPath href="#curve">Elite Collection • Rated 4.9/5 • </textPath>
                            </text>
                        </svg>
                        <span class="material-icons absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-[#1A2B23] text-xl">star</span>
                    </div>
                    <div class="flex gap-1 mb-6">
                        <span class="material-icons text-accent">star</span><span class="material-icons text-accent">star</span><span class="material-icons text-accent">star</span><span class="material-icons text-accent">star</span><span class="material-icons text-accent">star</span>
                    </div>
                    <h3 class="font-serif text-4xl mb-2">4.9<span class="text-xl text-white/50 font-sans">/5</span></h3>
                    <p class="text-xs font-light text-white/70 uppercase tracking-widest mb-8">Average Rating</p>
                    <p class="text-sm font-light leading-relaxed text-white/90">"YatraConnect redefined luxury travel in the Himalayas. Flawless execution from arrival to departure."</p>
                </div>
            </div>

            <!-- Right Area - Scrollable Testimonial Cards -->
            <div class="md:col-span-8 flex gap-6 overflow-x-auto pb-8 pt-4 px-4 -mx-4 md:mx-0 no-scrollbar snap-x">
                
                <!-- Card 1 -->
                <div class="min-w-[300px] md:min-w-[400px] bg-white p-8 md:p-10 rounded-[2.5rem] shadow-[0_20px_50px_-15px_rgba(0,0,0,0.05)] border border-gray-100 snap-center">
                    <span class="material-icons text-gray-200 text-5xl mb-4 block">format_quote</span>
                    <p class="text-gray-600 text-sm md:text-base font-light leading-relaxed mb-8">The private helicopter tour to Everest was simply breathtaking. The attention to detail and the quality of the boutique lodges selected by YatraConnect made it a trip of a lifetime.</p>
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full bg-gray-200 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1470&auto=format&fit=crop" class="w-full h-full object-cover" alt="Sarah J.">
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-900 text-sm">Sarah Jenkins</h4>
                            <span class="text-[10px] text-gray-400 uppercase tracking-widest">London, UK</span>
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="min-w-[300px] md:min-w-[400px] bg-white p-8 md:p-10 rounded-[2.5rem] shadow-[0_20px_50px_-15px_rgba(0,0,0,0.05)] border border-gray-100 snap-center">
                    <span class="material-icons text-gray-200 text-5xl mb-4 block">format_quote</span>
                    <p class="text-gray-600 text-sm md:text-base font-light leading-relaxed mb-8">Our wellness retreat in Pokhara was the perfect reset. YatraConnect found us a secluded luxury property that perfectly balanced authentic culture with modern amenities.</p>
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full bg-gray-200 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1374&auto=format&fit=crop" class="w-full h-full object-cover" alt="Michael C.">
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-900 text-sm">Michael Chang</h4>
                            <span class="text-[10px] text-gray-400 uppercase tracking-widest">Singapore</span>
                        </div>
                    </div>
                </div>

                 <!-- Card 3 -->
                 <div class="min-w-[300px] md:min-w-[400px] bg-white p-8 md:p-10 rounded-[2.5rem] shadow-[0_20px_50px_-15px_rgba(0,0,0,0.05)] border border-gray-100 snap-center">
                    <span class="material-icons text-gray-200 text-5xl mb-4 block">format_quote</span>
                    <p class="text-gray-600 text-sm md:text-base font-light leading-relaxed mb-8">The local guides provided for our Chitwan safari were incredibly knowledgeable. The entire experience felt exclusive, sustainable, and deeply respectful of the environment.</p>
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full bg-gray-200 overflow-hidden">
                            <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1528&auto=format&fit=crop" class="w-full h-full object-cover" alt="Elena V.">
                        </div>
                        <div>
                            <h4 class="font-bold text-gray-900 text-sm">Elena Vargas</h4>
                            <span class="text-[10px] text-gray-400 uppercase tracking-widest">Madrid, Spain</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>