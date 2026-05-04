<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yatraconnect.model.Promotion" %>
<% if (session.getAttribute("admin") == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
   List<Promotion> promotions = (List<Promotion>) request.getAttribute("promotions");
   String msg = (String) session.getAttribute("successMessage");
   String err = (String) session.getAttribute("errorMessage");
   if (msg != null) session.removeAttribute("successMessage");
   if (err != null) session.removeAttribute("errorMessage");
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />
<section class="min-h-screen bg-[#020617] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <div class="mb-10 fade-in-up">
            <div class="flex items-center gap-2 text-indigo-400 mb-4">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Dashboard</a>
                <span class="material-icons text-xs">chevron_right</span>
                <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-slate-500">Promotions</span>
            </div>
            <h1 class="text-4xl font-serif font-bold text-white">Promotion <span class="italic text-indigo-400">Control</span></h1>
        </div>

        <% if (msg != null) { %><div class="mb-6 p-4 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xs font-bold uppercase tracking-widest text-center"><%= msg %></div><% } %>
        <% if (err != null) { %><div class="mb-6 p-4 rounded-2xl bg-red-500/10 border border-red-500/20 text-red-400 text-xs font-bold uppercase tracking-widest text-center"><%= err %></div><% } %>

        <% if (promotions != null && !promotions.isEmpty()) { %>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 fade-in-up-delay-1">
            <% for (Promotion p : promotions) { %>
            <div class="bg-slate-900/50 border border-slate-800 rounded-3xl p-8 backdrop-blur-xl hover:border-slate-700 transition-all">
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <h3 class="text-white font-bold text-lg mb-1"><%= p.getTitle() %></h3>
                        <p class="text-slate-500 text-[10px] uppercase tracking-widest"><%= p.getCompanyName() != null ? p.getCompanyName() : "Unknown" %></p>
                    </div>
                    <span class="px-3 py-1 rounded-full text-[9px] font-bold uppercase tracking-widest
                        <%= "approved".equals(p.getStatus()) ? "bg-emerald-500/10 text-emerald-400 border border-emerald-500/20" :
                           "pending".equals(p.getStatus()) ? "bg-yellow-500/10 text-yellow-400 border border-yellow-500/20" :
                           "rejected".equals(p.getStatus()) ? "bg-red-500/10 text-red-400 border border-red-500/20" :
                           "bg-slate-800 text-slate-400 border border-slate-700" %>"><%= p.getStatus() %></span>
                </div>

                <p class="text-white/50 text-sm mb-4 line-clamp-2"><%= p.getDescription() != null ? p.getDescription() : "" %></p>

                <div class="grid grid-cols-2 gap-4 mb-6">
                    <div class="bg-slate-800/30 rounded-xl p-3 text-center">
                        <p class="text-indigo-400 font-bold text-lg"><%= p.getDiscountPercent() %>%</p>
                        <p class="text-[9px] text-slate-500 uppercase tracking-widest">Discount</p>
                    </div>
                    <div class="bg-slate-800/30 rounded-xl p-3 text-center">
                        <p class="text-white text-xs font-bold"><%= p.getStartDate() %></p>
                        <p class="text-[9px] text-slate-500 uppercase tracking-widest">to <%= p.getEndDate() %></p>
                    </div>
                </div>

                <div class="flex items-center gap-2 pt-4 border-t border-slate-800">
                    <% if ("pending".equals(p.getStatus())) { %>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/promotions/" class="inline">
                        <input type="hidden" name="promotionId" value="<%= p.getId() %>"><input type="hidden" name="action" value="approve">
                        <button class="px-3 py-2 rounded-lg bg-emerald-500/10 text-emerald-400 text-[9px] font-bold uppercase tracking-widest hover:bg-emerald-500 hover:text-white transition-all">Approve</button>
                    </form>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/promotions/" class="inline">
                        <input type="hidden" name="promotionId" value="<%= p.getId() %>"><input type="hidden" name="action" value="reject">
                        <button class="px-3 py-2 rounded-lg bg-red-500/10 text-red-400 text-[9px] font-bold uppercase tracking-widest hover:bg-red-500 hover:text-white transition-all">Reject</button>
                    </form>
                    <% } %>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/promotions/" class="inline ml-auto" onsubmit="return confirm('Delete?')">
                        <input type="hidden" name="promotionId" value="<%= p.getId() %>"><input type="hidden" name="action" value="delete">
                        <button class="text-slate-600 hover:text-red-400 transition-all"><span class="material-icons text-sm">delete</span></button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="py-20 text-center fade-in-up">
            <div class="w-20 h-20 mx-auto mb-6 rounded-full bg-slate-800 flex items-center justify-center text-slate-600">
                <span class="material-icons text-4xl">campaign</span>
            </div>
            <h3 class="text-xl font-serif font-bold text-white mb-2">No Promotions Yet</h3>
            <p class="text-slate-500 text-sm">Promotions submitted by agencies will appear here for review.</p>
        </div>
        <% } %>
    </div>
</section>
</body>
</html>
