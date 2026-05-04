<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroTraveller" %>
<%
    HamroTraveller user = (HamroTraveller) session.getAttribute("user");
    if (user == null || !"traveller".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="min-h-screen bg-[#0F281E] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto h-[800px] flex flex-col md:flex-row bg-white/[0.03] border border-white/5 rounded-[4rem] overflow-hidden backdrop-blur-xl shadow-2xl">
        
        <!-- Sidebar: Conversations -->
        <div class="w-full md:w-96 border-r border-white/5 flex flex-col shrink-0">
            <div class="p-10 border-b border-white/5">
                <h1 class="text-3xl font-serif font-bold text-white mb-6">Messages</h1>
                <div class="relative">
                    <span class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/20 text-sm">search</span>
                    <input type="text" placeholder="Search agencies..." class="w-full bg-white/5 border border-white/10 rounded-2xl py-3 pl-10 pr-4 text-xs text-white focus:outline-none focus:border-[#C5A059] transition-all">
                </div>
            </div>
            
            <div class="flex-1 overflow-y-auto no-scrollbar py-6">
                <!-- Conversation Item (Active) -->
                <div class="px-8 py-6 bg-white/5 border-l-4 border-[#C5A059] flex items-center gap-4 cursor-pointer group">
                    <div class="relative">
                        <div class="w-14 h-14 rounded-2xl overflow-hidden grayscale group-hover:grayscale-0 transition-all duration-500">
                            <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?q=80&w=200" class="w-full h-full object-cover">
                        </div>
                        <div class="absolute -bottom-1 -right-1 w-4 h-4 rounded-full bg-emerald-500 border-2 border-[#0F281E]"></div>
                    </div>
                    <div class="flex-1 min-w-0">
                        <div class="flex justify-between items-center mb-1">
                            <h4 class="text-white font-bold text-sm truncate">Elite Himalayan</h4>
                            <span class="text-[8px] text-white/20 font-black uppercase">12:45 PM</span>
                        </div>
                        <p class="text-[10px] text-white/40 truncate font-light">Your permit for Everest region is confirmed!</p>
                    </div>
                </div>

                <!-- Conversation Item -->
                <div class="px-8 py-6 flex items-center gap-4 cursor-pointer hover:bg-white/[0.02] transition-all group">
                    <div class="w-14 h-14 rounded-2xl overflow-hidden grayscale group-hover:grayscale-0 transition-all duration-500">
                        <img src="https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=200" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1 min-w-0">
                        <div class="flex justify-between items-center mb-1">
                            <h4 class="text-white font-bold text-sm truncate">Dwarika's Heritage</h4>
                            <span class="text-[8px] text-white/20 font-black uppercase">Yesterday</span>
                        </div>
                        <p class="text-[10px] text-white/40 truncate font-light">We look forward to welcoming you to Kathmandu.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Chat Area -->
        <div class="flex-1 flex flex-col relative overflow-hidden">
            <!-- Chat Header -->
            <div class="p-8 md:px-12 md:py-10 border-b border-white/5 flex items-center justify-between bg-white/[0.01]">
                <div class="flex items-center gap-6">
                    <div class="w-12 h-12 rounded-2xl bg-[#C5A059]/20 flex items-center justify-center text-[#C5A059]">
                        <span class="material-icons text-xl">verified</span>
                    </div>
                    <div>
                        <h3 class="text-xl font-serif font-bold text-white tracking-tight">Elite Himalayan <span class="italic text-[#C5A059]">Concierge</span></h3>
                        <p class="text-emerald-400 text-[9px] font-black uppercase tracking-widest mt-1">Direct Line • Online</p>
                    </div>
                </div>
                <div class="flex gap-4">
                    <button class="w-12 h-12 rounded-2xl bg-white/5 border border-white/10 flex items-center justify-center text-white/40 hover:text-white transition-all"><span class="material-icons text-xl">phone</span></button>
                    <button class="w-12 h-12 rounded-2xl bg-white/5 border border-white/10 flex items-center justify-center text-white/40 hover:text-white transition-all"><span class="material-icons text-xl">more_vert</span></button>
                </div>
            </div>

            <!-- Messages Area -->
            <div class="flex-1 overflow-y-auto no-scrollbar p-10 space-y-8">
                <!-- Message Recipient -->
                <div class="flex items-start gap-4 max-w-lg">
                    <div class="w-8 h-8 rounded-xl overflow-hidden shrink-0">
                        <img src="https://images.unsplash.com/photo-1544735745-b89b1da64bcc?q=80&w=100" class="w-full h-full object-cover">
                    </div>
                    <div class="p-5 rounded-2xl rounded-tl-none bg-white/5 border border-white/10">
                        <p class="text-xs text-white/80 leading-relaxed">Greetings! I'm Pasang, your lead guide for the upcoming Everest expedition. I've just uploaded your final itinerary and permit copies.</p>
                        <span class="text-[8px] text-white/20 font-black uppercase mt-3 block">10:30 AM</span>
                    </div>
                </div>

                <!-- Message Sender -->
                <div class="flex items-start gap-4 max-w-lg ml-auto flex-row-reverse">
                    <div class="w-8 h-8 rounded-xl bg-[#C5A059] flex items-center justify-center shrink-0">
                        <span class="text-[#0F281E] font-black text-xs">YS</span>
                    </div>
                    <div class="p-5 rounded-2xl rounded-tr-none bg-[#C5A059] text-primary">
                        <p class="text-xs font-bold leading-relaxed">Thank you, Pasang! I've received the documents. Is there anything specific I should pack for the higher altitude sections?</p>
                        <span class="text-[8px] text-primary/40 font-black uppercase mt-3 block text-right">10:45 AM • Read</span>
                    </div>
                </div>

                <!-- System Notice -->
                <div class="flex justify-center">
                    <span class="px-6 py-2 rounded-full bg-white/5 text-white/20 text-[8px] font-black uppercase tracking-[0.2em]">Itinerary Updated • April 25</span>
                </div>
            </div>

            <!-- Input Area -->
            <div class="p-10 bg-white/[0.01] border-t border-white/5">
                <form class="flex items-center gap-4">
                    <button type="button" class="w-14 h-14 rounded-2xl bg-white/5 hover:bg-white/10 transition-all flex items-center justify-center text-white/40">
                        <span class="material-icons text-xl">attach_file</span>
                    </button>
                    <input type="text" placeholder="Draft your message..." class="flex-1 bg-white/5 border border-white/10 rounded-2xl h-14 px-8 text-sm text-white focus:outline-none focus:border-[#C5A059] transition-all">
                    <button type="submit" class="w-14 h-14 rounded-2xl bg-[#C5A059] hover:bg-white hover:scale-105 transition-all flex items-center justify-center text-primary shadow-2xl shadow-[#C5A059]/20">
                        <span class="material-icons text-xl">send</span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
