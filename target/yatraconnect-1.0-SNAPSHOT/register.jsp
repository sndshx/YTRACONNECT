<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <jsp:include page="includes/header.jsp" />

    <!-- Transparent minimal navbar for Auth pages -->
    <div class="absolute top-0 w-full z-[110] px-4 py-8 flex justify-center">
        <nav class="flex items-center justify-between gap-4 w-full max-w-[1100px]">
            <a href="index.jsp" class="flex items-center gap-2 md:gap-3 shrink-0 group cursor-pointer no-underline">
                <div class="w-10 h-10 md:w-12 md:h-12 flex items-center justify-center overflow-hidden">
                    <img src="assets/images/logo.png" alt="YatraConnect Logo"
                        class="w-full h-full object-contain drop-shadow-md">
                </div>
                <div class="flex flex-col">
                    <span
                        class="text-[11px] md:text-sm font-serif font-black text-white tracking-[0.05em] uppercase leading-none drop-shadow-md">YatraConnect</span>
                    <span
                        class="text-[5px] md:text-[6px] text-white/90 font-bold tracking-[0.2em] uppercase mt-0.5 drop-shadow-md">Nepal
                        Elite Collection</span>
                </div>
            </a>
            <a href="index.jsp"
                class="text-white hover:text-white/80 transition-all font-bold tracking-widest uppercase text-[10px] bg-white/20 backdrop-blur-md px-6 py-2.5 rounded-full border border-white/30 shadow-lg hover:shadow-white/20 no-underline">
                Back to Home
            </a>
        </nav>
    </div>

    <section class="relative min-h-screen flex items-center justify-center overflow-hidden py-24 px-4 bg-bg-dark">
        <!-- Cinematic Background -->
        <div class="absolute inset-0 z-0">
            <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600&auto=format&fit=crop"
                class="w-full h-full object-cover opacity-50 scale-105" alt="Himalayas">
            <div class="absolute inset-0 bg-primary/60 mix-blend-multiply"></div>
            <div class="absolute inset-0 bg-gradient-to-t from-bg-dark via-transparent to-bg-dark/50"></div>
        </div>

        <!-- The Masterpiece: Rectilinear Identity Portal -->
        <div
            class="relative z-10 w-full sm:max-w-[1000px] bg-bg-light overflow-hidden shadow-[0_40px_100px_-20px_rgba(0,0,0,0.8)] flex flex-col sm:flex-row sm:h-[750px] max-h-[95vh] rounded-2xl fade-in-up border border-white/20">

            <!-- Left Wing: Brand Axis (Hidden on mobile) -->
            <div
                class="hidden sm:flex bg-primary w-[40%] h-full flex-col items-center justify-center shrink-0 border-r border-white/10 relative overflow-hidden">
                <!-- Subtle Breathing Aurora -->
                <div
                    class="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,#FAF3E0_0%,transparent_70%)] pointer-events-none filter blur-[80px] opacity-10 animate-pulse">
                </div>

                <img src="https://images.unsplash.com/photo-1542314831-c6a4d14d8373?q=80&w=800&auto=format&fit=crop"
                    class="absolute inset-0 w-full h-full object-cover opacity-20 mix-blend-overlay" alt="Texture">

                <div class="relative z-10 mb-8 w-40 h-40 flex items-center justify-center p-3">
                    <img src="assets/images/logo.png" alt="YatraConnect Logo"
                        class="w-full h-full object-contain drop-shadow-2xl">
                </div>

                <div class="relative z-10 space-y-3 text-center">
                    <h2
                        class="text-bg-light font-serif text-3xl font-black tracking-[0.15em] uppercase leading-none drop-shadow-sm">
                        Hamroyatra
                    </h2>
                    <div class="flex items-center justify-center gap-3 mt-2">
                        <div class="h-[1px] w-8 bg-accent/50"></div>
                        <span
                            class="text-accent text-[9px] font-bold tracking-[0.4em] uppercase opacity-90 drop-shadow-sm">
                            Private Collection
                        </span>
                        <div class="h-[1px] w-8 bg-accent/50"></div>
                    </div>
                </div>

                <div class="absolute bottom-8 left-0 right-0 text-center opacity-40">
                    <span class="text-bg-light text-[8px] font-bold uppercase tracking-[0.5em]">Secure Gateway</span>
                </div>
            </div>

            <!-- Right Wing: Interaction Panel -->
            <div class="flex-1 flex flex-col bg-bg-light overflow-hidden relative">

                <!-- Header -->
                <div class="px-8 sm:px-12 pt-10 sm:pt-12 flex flex-col shrink-0 text-center sm:text-left">
                    <h3 class="text-3xl text-primary font-serif font-bold tracking-tight leading-none mb-2">Create
                        Profile</h3>
                    <p class="text-[10px] text-gray-500 font-bold uppercase tracking-[0.2em]">Join the proprietary
                        network</p>
                </div>

                <!-- Content Area -->
                <div class="flex-1 overflow-y-auto px-8 sm:px-12 py-6 custom-scrollbar flex flex-col">

                    <!-- Role Switcher -->
                    <div class="flex items-center gap-6 shrink-0 border-b border-gray-200 pb-4 mb-6">
                        <span
                            class="text-[9px] font-black text-gray-400 uppercase tracking-widest hidden sm:block">Account
                            Type</span>
                        <div
                            class="flex bg-gray-200/50 p-1 rounded-xl border border-gray-100 w-full sm:w-auto shadow-inner">
                            <button type="button" onclick="switchRole('traveller')" id="btn-traveller"
                                class="flex-1 sm:flex-none px-6 py-2 rounded-lg text-[9px] font-black uppercase tracking-widest transition-all bg-white text-primary shadow-sm border border-gray-100">Traveller</button>
                            <button type="button" onclick="switchRole('agent')" id="btn-agent"
                                class="flex-1 sm:flex-none px-6 py-2 rounded-lg text-[9px] font-black uppercase tracking-widest transition-all text-gray-400 hover:text-gray-600 border border-transparent">Agency</button>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/auth/register" method="POST"
                        class="flex flex-col gap-4 w-full" id="registerForm">
                        <input type="hidden" name="role" id="roleInput" value="traveller">
                        <input type="hidden" name="redirect" value="<%= request.getParameter("redirect") != null ? request.getParameter("redirect") : "" %>">

                        <% String error=(String) request.getAttribute("errorMessage"); if (error !=null) { %>
                            <div
                                class="p-3 bg-red-50 border-l-4 border-red-500 rounded-r text-[10px] font-bold text-red-600 uppercase tracking-widest text-center shadow-sm">
                                <%= error %>
                            </div>
                            <% } %>

                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                    <div class="space-y-1">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Full
                                            Name</label>
                                        <input type="text" name="fullName" required
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                    <div class="space-y-1">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Email
                                            Address</label>
                                        <input type="email" name="email" required
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                </div>

                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                    <div class="space-y-1">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Password</label>
                                        <input type="password" name="password" required
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                    <div class="space-y-1">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Confirm
                                            Password</label>
                                        <input type="password" name="confirmPassword" required
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                </div>

                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                    <div class="space-y-1">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Contact
                                            Number</label>
                                        <input type="tel" name="phone" required
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                    <div class="space-y-1 hidden" id="field-companyName-container">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Agency
                                            Name</label>
                                        <input type="text" name="companyName" id="field-companyName"
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                </div>

                                <div class="grid grid-cols-1 gap-4 hidden" id="field-location-container">
                                    <div class="space-y-1">
                                        <label
                                            class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Business
                                            Location</label>
                                        <input type="text" name="location" id="field-location"
                                            class="w-full h-[46px] bg-white border border-gray-200 rounded-xl px-4 text-xs font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary outline-none shadow-sm">
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <button type="submit"
                                        class="w-full h-[52px] bg-primary hover:bg-primary-dark text-bg-light rounded-xl text-[11px] font-black uppercase tracking-[0.3em] transition-all shadow-lg hover:shadow-primary/40">
                                        Apply for Access
                                    </button>
                                </div>

                                <div class="mt-4 flex flex-col items-center gap-2 border-t border-gray-200 pt-6">
                                    <p
                                        class="text-[10px] text-gray-500 font-bold uppercase tracking-widest text-center">
                                        Already have an account? <a href="login.jsp?redirect=<%= request.getParameter("redirect") != null ? request.getParameter("redirect") : "" %>"
                                            class="text-primary hover:text-accent transition-colors underline ml-1">Sign
                                            In instead</a>
                                    </p>
                                </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script>
        function switchRole(role) {
            document.getElementById('roleInput').value = role;

            const btnTraveller = document.getElementById('btn-traveller');
            const btnAgent = document.getElementById('btn-agent');

            const companyContainer = document.getElementById('field-companyName-container');
            const companyField = document.getElementById('field-companyName');

            const locationContainer = document.getElementById('field-location-container');
            const locationField = document.getElementById('field-location');

            if (role === 'agent') {
                btnAgent.className = 'flex-1 sm:flex-none px-6 py-2 rounded-lg text-[9px] font-black uppercase tracking-widest transition-all bg-white text-primary shadow-sm border border-gray-100';
                btnTraveller.className = 'flex-1 sm:flex-none px-6 py-2 rounded-lg text-[9px] font-black uppercase tracking-widest transition-all text-gray-400 hover:text-gray-600 border border-transparent';

                companyContainer.classList.remove('hidden');
                companyField.required = true;
                locationContainer.classList.remove('hidden');
                locationField.required = true;
            } else {
                btnTraveller.className = 'flex-1 sm:flex-none px-6 py-2 rounded-lg text-[9px] font-black uppercase tracking-widest transition-all bg-white text-primary shadow-sm border border-gray-100';
                btnAgent.className = 'flex-1 sm:flex-none px-6 py-2 rounded-lg text-[9px] font-black uppercase tracking-widest transition-all text-gray-400 hover:text-gray-600 border border-transparent';

                companyContainer.classList.add('hidden');
                companyField.required = false;
                locationContainer.classList.add('hidden');
                locationField.required = false;
            }
        }
    </script>
    </body>

    </html>