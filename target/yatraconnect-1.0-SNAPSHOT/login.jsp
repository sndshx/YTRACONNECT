<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp" />

<!-- Transparent minimal navbar for Auth pages -->
<div class="absolute top-0 w-full z-[110] px-4 py-8 flex justify-center">
    <nav class="flex items-center justify-between gap-4 w-full max-w-[1100px]">
        <a href="index.jsp" class="flex items-center gap-2 md:gap-3 shrink-0 group cursor-pointer no-underline">
            <div class="w-10 h-10 md:w-12 md:h-12 flex items-center justify-center overflow-hidden">
                <img src="assets/images/logo.png" alt="YatraConnect Logo" class="w-full h-full object-contain drop-shadow-md">
            </div>
            <div class="flex flex-col">
                <span class="text-[11px] md:text-sm font-serif font-black text-white tracking-[0.05em] uppercase leading-none drop-shadow-md">YatraConnect</span>
                <span class="text-[5px] md:text-[6px] text-white/90 font-bold tracking-[0.2em] uppercase mt-0.5 drop-shadow-md">Nepal Elite Collection</span>
            </div>
        </a>
        <a href="index.jsp" class="text-white hover:text-white/80 transition-all font-bold tracking-widest uppercase text-[10px] bg-white/20 backdrop-blur-md px-6 py-2.5 rounded-full border border-white/30 shadow-lg hover:shadow-white/20 no-underline">
            Back to Home
        </a>
    </nav>
</div>

<section class="relative min-h-screen flex items-center justify-center overflow-hidden py-24 px-4 bg-bg-dark">
    <!-- Cinematic Background -->
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-50 scale-105" alt="Himalayas">
        <div class="absolute inset-0 bg-primary/60 mix-blend-multiply"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-bg-dark via-transparent to-bg-dark/50"></div>
    </div>

    <!-- The Masterpiece: Rectilinear Identity Portal -->
    <div class="relative z-10 w-full sm:max-w-[900px] bg-bg-light overflow-hidden shadow-[0_40px_100px_-20px_rgba(0,0,0,0.8)] flex flex-col sm:flex-row sm:h-[600px] max-h-[95vh] rounded-2xl fade-in-up border border-white/20">

        <!-- Left Wing: Brand Axis (Hidden on mobile) -->
        <div class="hidden sm:flex bg-primary w-[45%] h-full flex-col items-center justify-center shrink-0 border-r border-white/10 relative overflow-hidden">
            <!-- Subtle Breathing Aurora -->
            <div class="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,#FAF3E0_0%,transparent_70%)] pointer-events-none filter blur-[80px] opacity-10 animate-pulse"></div>
            
            <img src="https://images.unsplash.com/photo-1581793745862-99fde7fa73d2?q=80&w=800&auto=format&fit=crop" class="absolute inset-0 w-full h-full object-cover opacity-20 mix-blend-overlay" alt="Texture">

            <div class="relative z-10 mb-8 w-40 h-40 flex items-center justify-center p-3">
                <img src="assets/images/logo.png" alt="YatraConnect Logo" class="w-full h-full object-contain drop-shadow-2xl">
            </div>

            <div class="relative z-10 space-y-3 text-center">
                <h2 class="text-bg-light font-serif text-3xl font-black tracking-[0.15em] uppercase leading-none drop-shadow-sm">
                    YatraConnect
                </h2>
                <div class="flex items-center justify-center gap-3 mt-2">
                    <div class="h-[1px] w-8 bg-accent/50"></div>
                    <span class="text-accent text-[9px] font-bold tracking-[0.4em] uppercase opacity-90 drop-shadow-sm">
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
            <div class="px-8 sm:px-12 pt-10 sm:pt-14 flex flex-col shrink-0 text-center sm:text-left">
                <h3 class="text-3xl text-primary font-serif font-bold tracking-tight leading-none mb-2">Welcome Back</h3>
                <p class="text-[10px] text-gray-500 font-bold uppercase tracking-[0.2em]">Enter your credentials</p>
            </div>

            <!-- Content Area -->
            <div class="flex-1 overflow-y-auto px-8 sm:px-12 py-8 flex flex-col justify-center">
                <form action="${pageContext.request.contextPath}/auth/login" method="POST" class="flex flex-col gap-5 w-full max-w-[380px] mx-auto sm:mx-0">
                    <input type="hidden" name="redirect" value="<%= request.getParameter("redirect") != null ? request.getParameter("redirect") : "" %>">
                    
                    <% String error = (String) request.getAttribute("errorMessage");
                       if (error != null) { %>
                    <div class="p-3 bg-red-50 border-l-4 border-red-500 rounded-r text-[10px] font-bold text-red-600 uppercase tracking-widest text-center mb-2 shadow-sm"><%= error %></div>
                    <% } %>
                    <% String success = (String) request.getAttribute("successMessage");
                       if (success != null) { %>
                    <div class="p-3 bg-green-50 border-l-4 border-primary rounded-r text-[10px] font-bold text-primary uppercase tracking-widest text-center mb-2 shadow-sm"><%= success %></div>
                    <% } %>

                    <div class="space-y-1">
                        <label class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Email Address</label>
                        <div class="relative">
                            <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-sm">mail_outline</span>
                            <input type="email" name="email" required
                                class="w-full h-[50px] bg-white border border-gray-200 rounded-xl pl-10 pr-4 text-sm font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary shadow-sm outline-none">
                        </div>
                    </div>

                    <div class="space-y-1">
                        <label class="text-[9px] font-bold text-gray-500 uppercase tracking-[0.2em] ml-1">Password</label>
                        <div class="relative">
                            <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-sm">lock_outline</span>
                            <input type="password" name="password" required
                                class="w-full h-[50px] bg-white border border-gray-200 rounded-xl pl-10 pr-4 text-sm font-bold focus:ring-0 focus:border-primary transition-all placeholder:text-gray-300 text-primary shadow-sm outline-none">
                        </div>
                    </div>

                    <div class="flex items-center justify-between mt-1 mb-2">
                        <label class="flex items-center gap-2 cursor-pointer group">
                            <input type="checkbox" class="w-4 h-4 rounded border-gray-300 text-primary focus:ring-primary shadow-sm">
                            <span class="text-[10px] font-bold tracking-widest uppercase text-gray-500 group-hover:text-primary transition-colors">Remember me</span>
                        </label>
                        <a href="#" class="text-[10px] font-bold tracking-widest uppercase text-gray-400 hover:text-primary transition-colors no-underline">Forgot Password?</a>
                    </div>

                    <button type="submit"
                        class="w-full h-[50px] bg-primary hover:bg-primary-dark text-bg-light rounded-xl text-[11px] font-black uppercase tracking-[0.3em] transition-all shadow-lg hover:shadow-primary/40 mt-2">
                        Sign In
                    </button>

                    <div class="mt-6 flex justify-center border-t border-gray-200 pt-6">
                        <p class="text-[10px] text-gray-500 font-bold uppercase tracking-widest">
                            New here? <a href="register.jsp?redirect=<%= request.getParameter("redirect") != null ? request.getParameter("redirect") : "" %>" class="text-primary hover:text-accent transition-colors underline ml-1">Create an account</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

</body>
</html>