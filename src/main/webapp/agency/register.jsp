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
                <span class="text-[5px] md:text-[6px] text-white/90 font-bold tracking-[0.2em] uppercase mt-0.5 drop-shadow-md">Partner Registration</span>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/agency/login" class="text-white hover:text-white/80 transition-all font-bold tracking-widest uppercase text-[10px] bg-white/20 backdrop-blur-md px-6 py-2.5 rounded-full border border-white/30 shadow-lg no-underline">
            Back to Login
        </a>
    </nav>
</div>

<section class="relative min-h-screen flex items-center justify-center overflow-hidden py-24 px-4 bg-bg-dark">
    <div class="absolute inset-0 z-0">
        <img src="https://images.unsplash.com/photo-1585016495481-91613a3f58ea?q=80&w=2600&auto=format&fit=crop" class="w-full h-full object-cover opacity-30 scale-105" alt="Nepal">
        <div class="absolute inset-0 bg-primary/70 mix-blend-multiply"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-bg-dark via-transparent to-bg-dark/50"></div>
    </div>

    <div class="relative z-10 w-full sm:max-w-[560px] fade-in-up">
        <div class="text-center mb-8">
            <h1 class="text-3xl md:text-4xl font-serif font-bold text-white mb-2">Register Your <span class="italic text-accent">Agency</span></h1>
            <p class="text-white/50 text-sm">Join Nepal's premier travel partner network</p>
        </div>

        <div class="bg-white/[0.05] backdrop-blur-xl border border-white/10 rounded-[2.5rem] p-8 md:p-10 shadow-2xl">
            <% String error = (String) request.getAttribute("errorMessage");
               if (error != null) { %>
                <div class="p-4 mb-6 rounded-2xl bg-red-500/10 border border-red-500/20 text-red-400 text-xs font-bold uppercase tracking-widest text-center">
                    <%= error %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/agency/register" method="POST" enctype="multipart/form-data" class="space-y-5">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Agency / Company Name</label>
                        <input type="text" name="companyName" required
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="Himalayan Expeditions">
                    </div>
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Owner Full Name</label>
                        <input type="text" name="fullName" required
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="Ram Bahadur">
                    </div>
                </div>

                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Email Address</label>
                    <div class="relative">
                        <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/20 text-sm">email</span>
                        <input type="email" name="email" required
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl pl-11 pr-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="contact@agency.com">
                    </div>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Phone Number</label>
                        <input type="text" name="phone"
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="+977-9800000000">
                    </div>
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Location</label>
                        <input type="text" name="location"
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="Thamel, Kathmandu">
                    </div>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Password</label>
                        <input type="password" name="password" required minlength="6"
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="••••••••">
                    </div>
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Confirm Password</label>
                        <input type="password" name="confirmPassword" required minlength="6"
                            class="w-full h-[48px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm font-medium text-white focus:border-accent outline-none transition-all placeholder-white/20"
                            placeholder="••••••••">
                    </div>
                </div>

                <!-- License Upload -->
                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em] ml-1">Business License / PAN Document</label>
                    <div class="relative">
                        <label class="flex items-center justify-center gap-3 w-full h-[80px] bg-white/5 border-2 border-dashed border-white/10 rounded-xl cursor-pointer hover:border-accent/50 transition-all group">
                            <span class="material-icons text-2xl text-white/20 group-hover:text-accent transition-all">cloud_upload</span>
                            <div>
                                <p class="text-white/40 text-xs font-bold">Click to upload license document</p>
                                <p class="text-white/20 text-[9px] uppercase tracking-widest">PDF, JPG, PNG — Max 10MB</p>
                            </div>
                            <input type="file" name="licenseFile" accept=".pdf,.jpg,.jpeg,.png" class="hidden">
                        </label>
                    </div>
                </div>

                <div class="p-4 rounded-2xl bg-accent/5 border border-accent/10">
                    <div class="flex items-start gap-3">
                        <span class="material-icons text-accent text-sm mt-0.5">info</span>
                        <p class="text-white/40 text-[10px] leading-relaxed">
                            After registration, your agency will be reviewed by our admin team. Once approved, you'll receive full access to the partner dashboard.
                        </p>
                    </div>
                </div>

                <button type="submit"
                    class="w-full h-[50px] bg-accent text-primary-dark rounded-xl text-[11px] font-black uppercase tracking-[0.3em] transition-all shadow-lg hover:shadow-accent/40 hover:bg-white">
                    Submit Registration
                </button>
            </form>

            <div class="mt-6 pt-6 border-t border-white/5 text-center">
                <p class="text-white/30 text-[10px] font-bold uppercase tracking-widest">
                    Already registered? <a href="${pageContext.request.contextPath}/agency/login" class="text-accent hover:text-white transition-colors underline ml-1">Sign In</a>
                </p>
            </div>
        </div>
    </div>
</section>

</body>
</html>
