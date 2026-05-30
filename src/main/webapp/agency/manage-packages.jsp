<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.yatraconnect.model.HamroAgent, com.yatraconnect.model.Listing, java.util.List" %>
<% 
    HamroAgent agent = (HamroAgent) session.getAttribute("user"); 
    if (agent == null || !"agent".equals(session.getAttribute("role"))) { 
        response.sendRedirect(request.getContextPath() + "/login.jsp"); 
        return; 
    } 
    List<Listing> listings = (List<Listing>) request.getAttribute("packages");
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
%>
                <jsp:include page="../includes/header.jsp" />
                <jsp:include page="../includes/navbar.jsp" />


                <section class="min-h-screen bg-[#07203B] pt-32 pb-20 px-4 md:px-8">
                    <div class="max-w-7xl mx-auto">
                        <!-- Page Header -->
                        <div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12 fade-in-up">
                            <div class="space-y-4">
                                <div class="flex items-center gap-2 text-accent">
                                    <a href="dashboard"
                                        class="text-[10px] font-bold uppercase tracking-[0.2em] hover:text-white transition-all no-underline">Dashboard</a>
                                    <span class="material-icons text-xs">chevron_right</span>
                                    <span class="text-[10px] font-bold uppercase tracking-[0.2em] text-white/40">Manage
                                        Packages</span>
                                </div>
                                <h1 class="text-4xl md:text-5xl font-serif font-bold text-white leading-tight">My <span
                                        class="italic text-accent">Experiences</span></h1>
                                <p class="text-white/50 font-light max-w-xl">Curate and manage your exclusive Himalayan
                                    travel offerings and luxury hotel listings.</p>
                            </div>

                            <button onclick="document.getElementById('addPackageModal').classList.remove('hidden')"
                                class="px-8 py-4 bg-accent text-primary-dark rounded-2xl text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all shadow-xl shadow-accent/20 flex items-center gap-2">
                                <span class="material-icons text-sm font-bold">add</span>
                                Create New Package
                            </button>
                        </div>

                        <% if (successMessage !=null) { %>
                            <div
                                class="mb-8 p-4 bg-green-500/10 border border-green-500/20 rounded-2xl text-green-400 text-xs font-bold uppercase tracking-widest text-center">
                                <%= successMessage %>
                            </div>
                            <% } %>
                                <% if (errorMessage !=null) { %>
                                    <div
                                        class="mb-8 p-4 bg-red-500/10 border border-red-500/20 rounded-2xl text-red-400 text-xs font-bold uppercase tracking-widest text-center">
                                        <%= errorMessage %>
                                    </div>
                                    <% } %>

                                        <!-- Filters & Search -->
                                        <div
                                            class="flex flex-wrap items-center justify-between gap-6 mb-12 fade-in-up-delay-1">
                                            <div class="flex items-center gap-6">
                                                <div class="flex items-center gap-3">
                                                    <button
                                                        class="text-accent border-b-2 border-accent pb-1 text-[10px] font-black uppercase tracking-widest">Active
                                                        (12)</button>
                                                    <button
                                                        class="text-white/40 hover:text-white transition-colors pb-1 text-[10px] font-black uppercase tracking-widest">Drafts
                                                        (02)</button>
                                                    <button
                                                        class="text-white/40 hover:text-white transition-colors pb-1 text-[10px] font-black uppercase tracking-widest">Archive</button>
                                                </div>
                                            </div>

                                            <div class="flex items-center gap-4 w-full md:w-auto">
                                                <div class="relative flex-1 md:w-64">
                                                    <span
                                                        class="material-icons absolute left-4 top-1/2 -translate-y-1/2 text-white/30 text-sm">search</span>
                                                    <input type="text" placeholder="Search packages..."
                                                        class="w-full bg-white/5 border border-white/10 rounded-xl py-3 pl-12 pr-4 text-xs text-white focus:outline-none focus:border-accent transition-all">
                                                </div>
                                                <button
                                                    class="w-12 h-12 flex items-center justify-center bg-white/5 border border-white/10 rounded-xl text-white/60 hover:text-white transition-all">
                                                    <span class="material-icons text-sm">tune</span>
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Packages Grid -->
                                        <div
                                            class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 fade-in-up-delay-2">
                                            <% 
                                            if (listings != null && !listings.isEmpty()) { 
                                                for (Listing listing : listings) { 
                                                    String imageUrl="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80&w=800"; 
                                                    if (listing.getImages() != null && !listing.getImages().isEmpty() && !listing.getImages().equals("[]")) {
                                                        imageUrl = listing.getImages().replace("[", "").replace("]", "").replace("\"", "").split(",")[0]; 
                                                    } 
                                            %>
                                                <div
                                                    class="group bg-white/[0.03] border border-white/10 rounded-[2.5rem] overflow-hidden backdrop-blur-xl hover:border-accent/30 transition-all duration-500 shadow-2xl">
                                                    <div class="relative h-64 overflow-hidden">
                                                        <img src="<%= imageUrl %>"
                                                            class="w-full h-full object-cover group-hover:scale-110 transition-all duration-700"
                                                            alt="<%= listing.getTitle() %>">
                                                        <div
                                                            class="absolute inset-0 bg-gradient-to-t from-[#07203B] via-transparent to-transparent opacity-60">
                                                        </div>
                                                        <div class="absolute top-6 left-6">
                                                            <span
                                                                class="px-3 py-1 rounded-full bg-accent text-primary-dark text-[9px] font-black uppercase tracking-widest">
                                                                <%= listing.getType() %>
                                                            </span>
                                                        </div>
                                                        <div class="absolute top-6 right-6 flex gap-2">
                                                            <button
                                                                class="w-10 h-10 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white flex items-center justify-center hover:bg-white hover:text-primary-dark transition-all">
                                                                <span class="material-icons text-sm">edit</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="p-8">
                                                        <div class="flex items-center justify-between mb-3">
                                                            <span class="text-accent font-bold text-lg">$<%=
                                                                    listing.getPrice() %></span>
                                                            <div class="flex items-center gap-1 text-cyan-400">
                                                                <span class="material-icons text-[10px]">star</span>
                                                                <span
                                                                    class="text-[10px] font-bold uppercase tracking-tighter">
                                                                    <%= listing.getAvgRating() %> (<%=
                                                                            listing.getReviewCount() %>)
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <h3 class="text-xl font-serif font-bold text-white mb-2">
                                                            <%= listing.getTitle() %>
                                                        </h3>
                                                        <p class="text-white/40 text-xs font-light line-clamp-2 mb-6">
                                                            <%= listing.getDescription() %>
                                                        </p>

                                                        <div
                                                            class="flex items-center justify-between pt-6 border-t border-white/5">
                                                            <div class="flex items-center gap-2">
                                                                <div class="w-2 h-2 rounded-full <%= listing.isActive() ? "bg-cyan-400 shadow-[0_0_8px_#22d3ee]" : "bg-white/10" %>"></div>
                                                                <span
                                                                    class="text-[10px] font-black text-white/60 uppercase tracking-widest">
                                                                    <%= listing.isActive() ? "Active" : "Inactive" %>
                                                                </span>
                                                            </div>
                                                            <div class="flex items-center gap-4">
                                                                <form
                                                                    action="${pageContext.request.contextPath}/agency/packages/"
                                                                    method="POST" class="m-0"
                                                                    onsubmit="return confirm('Are you sure you want to delete this package?');">
                                                                    <input type="hidden" name="action" value="delete">
                                                                    <input type="hidden" name="packageId"
                                                                        value="<%= listing.getId() %>">
                                                                    <button type="submit"
                                                                        class="text-white/30 hover:text-red-400 transition-colors">
                                                                        <span
                                                                            class="material-icons text-sm">delete_outline</span>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% } } else { %>
                                                    <!-- Empty State -->
                                                    <div
                                                        class="col-span-full flex flex-col items-center justify-center py-40">
                                                        <div
                                                            class="w-24 h-24 rounded-full bg-white/5 flex items-center justify-center text-white/20 mb-8">
                                                            <span class="material-icons text-5xl">inventory_2</span>
                                                        </div>
                                                        <h3 class="text-2xl font-serif font-bold text-white mb-2">No
                                                            Packages Yet</h3>
                                                        <p class="text-white/40 text-sm mb-8 text-center max-w-sm">
                                                            Launch your first elite experience and start reaching
                                                            thousands of travellers across Nepal.</p>
                                                    </div>
                                                    <% } %>
                                        </div>

                                        <!-- Add Package Modal -->
                                        <div id="addPackageModal"
                                            class="fixed inset-0 z-[150] flex items-center justify-center px-4 hidden">
                                            <div class="absolute inset-0 bg-[#07203B]/90 backdrop-blur-md"
                                                onclick="this.parentElement.classList.add('hidden')"></div>
                                            <div
                                                class="bg-[#0A1A2F] border border-white/10 rounded-[3rem] w-full max-w-4xl relative z-10 overflow-hidden shadow-[0_50px_100px_-20px_rgba(0,0,0,0.5)] fade-in-up">

                                                <!-- Modal Header -->
                                                <div
                                                    class="px-12 py-10 bg-white/[0.02] border-b border-white/5 flex items-center justify-between">
                                                    <div>
                                                        <h3
                                                            class="text-3xl font-serif font-bold text-white leading-none mb-3">
                                                            Launch <span class="text-accent italic">New
                                                                Experience</span></h3>
                                                        <p
                                                            class="text-white/40 text-[10px] font-black uppercase tracking-[0.3em]">
                                                            Configure elite Himalayan travel offerings</p>
                                                    </div>
                                                    <button
                                                        onclick="document.getElementById('addPackageModal').classList.add('hidden')"
                                                        class="w-12 h-12 rounded-full bg-white/5 flex items-center justify-center text-white/40 hover:text-white transition-all">
                                                        <span class="material-icons">close</span>
                                                    </button>
                                                </div>

                                                <form action="${pageContext.request.contextPath}/agency/packages/"
                                                    method="POST" class="max-h-[70vh] overflow-y-auto custom-scrollbar">
                                                    <input type="hidden" name="action" value="add">

                                                    <div class="p-12 space-y-12">
                                                        <!-- Section 1: Basic Information -->
                                                        <div class="space-y-8">
                                                            <div class="flex items-center gap-4">
                                                                <span
                                                                    class="w-8 h-8 rounded-lg bg-accent/20 flex items-center justify-center text-accent text-xs font-bold">01</span>
                                                                <h4
                                                                    class="text-white font-serif font-bold text-xl uppercase tracking-wider">
                                                                    Basic Information</h4>
                                                            </div>

                                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                                                <div class="md:col-span-2">
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Package
                                                                        Title</label>
                                                                    <input type="text" name="title" required
                                                                        placeholder="e.g. Everest Luxury Basecamp Expedition"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                                                                </div>
                                                                <div class="md:col-span-2">
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Detailed
                                                                        Description</label>
                                                                    <textarea name="description" rows="4" required
                                                                        placeholder="Describe the journey, emotions, and exclusive features..."
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all"></textarea>
                                                                </div>
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Experience
                                                                        Type</label>
                                                                    <select name="type" required
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all appearance-none cursor-pointer">
                                                                        <option value="trekking" class="bg-[#0A1A2F]">
                                                                            🏔️ Trekking Expedition</option>
                                                                        <option value="travel" class="bg-[#0A1A2F]">✈️
                                                                            Cultural Travel</option>
                                                                        <option value="hotel" class="bg-[#0A1A2F]">🏨
                                                                            Luxury Stay</option>
                                                                    </select>
                                                                </div>
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Base
                                                                        Price ($)</label>
                                                                    <input type="number" name="price" required
                                                                        placeholder="2499"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent focus:bg-white/[0.05] transition-all">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Section 2: Adventure Logistics -->
                                                        <div class="space-y-8">
                                                            <div class="flex items-center gap-4">
                                                                <span
                                                                    class="w-8 h-8 rounded-lg bg-cyan-400/20 flex items-center justify-center text-cyan-400 text-xs font-bold">02</span>
                                                                <h4
                                                                    class="text-white font-serif font-bold text-xl uppercase tracking-wider">
                                                                    Logistics & Difficulty</h4>
                                                            </div>

                                                            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Duration
                                                                        (Days)</label>
                                                                    <input type="number" name="duration" required
                                                                        placeholder="14"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Main
                                                                        Location</label>
                                                                    <input type="text" name="location" required
                                                                        placeholder="Solukhumbu"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Difficulty</label>
                                                                    <select name="difficulty"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all appearance-none cursor-pointer">
                                                                        <option value="easy" class="bg-[#0A1A2F]">Easy
                                                                        </option>
                                                                        <option value="moderate" class="bg-[#0A1A2F]">
                                                                            Moderate</option>
                                                                        <option value="hard" class="bg-[#0A1A2F]"
                                                                            selected>Hard / Challenging</option>
                                                                        <option value="extreme" class="bg-[#0A1A2F]">
                                                                            Extreme</option>
                                                                    </select>
                                                                </div>
                                                                <div class="md:col-span-2">
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Best
                                                                        Seasons</label>
                                                                    <input type="text" name="bestSeasons"
                                                                        placeholder="e.g. March - May, September - November"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Max
                                                                        Group Size</label>
                                                                    <input type="number" name="maxGroupSize"
                                                                        placeholder="12"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Section 3: Advanced Details -->
                                                        <div class="space-y-8 pb-4">
                                                            <div class="flex items-center gap-4">
                                                                <span
                                                                    class="w-8 h-8 rounded-lg bg-purple-500/20 flex items-center justify-center text-purple-400 text-xs font-bold">03</span>
                                                                <h4
                                                                    class="text-white font-serif font-bold text-xl uppercase tracking-wider">
                                                                    Advanced Specifications</h4>
                                                            </div>

                                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Amenities
                                                                        (Comma separated)</label>
                                                                    <input type="text" name="amenities"
                                                                        placeholder="Helicopter Rescue, Wifi, Private Guide"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                                <div>
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Minimum
                                                                        Age</label>
                                                                    <input type="number" name="minAge" placeholder="18"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                                <div class="md:col-span-2">
                                                                    <label
                                                                        class="block text-[10px] font-black text-white/30 uppercase tracking-[0.2em] mb-3 ml-1">Tags
                                                                        (For Search Optimization)</label>
                                                                    <input type="text" name="tags"
                                                                        placeholder="Mountaineering, Ultra-Luxury, Solitude"
                                                                        class="w-full bg-white/[0.03] border border-white/10 rounded-2xl px-6 py-4 text-white text-sm focus:outline-none focus:border-accent transition-all">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Sticky Modal Footer -->
                                                    <div
                                                        class="px-12 py-10 bg-white/[0.02] border-t border-white/5 flex gap-6">
                                                        <button type="button"
                                                            onclick="document.getElementById('addPackageModal').classList.add('hidden')"
                                                            class="flex-1 h-16 rounded-[1.25rem] border border-white/10 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-white/5 transition-all">
                                                            Cancel
                                                        </button>
                                                        <button type="submit"
                                                            class="flex-[2] h-16 bg-accent text-primary-dark rounded-[1.25rem] text-[11px] font-black uppercase tracking-[0.2em] hover:bg-white hover:scale-[1.02] active:scale-[0.98] transition-all shadow-2xl shadow-accent/20">
                                                            Launch Elite Experience
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <!-- Empty State (Hidden) -->
                                        <div
                                            class="hidden col-span-full flex flex-col items-center justify-center py-40">
                                            <div
                                                class="w-24 h-24 rounded-full bg-white/5 flex items-center justify-center text-white/20 mb-8">
                                                <span class="material-icons text-5xl">inventory_2</span>
                                            </div>
                                            <h3 class="text-2xl font-serif font-bold text-white mb-2">No Packages Yet
                                            </h3>
                                            <p class="text-white/40 text-sm mb-8 text-center max-w-sm">Launch your first
                                                elite experience and start reaching thousands of travellers across
                                                Nepal.</p>
                                            <button
                                                class="px-8 py-4 bg-accent text-primary-dark rounded-2xl text-[10px] font-black uppercase tracking-widest hover:bg-white hover:scale-105 transition-all">Create
                                                Package</button>
                                        </div>
                    </div>
                </section>

                <script>
                    // Auto-open modal if URL has ?action=add
                    window.addEventListener('load', () => {
                        const urlParams = new URLSearchParams(window.location.search);
                        if (urlParams.get('action') === 'add') {
                            document.getElementById('addPackageModal').classList.remove('hidden');
                        }
                    });
                </script>

                <jsp:include page="../includes/footer.jsp" />
                </body>

                </html>