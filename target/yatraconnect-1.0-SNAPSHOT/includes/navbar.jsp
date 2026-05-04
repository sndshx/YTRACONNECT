<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean isLoggedIn = session.getAttribute("user") != null;
%>
<script>
    window.isLoggedIn = <%= isLoggedIn %>;
</script>
    <!-- Navbar -->
    <div class="fixed w-full z-[110] px-4 transition-all duration-500 flex justify-center py-8" id="mainNav">
        <nav
            class="pointer-events-auto flex items-center justify-between gap-4 md:gap-8 px-4 md:px-8 py-1 md:py-1.5 rounded-full bg-primary/40 backdrop-blur-xl border border-white/10 shadow-[0_15px_35px_rgba(0,0,0,0.15)] transition-all duration-500 w-full max-w-[1100px]">
            <!-- Logo -->
            <a href="<%= request.getContextPath() %>/index.jsp" class="flex items-center gap-2 md:gap-3 shrink-0 group cursor-pointer no-underline">
                <div class="w-10 h-10 md:w-12 md:h-12 flex items-center justify-center overflow-hidden">
                    <img src="<%= request.getContextPath() %>/assets/images/logo.png" alt="YatraConnect Logo"
                        class="w-full h-full object-contain drop-shadow-md">
                </div>
                <div class="flex flex-col">
                    <span
                        class="text-[11px] md:text-sm font-serif font-black text-white tracking-[0.05em] uppercase leading-none drop-shadow-sm">YatraConnect</span>
                    <span
                        class="text-[5px] md:text-[6px] text-white/80 font-bold tracking-[0.2em] uppercase mt-0.5">Nepal
                        Elite Collection</span>
                </div>
            </a>

            <!-- Desktop Navigation -->
            <div class="hidden lg:flex items-center gap-1 text-white">
                <div class="relative group">
                    <a href="<%= request.getContextPath() %>/explore.jsp"
                        class="flex items-center gap-1.5 px-4 py-2 rounded-full transition-all duration-300 text-[10px] font-bold tracking-[0.15em] uppercase whitespace-nowrap text-white hover:text-white/80 no-underline">
                        Explore <span class="material-icons text-[14px]">expand_more</span>
                    </a>
                    <div
                        class="absolute top-full left-1/2 -translate-x-1/2 pt-5 opacity-0 translate-y-3 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-500 ease-out">
                        <div
                            class="bg-white/95 border border-white/20 rounded-2xl p-1 shadow-[0_30px_60px_-15px_rgba(0,0,0,0.2)]">
                            <div class="flex flex-row items-center gap-0.5">
                                <a href="<%= request.getContextPath() %>/destinations.jsp"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">public</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Destinations</span><span
                                            class="text-[8px] text-gray-400 font-medium">Explore the world</span>
                                    </div>
                                </a>
                                <a href="<%= request.getContextPath() %>/explore.jsp?type=trekking"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">landscape</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Trekking</span><span
                                            class="text-[8px] text-gray-400 font-medium">Conquer the Himalayas</span>
                                    </div>
                                </a>
                                <a href="<%= request.getContextPath() %>/explore.jsp?type=travel"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">explore</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Travel</span><span
                                            class="text-[8px] text-gray-400 font-medium">Curated adventures</span></div>
                                </a>
                                <a href="<%= request.getContextPath() %>/explore.jsp?type=hotel"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">hotel</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Hotels</span><span
                                            class="text-[8px] text-gray-400 font-medium">Luxury & Boutique stays</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="relative group">
                    <a href="#"
                        class="flex items-center gap-1.5 px-4 py-2 rounded-full transition-all duration-300 text-[10px] font-bold tracking-[0.15em] uppercase whitespace-nowrap text-white hover:text-white/80 no-underline">
                        Verified Partners <span class="material-icons text-[14px]">expand_more</span>
                    </a>
                    <div
                        class="absolute top-full left-1/2 -translate-x-1/2 pt-5 opacity-0 translate-y-3 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-500 ease-out">
                        <div
                            class="bg-white/95 border border-white/20 rounded-2xl p-1 shadow-[0_30px_60px_-15px_rgba(0,0,0,0.2)]">
                            <div class="flex flex-row items-center gap-0.5">
                                <a href="<%= request.getContextPath() %>/trekking-agencies.jsp"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">hiking</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Trekking
                                            Agencies</span><span class="text-[8px] text-gray-400 font-medium">Expert
                                            mountain guides</span></div>
                                </a>
                                <a href="<%= request.getContextPath() %>/travel-agencies.jsp"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">domain</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Travel
                                            Agencies</span><span class="text-[8px] text-gray-400 font-medium">Expert
                                            local guides</span></div>
                                </a>
                                <a href="<%= request.getContextPath() %>/verified-hotels.jsp"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">verified_user</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Verified
                                            Hotels</span><span class="text-[8px] text-gray-400 font-medium">Quality
                                            assured stays</span></div>
                                </a>
                                <a href="<%= request.getContextPath() %>/verification-process.jsp"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">assignment_turned_in</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Verification
                                            Process</span><span class="text-[8px] text-gray-400 font-medium">Join our
                                            elite network</span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="relative group">
                    <button
                        class="flex items-center gap-1.5 px-4 py-2 rounded-full transition-all duration-300 text-[10px] font-bold tracking-[0.15em] uppercase whitespace-nowrap text-white hover:text-white/80">
                        About <span class="material-icons text-[14px]">expand_more</span>
                    </button>
                    <div
                        class="absolute top-full left-1/2 -translate-x-1/2 pt-5 opacity-0 translate-y-3 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-500 ease-out">
                        <div
                            class="bg-white/95 border border-white/20 rounded-2xl p-1 shadow-[0_30px_60px_-15px_rgba(0,0,0,0.2)]">
                            <div class="flex flex-row items-center gap-0.5">
                                <a href="<%= request.getContextPath() %>/contact.jsp"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">mail</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Contact
                                            Us</span><span class="text-[8px] text-gray-400 font-medium">Get in
                                            touch</span></div>
                                </a>
                                <a href="#"
                                    class="group/item flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-gray-50 transition-all duration-200 min-w-max no-underline">
                                    <div
                                        class="w-8 h-8 rounded-lg bg-gray-50 border border-gray-100 flex items-center justify-center group-hover/item:bg-primary group-hover/item:border-primary transition-all">
                                        <span
                                            class="material-icons text-gray-400 group-hover/item:text-white text-base">gpp_good</span>
                                    </div>
                                    <div class="flex flex-col text-left pr-2"><span
                                            class="text-[10px] font-bold text-gray-800 tracking-wider uppercase leading-none mb-0.5">Safety
                                            & Trust</span><span class="text-[8px] text-gray-400 font-medium">Your
                                            security first</span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Actions -->
            <div class="flex items-center gap-2 md:gap-5 shrink-0">
                <%@ page import="com.yatraconnect.model.HamroTraveller, com.yatraconnect.model.HamroAgent" %>
                <% 
                    Object sessionUser = session.getAttribute("user");
                    String userRole = (String) session.getAttribute("role");
                    String dashboardUrl = "login.jsp";
                    String displayName = "Login";
                    
                    if (sessionUser != null) {
                        if ("admin".equals(userRole)) {
                            dashboardUrl = "admin/dashboard";
                            displayName = ((com.yatraconnect.model.Admin)sessionUser).getFullName().split(" ")[0];
                        } else if ("agent".equals(userRole)) {
                            dashboardUrl = "agency/dashboard";
                            displayName = ((HamroAgent)sessionUser).getFullName().split(" ")[0];
                        } else {
                            dashboardUrl = "traveller/dashboard";
                            displayName = ((HamroTraveller)sessionUser).getFullName().split(" ")[0];
                        }
                    }
                %>
                
                <% if (sessionUser == null) { %>
                <a href="<%= request.getContextPath() %>/login.jsp"
                    class="hidden sm:flex items-center gap-2 text-white hover:text-white/80 transition-all group/login no-underline">
                    <div
                        class="w-7 h-7 md:w-8 md:h-8 rounded-full border border-white/20 flex items-center justify-center group-hover/login:border-white group-hover/login:bg-white/10 transition-all duration-300">
                        <span class="material-icons text-base md:text-lg">person_outline</span>
                    </div>
                    <span class="text-[9px] md:text-[10px] font-bold tracking-[0.15em] uppercase">Login</span>
                </a>
                <% } else { %>
                <div class="relative group/profile">
                    <a href="<%= request.getContextPath() %>/<%= dashboardUrl %>"
                        class="hidden sm:flex items-center gap-2 text-white hover:text-white/80 transition-all no-underline">
                        <div class="w-7 h-7 md:w-8 md:h-8 rounded-full bg-[#C5A059] flex items-center justify-center text-primary border border-white/20 shadow-lg">
                            <span class="material-icons text-base md:text-lg">person</span>
                        </div>
                        <span class="text-[9px] md:text-[10px] font-black tracking-[0.15em] uppercase"><%= displayName %></span>
                    </a>
                    <div class="absolute top-full right-0 pt-4 opacity-0 translate-y-2 pointer-events-none group-hover/profile:opacity-100 group-hover/profile:translate-y-0 group-hover/profile:pointer-events-auto transition-all duration-300">
                        <div class="bg-white rounded-2xl p-2 shadow-2xl border border-gray-100 min-w-[150px]">
                             <a href="<%= request.getContextPath() %>/<%= dashboardUrl %>" class="flex items-center gap-3 px-4 py-2 rounded-xl hover:bg-gray-50 text-[10px] font-bold text-gray-700 uppercase tracking-widest no-underline transition-all">
                                <span class="material-icons text-sm">dashboard</span> Dashboard
                            </a>
                            <% if ("traveller".equals(userRole)) { %>
                            <a href="<%= request.getContextPath() %>/traveller/wishlist.jsp" class="flex items-center gap-3 px-4 py-2 rounded-xl hover:bg-gray-50 text-[10px] font-bold text-gray-700 uppercase tracking-widest no-underline transition-all">
                                <span class="material-icons text-sm text-red-500">favorite</span> Wishlist
                            </a>
                            <% } %>
                            <a href="<%= request.getContextPath() %>/auth/logout" class="flex items-center gap-3 px-4 py-2 rounded-xl hover:bg-red-50 text-[10px] font-bold text-red-500 uppercase tracking-widest no-underline transition-all">
                                <span class="material-icons text-sm">logout</span> Sign Out
                            </a>
                        </div>
                    </div>
                </div>
                <% } %>
                <a href="<%= request.getContextPath() %>/explore.jsp"
                    class="relative group overflow-hidden bg-primary text-white px-4 md:px-7 py-2 md:py-2.5 rounded-full transition-all duration-300 shadow-lg hover:shadow-primary/25 border border-primary/20 no-underline">
                    <span
                        class="relative z-10 text-[9px] md:text-[10px] font-black tracking-[0.2em] uppercase flex items-center gap-1.5 md:gap-2">
                        <span class="hidden sm:inline">Plan My Trip</span>
                        <span class="sm:hidden">Plan</span>
                        <span
                            class="material-icons text-xs md:text-[16px] group-hover:translate-x-1 transition-transform">arrow_forward</span>
                    </span>
                    <div
                        class="absolute top-0 -left-[100%] w-full h-full bg-gradient-to-r from-transparent via-white/10 to-transparent transition-all duration-1000 group-hover:left-[100%] pointer-events-none">
                    </div>
                </a>
                <!-- Mobile Menu Toggle -->
                <button onclick="document.getElementById('mobileMenu').classList.toggle('translate-x-full')"
                    class="lg:hidden w-8 h-8 md:w-9 md:h-9 rounded-full border border-white/20 flex items-center justify-center text-white hover:bg-white/10 transition-all">
                    <span class="material-icons text-xl md:text-2xl">menu</span>
                </button>
            </div>
        </nav>
    </div>

    <!-- Mobile Menu Drawer -->
    <div id="mobileMenu"
        class="fixed top-0 right-0 h-full w-[280px] bg-white z-[200] shadow-2xl flex flex-col transform translate-x-full transition-transform duration-300">
        <div class="flex items-center justify-between px-6 py-6 border-b border-gray-50">
            <span class="text-xs font-serif font-black text-gray-900 tracking-[0.1em] uppercase">YatraConnect</span>
            <button onclick="document.getElementById('mobileMenu').classList.add('translate-x-full')"
                class="w-8 h-8 rounded-full border border-gray-100 flex items-center justify-center text-gray-400">
                <span class="material-icons text-xl">close</span>
            </button>
        </div>
        <div class="flex-1 overflow-y-auto px-4 py-4">
            <a href="<%= request.getContextPath() %>/destinations.jsp"
                class="flex items-center justify-between px-4 py-4 rounded-2xl hover:bg-gray-50 text-[11px] font-black tracking-widest uppercase text-gray-400 no-underline">Destinations</a>
            <a href="explore.jsp"
                class="flex items-center justify-between px-4 py-4 rounded-2xl hover:bg-gray-50 text-[11px] font-black tracking-widest uppercase text-gray-400 no-underline">Explore</a>
            <a href="partners.jsp"
                class="flex items-center justify-between px-4 py-4 rounded-2xl hover:bg-gray-50 text-[11px] font-black tracking-widest uppercase text-gray-400 no-underline">Verified
                Partners</a>
            <a href="contact.jsp"
                class="flex items-center justify-between px-4 py-4 rounded-2xl hover:bg-gray-50 text-[11px] font-black tracking-widest uppercase text-gray-400 no-underline">Contact
                Us</a>
        </div>
        <div class="p-6 border-t border-gray-50">
            <a href="login.jsp"
                class="block w-full py-4 rounded-2xl bg-primary text-white font-black text-[10px] uppercase tracking-widest shadow-lg text-center no-underline">Sign
                In / Register</a>
        </div>
    </div>

    <script>
        window.addEventListener('scroll', () => {
            const nav = document.getElementById('mainNav');
            if (window.scrollY > 20) { nav.classList.replace('py-8', 'py-4'); }
            else { nav.classList.replace('py-4', 'py-8'); }
        });
    </script>