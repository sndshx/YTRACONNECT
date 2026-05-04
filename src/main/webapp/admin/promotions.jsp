<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="relative min-h-screen flex items-center justify-center overflow-hidden pt-20">
    <!-- Cinematic Background -->
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-90 scale-105" alt="Himalayas">
        <div class="absolute inset-0 bg-[#0F281E]/80 mix-blend-multiply"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-[#131f19] via-transparent to-[#131f19]/80"></div>
    </div>

    <!-- Animated Glow -->
    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-[#C5A059]/20 rounded-full blur-[120px] pointer-events-none animate-pulse"></div>

    <div class="relative z-10 max-w-4xl w-full px-4 md:px-8 fade-in-up">
        <div class="glass-panel border border-white/20 rounded-[2.5rem] p-8 md:p-16 text-center shadow-[0_30px_60px_-15px_rgba(0,0,0,0.5)] backdrop-blur-xl relative overflow-hidden">
            <!-- Decorative Elements -->
            <div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-transparent via-[#C5A059] to-transparent"></div>
            <div class="absolute -top-10 -right-10 w-40 h-40 bg-[#C5A059]/10 rounded-full blur-2xl"></div>
            
            <div class="inline-flex items-center justify-center w-20 h-20 rounded-full border border-[#C5A059]/30 bg-white/5 mb-8 text-[#C5A059] shadow-[0_0_30px_rgba(197,160,89,0.2)]">
                <span class="material-icons text-4xl animate-[spin_10s_linear_infinite]">settings_suggest</span>
            </div>
            
            <span class="text-[#C5A059] font-bold tracking-[0.4em] uppercase text-[10px] mb-4 block">Development in Progress</span>
            <h1 class="font-serif text-3xl md:text-5xl lg:text-6xl text-white font-bold mb-6 tracking-tight drop-shadow-md">ADMIN PROMOTIONS</h1>
            
            <div class="max-w-2xl mx-auto mb-12">
                <p class="text-white/70 font-light text-sm md:text-base leading-relaxed">
                    We are meticulously crafting this section of the YatraConnect Elite Platform. Our team is blending cutting-edge technology with seamless design to ensure an unparalleled user experience.
                </p>
            </div>
            
            <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a href="../index.jsp" class="w-full sm:w-auto relative group overflow-hidden bg-white text-[#0F281E] px-8 py-4 rounded-full transition-all duration-300 shadow-xl hover:shadow-white/25 no-underline">
                    <span class="relative z-10 text-[10px] font-black tracking-widest uppercase flex items-center justify-center gap-2">
                        <span class="material-icons text-sm">west</span>
                        Return to Home
                    </span>
                    <div class="absolute top-0 -left-[100%] w-full h-full bg-gradient-to-r from-transparent via-[#C5A059]/20 to-transparent transition-all duration-1000 group-hover:left-[100%] pointer-events-none"></div>
                </a>
            </div>
            
            <div class="mt-12 pt-8 border-t border-white/10 flex justify-center gap-8 text-[#C5A059] opacity-60">
                <span class="material-icons text-lg">flight_takeoff</span>
                <span class="material-icons text-lg">landscape</span>
                <span class="material-icons text-lg">hotel</span>
            </div>
        </div>
    </div>
</section>

</body>
</html>
