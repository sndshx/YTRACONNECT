<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroTraveller" %>
<%
    HamroTraveller admin = (HamroTraveller) session.getAttribute("user");
    if (admin == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="min-h-screen bg-[#020617] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <!-- Header -->
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12 fade-in-up">
            <div class="space-y-4">
                <div class="flex items-center gap-2 text-indigo-400">
                    <a href="dashboard.jsp" class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Dashboard</a>
                    <span class="material-icons text-xs">chevron_right</span>
                    <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-white/40">Agency Verification</span>
                </div>
                <h1 class="text-4xl md:text-5xl font-serif font-bold text-white leading-tight">Partner <span class="italic text-indigo-400">Verifications</span></h1>
                <p class="text-slate-400 font-light max-w-xl">Review and validate registration documents from new agency partners. Maintain the elite standard of YatraConnect.</p>
            </div>
            
            <div class="flex items-center gap-4">
                <div class="text-right">
                    <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1">Queue Status</p>
                    <p class="text-xl font-bold text-white">08 <span class="text-indigo-400 font-normal">Pending</span></p>
                </div>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="flex items-center gap-3 mb-8 fade-in-up-delay-1 overflow-x-auto no-scrollbar pb-2">
            <button class="px-6 py-2.5 rounded-full bg-indigo-600 text-white text-[10px] font-black uppercase tracking-widest shadow-lg shadow-indigo-600/20 whitespace-nowrap">All Applications</button>
            <button class="px-6 py-2.5 rounded-full bg-slate-900 border border-slate-800 text-slate-400 hover:text-white transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">New Requests</button>
            <button class="px-6 py-2.5 rounded-full bg-slate-900 border border-slate-800 text-slate-400 hover:text-white transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Document Review</button>
            <button class="px-6 py-2.5 rounded-full bg-slate-900 border border-slate-800 text-slate-400 hover:text-white transition-all text-[10px] font-black uppercase tracking-widest whitespace-nowrap">Flagged</button>
        </div>

        <!-- Verification List -->
        <div class="space-y-6 fade-in-up-delay-2">
            <!-- Agency Item 1 -->
            <div class="bg-slate-900/50 border border-slate-800 rounded-[2.5rem] overflow-hidden backdrop-blur-xl group hover:border-indigo-500/30 transition-all duration-500 shadow-2xl">
                <div class="p-8 md:p-10">
                    <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-8">
                        <div class="flex items-center gap-8">
                            <div class="w-20 h-20 rounded-3xl bg-white/5 flex items-center justify-center text-indigo-400 border border-slate-800 group-hover:bg-indigo-500/10 transition-all">
                                <span class="material-icons text-4xl">business</span>
                            </div>
                            <div>
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-2xl font-serif font-bold text-white">High Himalayan Expeditions</h3>
                                    <span class="px-3 py-1 rounded-full bg-indigo-500/10 text-indigo-400 text-[9px] font-black uppercase tracking-widest border border-indigo-500/20">Awaiting Approval</span>
                                </div>
                                <div class="flex flex-wrap items-center gap-6">
                                    <div class="flex items-center gap-2">
                                        <span class="material-icons text-slate-600 text-xs">person</span>
                                        <span class="text-xs text-slate-400">Ramesh Thapa (Owner)</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <span class="material-icons text-slate-600 text-xs">location_on</span>
                                        <span class="text-xs text-slate-400">Kathmandu, Nepal</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <span class="material-icons text-slate-600 text-xs">event</span>
                                        <span class="text-xs text-slate-400">Applied 2 days ago</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="flex items-center gap-3">
                            <button class="px-8 py-3 bg-indigo-600 text-white rounded-xl text-[10px] font-black uppercase tracking-widest hover:bg-indigo-500 transition-all shadow-xl shadow-indigo-600/20">Approve</button>
                            <button class="px-8 py-3 bg-white/5 border border-white/10 text-white rounded-xl text-[10px] font-black uppercase tracking-widest hover:bg-red-500/20 hover:text-red-500 hover:border-red-500/30 transition-all">Reject</button>
                        </div>
                    </div>

                    <!-- Documents Section -->
                    <div class="mt-10 pt-10 border-t border-slate-800/50">
                        <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-6">Verification Dossier</p>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div class="bg-slate-800/30 rounded-2xl p-6 border border-slate-800 flex items-center justify-between hover:bg-slate-800/50 transition-all cursor-pointer">
                                <div class="flex items-center gap-4">
                                    <span class="material-icons text-indigo-400">description</span>
                                    <span class="text-[11px] font-bold text-white uppercase tracking-wider">PAN Certificate</span>
                                </div>
                                <span class="material-icons text-emerald-400 text-sm">check_circle</span>
                            </div>
                            <div class="bg-slate-800/30 rounded-2xl p-6 border border-slate-800 flex items-center justify-between hover:bg-slate-800/50 transition-all cursor-pointer">
                                <div class="flex items-center gap-4">
                                    <span class="material-icons text-indigo-400">badge</span>
                                    <span class="text-[11px] font-bold text-white uppercase tracking-wider">Owner Identity</span>
                                </div>
                                <span class="material-icons text-emerald-400 text-sm">check_circle</span>
                            </div>
                            <div class="bg-slate-800/30 rounded-2xl p-6 border border-slate-800 flex items-center justify-between hover:bg-slate-800/50 transition-all cursor-pointer border-dashed border-indigo-500/50">
                                <div class="flex items-center gap-4">
                                    <span class="material-icons text-indigo-400">business_center</span>
                                    <span class="text-[11px] font-bold text-white uppercase tracking-wider">Tourism License</span>
                                </div>
                                <span class="material-icons text-indigo-400 text-sm">visibility</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Agency Item 2 -->
            <div class="bg-slate-900/50 border border-slate-800 rounded-[2.5rem] overflow-hidden backdrop-blur-xl group hover:border-indigo-500/30 transition-all duration-500 shadow-2xl">
                <div class="p-8 md:p-10">
                    <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-8">
                        <div class="flex items-center gap-8">
                            <div class="w-20 h-20 rounded-3xl bg-white/5 flex items-center justify-center text-indigo-400 border border-slate-800">
                                <span class="material-icons text-4xl">hotel</span>
                            </div>
                            <div>
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-2xl font-serif font-bold text-white">Annapurna Boutique Lodge</h3>
                                    <span class="px-3 py-1 rounded-full bg-slate-800 text-slate-500 text-[9px] font-black uppercase tracking-widest border border-slate-700">Documents Incomplete</span>
                                </div>
                                <div class="flex flex-wrap items-center gap-6">
                                    <div class="flex items-center gap-2">
                                        <span class="material-icons text-slate-600 text-xs">person</span>
                                        <span class="text-xs text-slate-400">Sita Gurung (Owner)</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <span class="material-icons text-slate-600 text-xs">location_on</span>
                                        <span class="text-xs text-slate-400">Pokhara, Nepal</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <span class="material-icons text-slate-600 text-xs">event</span>
                                        <span class="text-xs text-slate-400">Applied 5 days ago</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="flex items-center gap-3">
                            <button class="px-8 py-3 bg-white/5 border border-white/10 text-white rounded-xl text-[10px] font-black uppercase tracking-widest hover:bg-indigo-600 hover:border-indigo-600 transition-all">Request More Info</button>
                            <button class="px-8 py-3 bg-white/5 border border-white/10 text-white rounded-xl text-[10px] font-black uppercase tracking-widest hover:bg-red-500/20 hover:text-red-500 hover:border-red-500/30 transition-all">Reject</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Empty State (Hidden) -->
        <div class="hidden flex-col items-center justify-center py-40 fade-in-up">
            <div class="w-24 h-24 rounded-full bg-slate-900 flex items-center justify-center text-slate-800 mb-8">
                <span class="material-icons text-5xl">verified_user</span>
            </div>
            <h3 class="text-2xl font-serif font-bold text-white mb-2">No Pending Verifications</h3>
            <p class="text-slate-500 text-sm mb-8 text-center max-w-sm">You have successfully reviewed all current agency applications. Great work maintaining the platform standards!</p>
        </div>
    </div>
</section>

</body>
</html>
