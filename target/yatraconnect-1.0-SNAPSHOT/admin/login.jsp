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
                <span class="text-[5px] md:text-[6px] text-white/90 font-bold tracking-[0.2em] uppercase mt-0.5 drop-shadow-md">Admin Command Center</span>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="text-white hover:text-white/80 transition-all font-bold tracking-widest uppercase text-[10px] bg-white/20 backdrop-blur-md px-6 py-2.5 rounded-full border border-white/30 shadow-lg no-underline">
            Back to Home
        </a>
    </nav>
</div>

<section class="relative min-h-screen flex items-center justify-center overflow-hidden py-24 px-4 bg-[#0a0a0b]">
    <!-- Cinematic Background -->
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1533130061792-64b345e4a833?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-30 scale-105" alt="Dark Himalayas">
        <div class="absolute inset-0 bg-[#1a365d]/40 mix-blend-multiply"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-[#0a0a0b] via-transparent to-[#0a0a0b]/50"></div>
    </div>

    <div class="relative z-10 w-full sm:max-w-[480px] fade-in-up">
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-white/10 backdrop-blur-md border border-white/20 mb-4 shadow-2xl">
                <span class="material-icons text-white text-3xl">admin_panel_settings</span>
            </div>
            <h1 class="text-3xl md:text-4xl font-serif font-bold text-white mb-2">Internal <span class="italic text-accent">Access</span></h1>
            <p class="text-white/40 text-xs font-bold uppercase tracking-[0.3em]">Administrator Authentication</p>
        </div>

        <div class="bg-white/[0.03] backdrop-blur-2xl border border-white/10 rounded-[2.5rem] p-8 md:p-10 shadow-[0_30px_100px_-20px_rgba(0,0,0,0.5)]">
            <% String error = (String) request.getAttribute("errorMessage");
               if (error != null) { %>
                <div class="p-4 mb-6 rounded-2xl bg-red-500/10 border border-red-500/20 text-red-400 text-xs font-bold uppercase tracking-widest text-center flex flex-col items-center gap-2">
                    <span class="material-icons text-lg">error_outline</span>
                    <%= error %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/admin/login" method="POST" class="space-y-6">
                <div class="space-y-2">
                    <label class="text-[10px] font-bold text-white/30 uppercase tracking-[0.2em] ml-1">Admin Identity</label>
                    <div class="relative group">
                        <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/20 text-sm group-focus-within:text-accent transition-colors">fingerprint</span>
                        <input type="email" name="email" required
                            class="w-full h-[55px] bg-white/[0.02] border border-white/10 rounded-2xl pl-12 pr-4 text-sm font-medium text-white focus:border-accent/50 focus:bg-white/[0.05] outline-none transition-all placeholder-white/10"
                            placeholder="admin@yatraconnect.com">
                    </div>
                </div>

                <div class="space-y-2">
                    <label class="text-[10px] font-bold text-white/30 uppercase tracking-[0.2em] ml-1">Security Key</label>
                    <div class="relative group">
                        <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/20 text-sm group-focus-within:text-accent transition-colors">lock</span>
                        <input type="password" name="password" required
                            class="w-full h-[55px] bg-white/[0.02] border border-white/10 rounded-2xl pl-12 pr-4 text-sm font-medium text-white focus:border-accent/50 focus:bg-white/[0.05] outline-none transition-all placeholder-white/10"
                            placeholder="••••••••••••">
                    </div>
                </div>

                <button type="submit"
                    class="w-full h-[55px] bg-white text-[#0a0a0b] rounded-2xl text-[11px] font-black uppercase tracking-[0.4em] transition-all shadow-xl hover:shadow-white/10 hover:bg-accent hover:text-primary-dark mt-4 transform hover:-translate-y-0.5 active:translate-y-0">
                    Verify & Enter
                </button>
            </form>

            <div class="mt-8 pt-8 border-t border-white/5 text-center">
                <p class="text-white/20 text-[9px] font-bold uppercase tracking-[0.4em]">
                    System protected by hardware-level encryption
                </p>
                <div class="flex justify-center gap-4 mt-6">
                    <div class="w-1.5 h-1.5 rounded-full bg-accent/20 animate-pulse"></div>
                    <div class="w-1.5 h-1.5 rounded-full bg-accent/40 animate-pulse [animation-delay:0.2s]"></div>
                    <div class="w-1.5 h-1.5 rounded-full bg-accent/20 animate-pulse [animation-delay:0.4s]"></div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
