<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yatraconnect.model.HamroTraveller" %>
<% if (session.getAttribute("admin") == null) { response.sendRedirect(request.getContextPath() + "/admin/login"); return; }
   List<HamroTraveller> users = (List<HamroTraveller>) request.getAttribute("users");
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
                <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-slate-500">Manage Users</span>
            </div>
            <h1 class="text-4xl font-serif font-bold text-white">User <span class="italic text-indigo-400">Management</span></h1>
        </div>

        <% if (msg != null) { %><div class="mb-6 p-4 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xs font-bold uppercase tracking-widest text-center"><%= msg %></div><% } %>
        <% if (err != null) { %><div class="mb-6 p-4 rounded-2xl bg-red-500/10 border border-red-500/20 text-red-400 text-xs font-bold uppercase tracking-widest text-center"><%= err %></div><% } %>

        <div class="bg-slate-900/50 border border-slate-800 rounded-[2.5rem] overflow-hidden backdrop-blur-xl fade-in-up-delay-1">
            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b border-slate-800 bg-slate-900/50">
                            <th class="px-8 py-5 text-[10px] font-black text-slate-500 uppercase tracking-widest">User</th>
                            <th class="px-6 py-5 text-[10px] font-black text-slate-500 uppercase tracking-widest">Email</th>
                            <th class="px-6 py-5 text-[10px] font-black text-slate-500 uppercase tracking-widest">Phone</th>
                            <th class="px-6 py-5 text-[10px] font-black text-slate-500 uppercase tracking-widest">Role</th>
                            <th class="px-6 py-5 text-[10px] font-black text-slate-500 uppercase tracking-widest">Joined</th>
                            <th class="px-6 py-5 text-[10px] font-black text-slate-500 uppercase tracking-widest text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-800/50">
                        <% if (users != null) for (HamroTraveller u : users) { %>
                        <tr class="hover:bg-slate-800/20 transition-all">
                            <td class="px-8 py-6">
                                <div class="flex items-center gap-3">
                                    <div class="w-10 h-10 rounded-xl bg-indigo-500/10 flex items-center justify-center text-indigo-400 font-bold text-xs"><%= u.getFullName().substring(0, Math.min(2, u.getFullName().length())).toUpperCase() %></div>
                                    <p class="text-white font-bold text-sm"><%= u.getFullName() %></p>
                                </div>
                            </td>
                            <td class="px-6 py-6 text-white/70 text-xs"><%= u.getEmail() %></td>
                            <td class="px-6 py-6 text-white/50 text-xs"><%= u.getContactNumber() != null ? u.getContactNumber() : "-" %></td>
                            <td class="px-6 py-6">
                                <span class="px-3 py-1 rounded-full text-[9px] font-bold uppercase tracking-widest
                                    <%= "suspended".equals(u.getRole()) ? "bg-red-500/10 text-red-400 border border-red-500/20" :
                                       "bg-emerald-500/10 text-emerald-400 border border-emerald-500/20" %>"><%= u.getRole() %></span>
                            </td>
                            <td class="px-6 py-6 text-slate-500 text-xs"><%= u.getCreatedAt() != null ? u.getCreatedAt().toString().substring(0, 10) : "-" %></td>
                            <td class="px-6 py-6">
                                <div class="flex items-center justify-end gap-2">
                                    <% if (!"suspended".equals(u.getRole())) { %>
                                    <form method="POST" action="${pageContext.request.contextPath}/admin/users/" class="inline">
                                        <input type="hidden" name="userId" value="<%= u.getId() %>"><input type="hidden" name="action" value="suspend">
                                        <button class="px-3 py-2 rounded-lg bg-yellow-500/10 text-yellow-400 text-[9px] font-bold uppercase tracking-widest hover:bg-yellow-500 hover:text-black transition-all">Suspend</button>
                                    </form>
                                    <% } else { %>
                                    <form method="POST" action="${pageContext.request.contextPath}/admin/users/" class="inline">
                                        <input type="hidden" name="userId" value="<%= u.getId() %>"><input type="hidden" name="action" value="activate">
                                        <button class="px-3 py-2 rounded-lg bg-emerald-500/10 text-emerald-400 text-[9px] font-bold uppercase tracking-widest hover:bg-emerald-500 hover:text-white transition-all">Activate</button>
                                    </form>
                                    <% } %>
                                    <form method="POST" action="${pageContext.request.contextPath}/admin/users/" class="inline" onsubmit="return confirm('Delete this user permanently?')">
                                        <input type="hidden" name="userId" value="<%= u.getId() %>"><input type="hidden" name="action" value="delete">
                                        <button class="px-2 py-2 rounded-lg text-slate-500 hover:text-red-400 transition-all"><span class="material-icons text-sm">delete</span></button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% if (users == null || users.isEmpty()) { %>
            <div class="py-20 text-center"><p class="text-slate-500 text-sm">No users found.</p></div>
            <% } %>
        </div>
    </div>
</section>
</body>
</html>
