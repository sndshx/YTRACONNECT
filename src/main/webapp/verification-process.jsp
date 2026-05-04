<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/navbar.jsp" />

<!-- Hero Section -->
<section class="relative pt-32 pb-20 lg:pt-40 lg:pb-28 overflow-hidden bg-[#0F1612]">
    <div class="absolute inset-0 z-0">
        <!-- Subtle Animated Glow -->
        <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-accent/10 rounded-full blur-[150px] pointer-events-none animate-pulse"></div>
    </div>
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center fade-in-up">
        <div class="inline-flex items-center justify-center w-16 h-16 rounded-full border border-accent/30 bg-white/5 mb-6 text-accent shadow-[0_0_30px_rgba(197,160,89,0.2)]">
            <span class="material-icons text-3xl">verified_user</span>
        </div>
        <span class="text-accent text-[10px] sm:text-xs font-bold tracking-[0.4em] uppercase mb-4 block">Our Standard of Excellence</span>
        <h1 class="text-4xl md:text-5xl lg:text-6xl text-white font-serif font-bold mb-6 tracking-tight">The Verification <span class="text-transparent bg-clip-text bg-gradient-to-r from-accent to-yellow-200">Process</span></h1>
        <p class="text-gray-400 text-sm md:text-base font-light leading-relaxed mb-10">We enforce a rigorous 4-step quality assurance protocol before any agency or hotel joins the YatraConnect Elite Collection. Trust and safety are our highest priorities.</p>
        
        <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
            <a href="register.jsp" class="w-full sm:w-auto bg-primary hover:bg-primary-dark text-white px-8 py-4 rounded-full font-bold uppercase tracking-widest text-[10px] md:text-xs transition-all shadow-lg hover:-translate-y-1 no-underline">Apply as Partner</a>
            <a href="#process" class="w-full sm:w-auto bg-transparent border border-white/20 text-white px-8 py-4 rounded-full font-bold uppercase tracking-widest text-[10px] md:text-xs transition-all hover:bg-white/10 no-underline">View Protocol</a>
        </div>
    </div>
</section>

<!-- Timeline Section -->
<section id="process" class="py-24 bg-bg-light relative">
    <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="relative border-l border-gray-200 ml-3 md:ml-6 space-y-16">
            
            <!-- Step 1 -->
            <div class="relative pl-10 md:pl-16">
                <div class="absolute -left-3 md:-left-4 top-0 w-6 h-6 md:w-8 md:h-8 rounded-full bg-primary flex items-center justify-center shadow-lg border-4 border-bg-light">
                    <span class="text-white text-[10px] font-black">1</span>
                </div>
                <div class="bg-white p-8 md:p-10 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
                    <h3 class="text-2xl font-serif font-bold text-primary mb-3">Application & Document Submission</h3>
                    <p class="text-gray-500 font-light text-sm leading-relaxed mb-6">Partners submit their initial application along with all legal documentation, including PAN registration, Company Registration, and owner citizenship details. We ensure the business is legally recognized by the Government of Nepal.</p>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <div class="flex items-center gap-2 bg-gray-50 p-2 rounded text-xs text-gray-600 font-bold"><span class="material-icons text-primary text-sm">description</span> PAN/VAT</div>
                        <div class="flex items-center gap-2 bg-gray-50 p-2 rounded text-xs text-gray-600 font-bold"><span class="material-icons text-primary text-sm">badge</span> Registration</div>
                        <div class="flex items-center gap-2 bg-gray-50 p-2 rounded text-xs text-gray-600 font-bold"><span class="material-icons text-primary text-sm">person</span> Owner ID</div>
                    </div>
                </div>
            </div>

            <!-- Step 2 -->
            <div class="relative pl-10 md:pl-16">
                <div class="absolute -left-3 md:-left-4 top-0 w-6 h-6 md:w-8 md:h-8 rounded-full bg-primary flex items-center justify-center shadow-lg border-4 border-bg-light">
                    <span class="text-white text-[10px] font-black">2</span>
                </div>
                <div class="bg-white p-8 md:p-10 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
                    <h3 class="text-2xl font-serif font-bold text-primary mb-3">Background & Safety Audit</h3>
                    <p class="text-gray-500 font-light text-sm leading-relaxed mb-6">Our verification team conducts a thorough background check. For trekking agencies, we verify the certifications of their lead guides (e.g., NATHM trained, First Aid certified). For hotels, we review their hygiene and safety protocols.</p>
                    <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                        <div class="flex items-center gap-2 bg-gray-50 p-2 rounded text-xs text-gray-600 font-bold"><span class="material-icons text-accent text-sm">health_and_safety</span> First Aid Checks</div>
                        <div class="flex items-center gap-2 bg-gray-50 p-2 rounded text-xs text-gray-600 font-bold"><span class="material-icons text-accent text-sm">school</span> NATHM Certs</div>
                    </div>
                </div>
            </div>

            <!-- Step 3 -->
            <div class="relative pl-10 md:pl-16">
                <div class="absolute -left-3 md:-left-4 top-0 w-6 h-6 md:w-8 md:h-8 rounded-full bg-primary flex items-center justify-center shadow-lg border-4 border-bg-light">
                    <span class="text-white text-[10px] font-black">3</span>
                </div>
                <div class="bg-white p-8 md:p-10 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
                    <h3 class="text-2xl font-serif font-bold text-primary mb-3">Physical Inspection (On-Site)</h3>
                    <p class="text-gray-500 font-light text-sm leading-relaxed">For our highest tier partners, YatraConnect representatives conduct physical on-site inspections of the hotel premises or agency offices to guarantee the reality matches the digital representation. We check room qualities, equipment standards, and overall hospitality.</p>
                </div>
            </div>

            <!-- Step 4 -->
            <div class="relative pl-10 md:pl-16">
                <div class="absolute -left-3 md:-left-4 top-0 w-6 h-6 md:w-8 md:h-8 rounded-full bg-accent flex items-center justify-center shadow-lg border-4 border-bg-light">
                    <span class="text-white text-[10px] font-black">4</span>
                </div>
                <div class="bg-primary-dark p-8 md:p-10 rounded-3xl shadow-xl border border-primary relative overflow-hidden">
                    <div class="absolute top-0 right-0 w-64 h-64 bg-accent/10 rounded-full blur-3xl"></div>
                    <h3 class="text-2xl font-serif font-bold text-white mb-3 relative z-10">Elite Verified Status Granted</h3>
                    <p class="text-gray-300 font-light text-sm leading-relaxed mb-6 relative z-10">Once all checks are passed, the partner is officially onboarded and receives the coveted Verified Badge. They are now visible to our global network of premium travellers.</p>
                    <div class="inline-flex items-center gap-2 bg-white/10 border border-white/20 backdrop-blur px-4 py-2 rounded-full relative z-10">
                        <span class="material-icons text-accent">verified</span>
                        <span class="text-white text-xs font-bold tracking-widest uppercase">Verified Partner</span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

</body>
</html>
