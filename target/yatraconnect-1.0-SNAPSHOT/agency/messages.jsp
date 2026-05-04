<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yatraconnect.model.HamroAgent" %>
        <% 
            HamroAgent agent = (HamroAgent) session.getAttribute("user"); 
            if (agent == null || !"agent".equals(session.getAttribute("role"))) { 
                response.sendRedirect(request.getContextPath() + "/login.jsp"); 
                return; 
            }
            List<com.yatraconnect.model.Message> messages = (List<com.yatraconnect.model.Message>) request.getAttribute("messages");
            com.yatraconnect.model.Message selectedMessage = (com.yatraconnect.model.Message) request.getAttribute("selectedMessage");
        %>

        <%@ page import="com.yatraconnect.model.HamroAgent, com.yatraconnect.model.Message, java.util.List" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<section class="min-h-screen bg-[#0D3B66] pt-32 pb-20 px-4 md:px-8">
    <div class="max-w-7xl mx-auto h-[800px] flex gap-6 fade-in-up">
        <!-- Chat Sidebar -->
        <div class="w-full md:w-80 lg:w-96 bg-white/5 border border-white/10 rounded-[2.5rem] backdrop-blur-xl flex flex-col overflow-hidden">
            <div class="p-8 border-b border-white/5">
                <h2 class="text-2xl font-serif font-bold text-white mb-6">Concierge <span class="italic text-[#C5A059]">Chat</span></h2>
                <div class="relative group">
                    <input type="text" placeholder="Search conversations..." class="w-full bg-white/5 border border-white/10 rounded-2xl px-5 py-3 text-xs text-white focus:border-[#C5A059] outline-none transition-all">
                    <span class="material-icons absolute right-4 top-1/2 -translate-y-1/2 text-white/20 text-sm">search</span>
                </div>
            </div>
            
            <div class="flex-1 overflow-y-auto no-scrollbar p-4 space-y-2">
                <% if (messages != null && !messages.isEmpty()) { 
                    for (Message msg : messages) {
                        boolean isSelected = selectedMessage != null && msg.getId().equals(selectedMessage.getId());
                %>
                <a href="messages?id=<%= msg.getId() %>" class="w-full p-6 rounded-3xl <%= isSelected ? "bg-[#C5A059] text-primary shadow-xl shadow-[#C5A059]/20" : "hover:bg-white/5 text-white" %> flex items-center gap-4 text-left transition-all no-underline">
                    <div class="w-12 h-12 rounded-2xl <%= isSelected ? "bg-primary/10" : "bg-white/5" %> flex items-center justify-center font-bold text-sm">
                        <%= msg.getCustomerName().substring(0, 1).toUpperCase() %>
                    </div>
                    <div class="flex-1 min-w-0">
                        <div class="flex items-center justify-between mb-1">
                            <span class="text-sm font-bold truncate"><%= msg.getCustomerName() %></span>
                            <span class="text-[8px] font-black uppercase <%= isSelected ? "opacity-60" : "text-white/30" %>"><%= msg.getStatus() %></span>
                        </div>
                        <p class="text-[10px] truncate <%= isSelected ? "opacity-80" : "text-white/40" %>"><%= msg.getSubject() %></p>
                    </div>
                </a>
                <% } } else { %>
                <p class="text-white/20 text-[10px] text-center py-10 uppercase tracking-widest font-black">No messages yet</p>
                <% } %>
            </div>
        </div>

        <!-- Main Chat Area -->
        <div class="hidden md:flex flex-1 bg-white/5 border border-white/10 rounded-[2.5rem] backdrop-blur-xl flex-col overflow-hidden">
            <% if (selectedMessage != null) { %>
            <!-- Chat Header -->
            <div class="p-8 border-b border-white/5 flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <div class="w-14 h-14 rounded-2xl bg-[#C5A059]/20 flex items-center justify-center text-[#C5A059] font-bold">
                        <%= selectedMessage.getCustomerName().substring(0, 1).toUpperCase() %>
                    </div>
                    <div>
                        <h3 class="text-white font-bold"><%= selectedMessage.getCustomerName() %></h3>
                        <div class="flex items-center gap-2">
                            <span class="text-[9px] text-white/40 font-black uppercase tracking-widest"><%= selectedMessage.getCustomerEmail() %></span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Messages List -->
            <div class="flex-1 overflow-y-auto p-10 space-y-8 no-scrollbar bg-white/[0.02]">
                <div class="flex justify-center">
                    <span class="px-4 py-1.5 rounded-full bg-white/5 text-[8px] font-black text-white/30 uppercase tracking-[0.2em]"><%= selectedMessage.getSubject() %></span>
                </div>

                <!-- Traveller Message -->
                <div class="flex items-end gap-4 max-w-[80%]">
                    <div class="w-8 h-8 rounded-xl bg-white/5 flex items-center justify-center text-[10px] text-white/30 font-bold shrink-0">
                        <%= selectedMessage.getCustomerName().substring(0, 1).toUpperCase() %>
                    </div>
                    <div class="bg-white/10 border border-white/10 p-6 rounded-t-[2rem] rounded-br-[2rem] text-sm text-white leading-relaxed">
                        <%= selectedMessage.getMessage() %>
                        <p class="mt-2 text-[8px] font-black uppercase text-white/20"><%= selectedMessage.getCreatedAt() %></p>
                    </div>
                </div>
            </div>

            <!-- Chat Input -->
            <div class="p-8 bg-white/5">
                <form action="messages" method="POST" class="flex items-center gap-4">
                    <input type="hidden" name="action" value="reply">
                    <input type="hidden" name="messageId" value="<%= selectedMessage.getId() %>">
                    <div class="flex-1 relative">
                        <input type="text" name="replyText" required placeholder="Type your reply..." class="w-full bg-white/5 border border-white/10 rounded-2xl px-6 py-4 text-sm text-white focus:border-[#C5A059] outline-none transition-all">
                        <button type="submit" class="absolute right-4 top-1/2 -translate-y-1/2 w-10 h-10 rounded-xl bg-[#C5A059] text-primary flex items-center justify-center shadow-lg hover:scale-110 transition-all">
                            <span class="material-icons text-sm">send</span>
                        </button>
                    </div>
                </form>
            </div>
            <% } else { %>
            <div class="flex-1 flex flex-col items-center justify-center text-white/20">
                <span class="material-icons text-6xl mb-4">forum</span>
                <p class="text-sm font-serif italic">Select a conversation to start chatting</p>
            </div>
            <% } %>
        </div>
    </div>
</section>

<jsp:include page="../includes/footer.jsp" />
</body>
</html>
