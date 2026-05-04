<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../includes/header.jsp" />

<div class="absolute top-0 w-full z-[110] px-4 py-8 flex justify-center">
    <nav class="flex items-center justify-between gap-4 w-full max-w-[1100px]">
        <a href="${pageContext.request.contextPath}/index.jsp" class="flex items-center gap-2 md:gap-3 shrink-0 group cursor-pointer no-underline">
            <div class="w-10 h-10 md:w-12 md:h-12 flex items-center justify-center overflow-hidden">
                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="YatraConnect Logo" class="w-full h-full object-contain drop-shadow-md">
            </div>
            <div class="flex flex-col">
                <span class="text-[11px] md:text-sm font-serif font-black text-white tracking-[0.05em] uppercase leading-none drop-shadow-md">YatraConnect</span>
                <span class="text-[5px] md:text-[6px] text-white/90 font-bold tracking-[0.2em] uppercase mt-0.5 drop-shadow-md">Agency Portal</span>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="text-white hover:text-white/80 transition-all font-bold tracking-widest uppercase text-[10px] bg-white/20 backdrop-blur-md px-6 py-2.5 rounded-full border border-white/30 shadow-lg no-underline">
            Back to Home
        </a>
    </nav>
</div>

<section class="relative min-h-screen flex items-center justify-center overflow-hidden py-24 px-4 bg-bg-dark">
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-40 scale-105" alt="Mountains">
        <div class="absolute inset-0 bg-primary/60 mix-blend-multiply"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-bg-dark via-transparent to-bg-dark/50"></div>
    </div>

    <div class="relative z-10 w-full sm:max-w-[480px] fade-in-up">
        <div class="text-center mb-8">
            <h1 class="text-3xl md:text-4xl font-serif font-bold text-white mb-2">Agency <span class="italic text-accent">Login</span></h1>
            <p class="text-white/50 text-sm">Access your partner dashboard</p>
        </div>

        <div class="bg-white/[0.05] backdrop-blur-xl border border-white/10 rounded-[2.5rem] p-8 md:p-10 shadow-2xl">
            <% String error = (String) request.getAttribute("errorMessage");
               String statusType = (String) request.getAttribute("statusType");
               if (error != null) { %>
                <div class="p-4 mb-6 rounded-2xl border text-xs font-bold uppercase tracking-widest text-center
                    <%= "pending".equals(statusType) ? "bg-yellow-500/10 border-yellow-500/20 text-yellow-400" :
                        "rejected".equals(statusType) ? "bg-red-500/10 border-red-500/20 text-red-400" :
                        "bg-red-500/10 border-red-500/20 text-red-400" %>">
                    <% if ("pending".equals(statusType)) { %>
                        <span class="material-icons text-lg block mb-2">hourglass_top</span>
                    <% } else if ("rejected".equals(statusType)) { %>
                        <span class="material-icons text-lg block mb-2">block</span>
                    <% } %>
                    <%= error %>
                </div>
            <% } %>

            <% String success = (String) request.getAttribute("successMessage");
               if (success != null) { %>
                <div class="p-4 mb-6 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xs font-bold uppercase tracking-widest text-center">
                    <span class="material-icons text-lg block mb-2">check_circle</span>
                    <%= success %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/agency/login" method="POST" class="space-y-5">
                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Email Address</label>
                    <div class="relative">
                        <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/20 text-sm">email</span>
                        <input type="email" name="email" required
                            class="w-full h-[50px] bg-white/5 border border-white/10 rounded-xl pl-11 pr-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="agency@example.com">
                    </div>
                </div>

                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Password</label>
                    <div class="relative">
                        <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/20 text-sm">lock</span>
                        <input type="password" name="password" required
                            class="w-full h-[50px] bg-white/5 border border-white/10 rounded-xl pl-11 pr-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="Enter your password">
                    </div>
                </div>

                <button type="submit"
                    class="w-full h-[50px] bg-accent text-primary-dark rounded-xl text-[11px] font-black uppercase tracking-[0.3em] transition-all shadow-lg hover:shadow-accent/40 hover:bg-white mt-2">
                    Sign In to Dashboard
                </button>
            </form>

            <div class="mt-8 pt-6 border-t border-white/5 text-center space-y-3">
                <p class="text-white/30 text-[10px] font-bold uppercase tracking-widest">
                    New Agency? <a href="${pageContext.request.contextPath}/agency/register" class="text-accent hover:text-white transition-colors underline ml-1">Register Here</a>
                </p>
                <p class="text-white/20 text-[10px] font-bold uppercase tracking-widest">
                    <a href="${pageContext.request.contextPath}/login.jsp" class="hover:text-white/50 transition-colors no-underline">Traveller Login →</a>
                </p>
            </div>
        </div>
    </div>
</section>

</body>
</html>
