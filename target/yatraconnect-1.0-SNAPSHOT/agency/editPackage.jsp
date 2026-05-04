<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroAgent" %>
<%@ page import="com.yatraconnect.model.Listing" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />
<%
    HamroAgent agent = (HamroAgent) session.getAttribute("user");
    if (agent == null || !"agent".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    Listing pkg = (Listing) request.getAttribute("package");
    if (pkg == null) {
        response.sendRedirect(request.getContextPath() + "/agency/packages/");
        return;
    }
%>
<section class="min-h-screen bg-[#07203B] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-4xl mx-auto">
        <div class="mb-10 fade-in-up">
            <div class="flex items-center gap-2 text-accent mb-4">
                <a href="${pageContext.request.contextPath}/agency/packages/" class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Packages</a>
                <span class="material-icons text-xs">chevron_right</span>
                <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-white/40">Edit Package</span>
            </div>
            <h1 class="text-4xl font-serif font-bold text-white">Edit <span class="italic text-accent"><%= pkg.getTitle() %></span></h1>
        </div>

        <div class="bg-white/[0.03] border border-white/10 rounded-[2.5rem] p-8 md:p-12 backdrop-blur-xl shadow-2xl fade-in-up-delay-1">
            <form action="${pageContext.request.contextPath}/agency/packages/" method="POST" class="space-y-8">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="packageId" value="<%= pkg.getId() %>">

                <div class="space-y-3">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Package Type</label>
                    <div class="grid grid-cols-3 gap-4">
                        <label class="cursor-pointer"><input type="radio" name="type" value="trekking" class="hidden peer" <%= "trekking".equals(pkg.getType()) ? "checked" : "" %>>
                            <div class="p-5 rounded-2xl border border-white/10 bg-white/[0.02] text-center peer-checked:border-accent peer-checked:bg-accent/10 transition-all hover:bg-white/5">
                                <span class="material-icons text-2xl text-white/30 mb-1 block">terrain</span>
                                <span class="text-[10px] font-black text-white/60 uppercase tracking-widest">Trekking</span>
                            </div>
                        </label>
                        <label class="cursor-pointer"><input type="radio" name="type" value="hotel" class="hidden peer" <%= "hotel".equals(pkg.getType()) ? "checked" : "" %>>
                            <div class="p-5 rounded-2xl border border-white/10 bg-white/[0.02] text-center peer-checked:border-accent peer-checked:bg-accent/10 transition-all hover:bg-white/5">
                                <span class="material-icons text-2xl text-white/30 mb-1 block">hotel</span>
                                <span class="text-[10px] font-black text-white/60 uppercase tracking-widest">Hotel</span>
                            </div>
                        </label>
                        <label class="cursor-pointer"><input type="radio" name="type" value="travel" class="hidden peer" <%= "travel".equals(pkg.getType()) ? "checked" : "" %>>
                            <div class="p-5 rounded-2xl border border-white/10 bg-white/[0.02] text-center peer-checked:border-accent peer-checked:bg-accent/10 transition-all hover:bg-white/5">
                                <span class="material-icons text-2xl text-white/30 mb-1 block">flight</span>
                                <span class="text-[10px] font-black text-white/60 uppercase tracking-widest">Tour</span>
                            </div>
                        </label>
                    </div>
                </div>

                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Title</label>
                    <input type="text" name="title" required value="<%= pkg.getTitle() %>" class="w-full h-[50px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm text-white focus:border-accent outline-none transition-all">
                </div>

                <div class="grid grid-cols-3 gap-6">
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Price ($)</label>
                        <input type="number" name="price" required step="0.01" value="<%= pkg.getPrice() %>" class="w-full h-[50px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm text-white focus:border-accent outline-none transition-all">
                    </div>
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Duration</label>
                        <input type="number" name="duration" min="1" value="<%= pkg.getDuration() %>" class="w-full h-[50px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm text-white focus:border-accent outline-none transition-all">
                    </div>
                    <div class="space-y-1.5">
                        <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Difficulty</label>
                        <select name="difficulty" class="w-full h-[50px] bg-[#0a2540] border border-white/10 rounded-xl px-4 text-sm text-white focus:border-accent outline-none">
                            <option value="">Select</option>
                            <option value="easy" <%= "easy".equals(pkg.getDifficulty()) ? "selected" : "" %>>Easy</option>
                            <option value="moderate" <%= "moderate".equals(pkg.getDifficulty()) ? "selected" : "" %>>Moderate</option>
                            <option value="hard" <%= "hard".equals(pkg.getDifficulty()) ? "selected" : "" %>>Hard</option>
                            <option value="extreme" <%= "extreme".equals(pkg.getDifficulty()) ? "selected" : "" %>>Extreme</option>
                        </select>
                    </div>
                </div>

                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Location</label>
                    <input type="text" name="location" value="<%= pkg.getLocation() != null ? pkg.getLocation() : "" %>" class="w-full h-[50px] bg-white/5 border border-white/10 rounded-xl px-4 text-sm text-white focus:border-accent outline-none transition-all">
                </div>

                <div class="space-y-1.5">
                    <label class="text-[9px] font-bold text-white/40 uppercase tracking-[0.2em]">Description</label>
                    <textarea name="description" rows="5" class="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-sm text-white focus:border-accent outline-none transition-all resize-none"><%= pkg.getDescription() != null ? pkg.getDescription() : "" %></textarea>
                </div>

                <div class="flex items-center justify-between pt-6 border-t border-white/5">
                    <a href="${pageContext.request.contextPath}/agency/packages/" class="text-white/40 text-[10px] font-black uppercase tracking-widest hover:text-white transition-all no-underline">Cancel</a>
                    <button type="submit" class="px-10 py-4 bg-accent text-primary-dark rounded-2xl text-[10px] font-black uppercase tracking-widest hover:bg-white transition-all shadow-xl shadow-accent/20">Update Package</button>
                </div>
            </form>
        </div>
    </div>
</section>
<jsp:include page="../includes/footer.jsp" />
</body>
</html>
