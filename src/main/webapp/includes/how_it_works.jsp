<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- HOW IT WORKS SECTION -->
    <style>
        .hiw-step-line::after {
            content: '';
            position: absolute;
            top: 28px;
            left: calc(50% + 28px);
            width: calc(100% - 56px);
            height: 2px;
            background: linear-gradient(90deg, #C5A059 0%, rgba(197, 160, 89, 0.1) 100%);
        }

        .hiw-step-line:last-child::after {
            display: none;
        }

        .hiw-icon-wrap {
            background: linear-gradient(135deg, #0D3B66 0%, #145591 100%);
            box-shadow: 0 12px 40px rgba(13, 59, 102, 0.35);
            transition: transform 0.35s cubic-bezier(0.23, 1, 0.32, 1), box-shadow 0.35s ease;
        }

        .hiw-step:hover .hiw-icon-wrap {
            transform: translateY(-6px) scale(1.08);
            box-shadow: 0 24px 60px rgba(13, 59, 102, 0.45);
        }

        .hiw-step {
            transition: all 0.3s ease;
        }

        .hiw-step:hover .hiw-step-num {
            color: #C5A059;
        }

        .hiw-banner {
            background: linear-gradient(135deg, #0D3B66 0%, #07203B 60%, #0F1E17 100%);
        }

        @keyframes hiw-pulse {

            0%,
            100% {
                transform: scale(1)
            }

            50% {
                transform: scale(1.06)
            }
        }

        .hiw-cta-btn {
            animation: hiw-pulse 3s ease-in-out infinite;
        }
    </style>

    <section class="py-24 md:py-32 bg-white relative overflow-hidden">
        <div
            class="absolute right-0 top-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-accent/4 rounded-full blur-[120px] pointer-events-none">
        </div>

        <div class="max-w-[1400px] mx-auto px-4 md:px-16 relative z-10">

            <!-- Header -->
            <div class="text-center mb-16 md:mb-20">
                <div class="flex items-center justify-center gap-3 mb-4">
                    <div class="h-px w-10 bg-accent"></div>
                    <span class="text-accent font-black tracking-[0.35em] uppercase text-[10px]">Simple &amp;
                        Seamless</span>
                    <div class="h-px w-10 bg-accent"></div>
                </div>
                <h2
                    class="font-serif text-3xl md:text-5xl lg:text-6xl text-primary font-bold tracking-tight leading-tight mb-4">
                    How It Works
                </h2>
                <p class="text-gray-500 font-light text-sm md:text-base max-w-xl mx-auto leading-relaxed">
                    Planning your dream Nepal trip is effortless with YatraConnect — three simple steps to adventure.
                </p>
            </div>

            <!-- Steps -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-10 md:gap-6 mb-20 md:mb-28">

                <div class="hiw-step relative text-center md:text-left group hiw-step-line">
                    <div class="flex flex-col md:flex-row items-center md:items-start gap-6 md:gap-0">
                        <div class="flex flex-col items-center md:items-start gap-6">
                            <div class="relative">
                                <div
                                    class="hiw-icon-wrap w-14 h-14 rounded-2xl flex items-center justify-center text-white shrink-0">
                                    <span class="material-icons text-2xl">search</span>
                                </div>
                            </div>
                            <div class="md:pr-10">
                                <div
                                    class="hiw-step-num text-[11px] font-black text-gray-300 tracking-[0.3em] uppercase mb-2 transition-colors duration-300">
                                    Step 01</div>
                                <h3 class="font-serif text-xl md:text-2xl font-bold text-gray-900 mb-3">Discover &amp;
                                    Filter</h3>
                                <p class="text-gray-500 text-sm font-light leading-relaxed">
                                    Browse 2,000+ verified destinations, treks, hotels, and experiences. Filter by
                                    region, budget, duration, or activity type.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="hiw-step relative text-center md:text-left group hiw-step-line">
                    <div class="flex flex-col md:flex-row items-center md:items-start gap-6 md:gap-0">
                        <div class="flex flex-col items-center md:items-start gap-6">
                            <div class="relative">
                                <div
                                    class="hiw-icon-wrap w-14 h-14 rounded-2xl flex items-center justify-center text-white shrink-0">
                                    <span class="material-icons text-2xl">connect_without_contact</span>
                                </div>
                            </div>
                            <div class="md:pr-10">
                                <div
                                    class="hiw-step-num text-[11px] font-black text-gray-300 tracking-[0.3em] uppercase mb-2 transition-colors duration-300">
                                    Step 02</div>
                                <h3 class="font-serif text-xl md:text-2xl font-bold text-gray-900 mb-3">Connect with
                                    Agencies</h3>
                                <p class="text-gray-500 text-sm font-light leading-relaxed">
                                    Chat directly with 200+ verified local agencies. Get custom quotes, ask questions,
                                    and compare offerings — all in one place.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="hiw-step relative text-center md:text-left group">
                    <div class="flex flex-col md:flex-row items-center md:items-start gap-6 md:gap-0">
                        <div class="flex flex-col items-center md:items-start gap-6">
                            <div class="relative">
                                <div class="hiw-icon-wrap w-14 h-14 rounded-2xl flex items-center justify-center text-white shrink-0"
                                    style="background:linear-gradient(135deg,#C5A059,#b8900a); box-shadow:0 12px 40px rgba(197,160,89,0.4)">
                                    <span class="material-icons text-2xl">luggage</span>
                                </div>
                            </div>
                            <div>
                                <div
                                    class="hiw-step-num text-[11px] font-black text-gray-300 tracking-[0.3em] uppercase mb-2 transition-colors duration-300">
                                    Step 03</div>
                                <h3 class="font-serif text-xl md:text-2xl font-bold text-gray-900 mb-3">Book &amp; Go!
                                </h3>
                                <p class="text-gray-500 text-sm font-light leading-relaxed">
                                    Secure your trip with a verified booking. Get a digital itinerary, 24/7 support, and
                                    real-time updates during your journey.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CTA Banner -->
            <div
                class="hiw-banner rounded-[2rem] md:rounded-[2.5rem] p-10 md:p-16 flex flex-col md:flex-row items-center gap-10 md:gap-16 overflow-hidden relative">
                <!-- Background decoration -->
                <div class="absolute -right-20 -bottom-20 w-64 h-64 border border-white/5 rounded-full"></div>
                <div class="absolute right-16 top-6 w-32 h-32 border border-white/5 rounded-full"></div>

                <!-- Left content -->
                <div class="flex-1 text-center md:text-left relative z-10">
                    <div
                        class="inline-block bg-accent/20 border border-accent/30 text-accent text-[10px] font-black tracking-[0.3em] uppercase px-4 py-2 rounded-full mb-6">
                        🏔️ Start Your Nepal Adventure
                    </div>
                    <h3 class="font-serif text-3xl md:text-4xl lg:text-5xl text-white font-bold leading-tight mb-4">
                        Ready to Explore<br>Nepal's Wonders?
                    </h3>
                    <p class="text-white/65 text-sm md:text-base font-light leading-relaxed max-w-lg">
                        Join 3,000+ travelers who discovered Nepal through YatraConnect. From solo treks to family
                        adventures — we've got every journey covered.
                    </p>
                </div>

                <!-- Right CTAs -->
                <div class="flex flex-col gap-4 shrink-0 relative z-10 items-center md:items-start">
                    <a href="explore.jsp"
                        class="hiw-cta-btn inline-flex items-center gap-3 bg-accent hover:bg-[#b8900a] text-white px-10 py-4 rounded-2xl font-black text-sm uppercase tracking-widest transition-all duration-300 shadow-2xl shadow-accent/40 no-underline group">
                        <span class="material-icons">explore</span>
                        Explore Now
                        <span class="material-icons transition-transform group-hover:translate-x-1">arrow_forward</span>
                    </a>
                    <a href="register.jsp"
                        class="inline-flex items-center gap-2 text-white/70 text-sm font-light hover:text-white transition-colors no-underline">
                        <span class="material-icons text-[16px]">person_add</span>
                        Create Free Account — Takes 30 Seconds
                    </a>
                </div>
            </div>

        </div>
    </section>