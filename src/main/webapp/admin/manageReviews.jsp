<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yatraconnect.model.Review" %>
<% if (session.getAttribute("admin") == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
   List<Review> reviews = (List<Review>) request.getAttribute("reviews");
   String filter = (String) request.getAttribute("currentFilter");
   String msg = (String) session.getAttribute("successMessage");
   String err = (String) session.getAttribute("errorMessage");
   if (msg != null) session.removeAttribute("successMessage");
   if (err != null) session.removeAttribute("errorMessage");
%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />
<section class="min-h-screen bg-[#020617] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto">
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-10 fade-in-up">
            <div>
                <div class="flex items-center gap-2 text-indigo-400 mb-4">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Dashboard</a>
                    <span class="material-icons text-xs">chevron_right</span>
                    <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-slate-500">Manage Reviews</span>
                </div>
                <h1 class="text-4xl font-serif font-bold text-white">Review <span class="italic text-indigo-400">Moderation</span></h1>
            </div>
            <div class="flex gap-2">
                <a href="${pageContext.request.contextPath}/admin/reviews/" class="px-4 py-2 rounded-xl text-[10px] font-black uppercase tracking-widest no-underline <%= "all".equals(filter) || filter == null ? "bg-indigo-600 text-white" : "bg-slate-800 text-slate-400" %> transition-all">All</a>
                <a href="${pageContext.request.contextPath}/admin/reviews/?filter=pending" class="px-4 py-2 rounded-xl text-[10px] font-black uppercase tracking-widest no-underline <%= "pending".equals(filter) ? "bg-yellow-500 text-black" : "bg-slate-800 text-slate-400" %> transition-all">Pending</a>
            </div>
        </div>

        <% if (msg != null) { %><div class="mb-6 p-4 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xs font-bold uppercase tracking-widest text-center"><%= msg %></div><% } %>
        <% if (err != null) { %><div class="mb-6 p-4 rounded-2xl bg-red-500/10 border border-red-500/20 text-red-400 text-xs font-bold uppercase tracking-widest text-center"><%= err %></div><% } %>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 fade-in-up-delay-1">
            <% if (reviews != null) for (Review r : reviews) { %>
            <div class="bg-slate-900/50 border border-slate-800 rounded-3xl p-8 backdrop-blur-xl hover:border-slate-700 transition-all">
                <div class="flex items-start justify-between mb-4">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl bg-indigo-500/10 flex items-center justify-center text-indigo-400 font-bold text-xs">
                            <%= r.getTravellerName() != null ? r.getTravellerName().substring(0, Math.min(2, r.getTravellerName().length())).toUpperCase() : "??" %>
                        </div>
                        <div>
                            <p class="text-white font-bold text-sm"><%= r.getTravellerName() != null ? r.getTravellerName() : "Anonymous" %></p>
                            <p class="text-slate-500 text-[10px] uppercase tracking-widest"><%= r.getCreatedAt() != null ? r.getCreatedAt().toString().substring(0, 10) : "-" %></p>
                        </div>
                    </div>
                    <span class="px-3 py-1 rounded-full text-[9px] font-bold uppercase tracking-widest
                        <%= "approved".equals(r.getStatus()) ? "bg-emerald-500/10 text-emerald-400 border border-emerald-500/20" :
                           "pending".equals(r.getStatus()) ? "bg-yellow-500/10 text-yellow-400 border border-yellow-500/20" :
                           "bg-red-500/10 text-red-400 border border-red-500/20" %>"><%= r.getStatus() %></span>
                </div>

                <!-- Rating -->
                <div class="flex items-center gap-1 mb-3">
                    <% for (int i = 1; i <= 5; i++) { %>
                        <span class="material-icons text-sm <%= i <= r.getRating() ? "text-yellow-400" : "text-slate-700" %>">star</span>
                    <% } %>
                    <span class="text-slate-500 text-xs ml-2"><%= r.getRating() %>/5</span>
                </div>

                <p class="text-white/60 text-sm leading-relaxed mb-4 line-clamp-3"><%= r.getComment() != null ? r.getComment() : "No comment" %></p>
                <p class="text-slate-600 text-[10px] uppercase tracking-widest mb-6">Listing: <%= r.getListingTitle() != null ? r.getListingTitle() : r.getListingId() %></p>

                <div class="flex items-center gap-2 pt-4 border-t border-slate-800">
                    <% if ("pending".equals(r.getStatus())) { %>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/reviews/" class="inline">
                        <input type="hidden" name="reviewId" value="<%= r.getId() %>"><input type="hidden" name="action" value="approve">
                        <button class="px-4 py-2 rounded-xl bg-emerald-500/10 text-emerald-400 text-[9px] font-bold uppercase tracking-widest hover:bg-emerald-500 hover:text-white transition-all">Approve</button>
                    </form>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/reviews/" class="inline">
                        <input type="hidden" name="reviewId" value="<%= r.getId() %>"><input type="hidden" name="action" value="reject">
                        <button class="px-4 py-2 rounded-xl bg-red-500/10 text-red-400 text-[9px] font-bold uppercase tracking-widest hover:bg-red-500 hover:text-white transition-all">Reject</button>
                    </form>
                    <% } %>
                    <form method="POST" action="${pageContext.request.contextPath}/admin/reviews/" class="inline ml-auto" onsubmit="return confirm('Delete this review?')">
                        <input type="hidden" name="reviewId" value="<%= r.getId() %>"><input type="hidden" name="action" value="delete">
                        <button class="px-2 py-2 rounded-lg text-slate-600 hover:text-red-400 transition-all"><span class="material-icons text-sm">delete</span></button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>

        <% if (reviews == null || reviews.isEmpty()) { %>
        <div class="py-20 text-center fade-in-up"><p class="text-slate-500 text-sm">No reviews found.</p></div>
        <% } %>
    </div>
</section>
</body>
</html>
