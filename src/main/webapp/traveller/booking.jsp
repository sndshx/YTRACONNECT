<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/navbar.jsp" />

<style>
    /* Premium Booking UI */
    .booking-bg {
        background-color: #07203B;
        background-image: radial-gradient(circle at top right, rgba(197,160,89,0.05) 0%, transparent 40%),
                          radial-gradient(circle at bottom left, rgba(13,59,102,0.5) 0%, transparent 40%);
    }

    .glass-box {
        background: rgba(255, 255, 255, 0.02);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: 1px solid rgba(255, 255, 255, 0.05);
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
    }

    /* Floating Label Inputs */
    .input-group { position: relative; margin-bottom: 1.5rem; }
    .form-input {
        width: 100%;
        background: rgba(0, 0, 0, 0.2);
        border: 1px solid rgba(255, 255, 255, 0.1);
        color: white;
        border-radius: 12px;
        padding: 24px 16px 8px 16px;
        font-size: 15px;
        outline: none;
        transition: all 0.3s ease;
    }
    .form-input:focus { border-color: #C5A059; background: rgba(197,160,89,0.05); box-shadow: 0 0 0 4px rgba(197,160,89,0.1); }
    .floating-label {
        position: absolute; left: 16px; top: 18px;
        color: rgba(255, 255, 255, 0.4); font-size: 15px;
        pointer-events: none; transition: all 0.2s ease;
    }
    .form-input:focus ~ .floating-label,
    .form-input:not(:placeholder-shown) ~ .floating-label {
        top: 8px; font-size: 11px; color: #C5A059; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em;
    }
    .form-input::placeholder { color: transparent; } /* Hide placeholder to use label */
    
    /* Select specifically needs placeholder shown hack */
    select.form-input { padding-top: 20px; appearance: none; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='white'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E"); background-repeat: no-repeat; background-position: right 16px center; }
    select.form-input ~ .floating-label { top: 8px; font-size: 11px; color: rgba(255,255,255,0.6); font-weight: 700; text-transform: uppercase; }
    select.form-input:focus ~ .floating-label { color: #C5A059; }

    /* Steps */
    .step-node {
        width: 36px; height: 36px; border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 14px; font-weight: 800; z-index: 10; position: relative;
        transition: all 0.3s ease;
    }
    .step-node.done { background: #C5A059; color: #07203B; box-shadow: 0 0 15px rgba(197,160,89,0.4); }
    .step-node.active { background: transparent; border: 2px solid #C5A059; color: #C5A059; box-shadow: 0 0 0 4px rgba(197,160,89,0.2); }
    .step-node.pending { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); color: rgba(255,255,255,0.3); }
    .step-connector { flex: 1; height: 2px; background: rgba(255,255,255,0.08); position: relative; }
    .step-connector.done::after { content: ''; position: absolute; left: 0; top: 0; height: 100%; width: 100%; background: #C5A059; animation: fillLine 0.5s ease forwards; }

    @keyframes fillLine { from{width:0} to{width:100%} }
    @keyframes checkPop { 0%{transform:scale(0) rotate(-45deg);opacity:0} 70%{transform:scale(1.2) rotate(10deg)} 100%{transform:scale(1) rotate(0);opacity:1} }
    .animate-check { animation: checkPop 0.6s cubic-bezier(0.34,1.56,0.64,1) forwards; }

</style>

<!-- Auth Guard -->
<script>
    fetch('../api/bookings/')
        .then(r => { if (r.status === 401) window.location.href = '../login.jsp?redirect=traveller/booking.jsp' + window.location.search; })
        .catch(() => {});
</script>

<div class="min-h-screen booking-bg pt-28 pb-20 font-display">
    <div class="max-w-6xl mx-auto px-4 relative z-10">

        <!-- Header & Breadcrumbs -->
        <div class="text-center mb-10 fade-in-up">
            <h1 class="font-serif text-4xl md:text-5xl text-white font-bold mb-3">Secure Checkout</h1>
            <p class="text-white/50 text-sm">Almost there! Complete your details to send a booking request.</p>
        </div>

        <!-- Progress Stepper -->
        <div class="max-w-2xl mx-auto mb-16 fade-in-up-delay-1">
            <div class="flex items-center justify-between relative">
                <!-- Connectors -->
                <div class="absolute left-0 top-1/2 -translate-y-1/2 w-full flex px-8 z-0">
                    <div class="step-connector done"></div>
                    <div class="step-connector done"></div>
                    <div class="step-connector"></div>
                </div>
                <!-- Nodes -->
                <div class="flex flex-col items-center gap-2 z-10 w-16">
                    <div class="step-node done"><span class="material-icons text-[18px]">search</span></div>
                    <span class="text-[10px] text-white/50 uppercase tracking-widest font-bold">Search</span>
                </div>
                <div class="flex flex-col items-center gap-2 z-10 w-16">
                    <div class="step-node done"><span class="material-icons text-[18px]">visibility</span></div>
                    <span class="text-[10px] text-white/50 uppercase tracking-widest font-bold">Review</span>
                </div>
                <div class="flex flex-col items-center gap-2 z-10 w-16">
                    <div class="step-node active">3</div>
                    <span class="text-[10px] text-[#C5A059] uppercase tracking-widest font-bold">Details</span>
                </div>
                <div class="flex flex-col items-center gap-2 z-10 w-16">
                    <div class="step-node pending"><span class="material-icons text-[18px]">check</span></div>
                    <span class="text-[10px] text-white/30 uppercase tracking-widest font-bold">Done</span>
                </div>
            </div>
        </div>

        <!-- Main Layout -->
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-10">

            <!-- LEFT: Booking Form -->
            <div class="lg:col-span-7 fade-in-up-delay-2">
                
                <div id="error-banner" class="hidden glass-box border-red-500/30 bg-red-500/10 rounded-2xl p-4 mb-6 flex items-start gap-3">
                    <span class="material-icons text-red-400">error</span>
                    <div class="text-sm">
                        <p class="text-red-400 font-bold mb-0.5">Booking Failed</p>
                        <p id="error-msg" class="text-red-400/80">Please check your details and try again.</p>
                    </div>
                </div>

                <form id="booking-form" onsubmit="submitBooking(event)">
                    <!-- Hidden Fields -->
                    <input type="hidden" id="f-listingId" name="listingId">
                    <input type="hidden" id="f-agentId" name="agentId">
                    <input type="hidden" id="f-totalAmount" name="totalAmount">
                    <input type="hidden" id="f-bookingType" name="bookingType" value="package">

                    <!-- Section 1: Contact Info -->
                    <div class="glass-box rounded-3xl p-8 mb-6 relative overflow-hidden">
                        <div class="absolute top-0 left-0 w-1 h-full bg-[#C5A059]"></div>
                        <h2 class="text-white font-serif text-2xl mb-6 flex items-center gap-3">
                            <span class="w-8 h-8 rounded-full bg-[#C5A059]/10 flex items-center justify-center text-[#C5A059]"><span class="material-icons text-sm">person</span></span>
                            Contact Details
                        </h2>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4">
                            <div class="input-group md:col-span-2">
                                <input type="text" name="guestName" id="f-guestName" class="form-input" placeholder=" " required>
                                <label class="floating-label">Full Legal Name</label>
                            </div>
                            <div class="input-group">
                                <input type="email" name="guestEmail" id="f-guestEmail" class="form-input" placeholder=" " required>
                                <label class="floating-label">Email Address</label>
                            </div>
                            <div class="input-group">
                                <input type="tel" name="guestPhone" id="f-guestPhone" class="form-input" placeholder=" ">
                                <label class="floating-label">Phone Number (Optional)</label>
                            </div>
                        </div>
                    </div>

                    <!-- Section 2: Trip Details -->
                    <div class="glass-box rounded-3xl p-8 mb-6 relative overflow-hidden">
                        <div class="absolute top-0 left-0 w-1 h-full bg-[#C5A059]"></div>
                        <h2 class="text-white font-serif text-2xl mb-6 flex items-center gap-3">
                            <span class="w-8 h-8 rounded-full bg-[#C5A059]/10 flex items-center justify-center text-[#C5A059]"><span class="material-icons text-sm">event</span></span>
                            Trip Specifics
                        </h2>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4">
                            <div class="input-group md:col-span-2">
                                <input type="number" name="roomCount" id="f-travellers" class="form-input" placeholder=" " min="1" max="50" value="1" required>
                                <label class="floating-label">Number of Travellers</label>
                            </div>
                            <div class="input-group">
                                <input type="date" name="startDate" id="f-startDate" class="form-input" placeholder=" " required>
                                <label class="floating-label">Preferred Start Date</label>
                            </div>
                            <div class="input-group">
                                <input type="date" name="endDate" id="f-endDate" class="form-input" placeholder=" ">
                                <label class="floating-label">Expected End Date</label>
                            </div>
                        </div>
                    </div>

                    <!-- Section 3: Verification & Extras -->
                    <div class="glass-box rounded-3xl p-8 mb-8 relative overflow-hidden">
                        <div class="absolute top-0 left-0 w-1 h-full bg-[#C5A059]"></div>
                        <h2 class="text-white font-serif text-2xl mb-6 flex items-center gap-3">
                            <span class="w-8 h-8 rounded-full bg-[#C5A059]/10 flex items-center justify-center text-[#C5A059]"><span class="material-icons text-sm">verified_user</span></span>
                            Verification & Requests
                        </h2>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4">
                            <div class="input-group">
                                <select name="idType" id="f-idType" class="form-input" required>
                                    <option value="" disabled selected></option>
                                    <option value="citizenship">Citizenship Card</option>
                                    <option value="passport">Passport</option>
                                    <option value="driving_license">Driving License</option>
                                </select>
                                <label class="floating-label">ID Document Type</label>
                            </div>
                            <div class="input-group">
                                <input type="text" name="idNumber" id="f-idNumber" class="form-input" placeholder=" " required>
                                <label class="floating-label">Document Number</label>
                            </div>
                            <div class="input-group md:col-span-2 mb-0">
                                <textarea name="notes" id="f-notes" class="form-input h-28 resize-none" placeholder=" "></textarea>
                                <label class="floating-label">Special Requests (Dietary, Medical, etc.)</label>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Area -->
                    <div class="text-center">
                        <button type="submit" id="submit-btn"
                            class="w-full bg-gradient-to-r from-[#C5A059] to-[#b8904f] hover:from-[#b8904f] hover:to-[#9a7840] text-[#07203B] font-bold text-lg tracking-wider uppercase py-5 rounded-2xl transition-all shadow-[0_10px_30px_rgba(197,160,89,0.3)] hover:shadow-[0_15px_40px_rgba(197,160,89,0.5)] transform hover:-translate-y-1 flex items-center justify-center gap-2 group">
                            Confirm Booking Request
                            <span class="material-icons group-hover:translate-x-1 transition-transform">arrow_forward</span>
                        </button>
                        <p class="text-white/40 text-xs mt-4 flex items-center justify-center gap-1">
                            <span class="material-icons text-sm">lock</span> Secure processing. Agency will review within 24 hours.
                        </p>
                    </div>
                </form>
            </div>

            <!-- RIGHT: Receipt Card -->
            <div class="lg:col-span-5 fade-in-up-delay-2">
                <div class="glass-box rounded-3xl p-1 sticky top-28">
                    <!-- Inner receipt -->
                    <div class="bg-[#0A1A2F]/80 rounded-[22px] overflow-hidden">
                        
                        <!-- Image Header -->
                        <div class="relative h-48">
                            <img id="pkg-img" src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?q=80" alt="Package" class="w-full h-full object-cover">
                            <div class="absolute inset-0 bg-gradient-to-t from-[#0A1A2F] to-transparent"></div>
                            <div class="absolute bottom-4 left-5 right-5">
                                <span id="pkg-type-badge" class="inline-block px-2 py-1 rounded bg-white/20 backdrop-blur-md text-white text-[10px] font-bold uppercase tracking-widest mb-2">Package</span>
                                <h3 id="pkg-title-card" class="text-white font-serif text-xl font-bold leading-tight">Loading...</h3>
                            </div>
                        </div>

                        <!-- Details -->
                        <div class="p-6">
                            <p class="text-white/50 text-xs uppercase tracking-widest font-bold mb-4 flex items-center gap-1 border-b border-white/5 pb-4">
                                <span class="material-icons text-[#C5A059] text-sm">storefront</span> <span id="pkg-agency-card">Agency Partner</span>
                            </p>

                            <div class="space-y-4 mb-6">
                                <div class="flex justify-between items-center text-sm">
                                    <span class="text-white/60">Price per person</span>
                                    <span id="price-per" class="text-white font-medium">NPR 0</span>
                                </div>
                                <div class="flex justify-between items-center text-sm">
                                    <span class="text-white/60">Travellers</span>
                                    <span class="text-white font-medium flex items-center gap-2">
                                        <span class="material-icons text-white/30 text-sm">close</span> <span id="travellers-count">1</span>
                                    </span>
                                </div>
                            </div>

                            <!-- Total -->
                            <div class="border-t border-dashed border-white/20 pt-4 mb-6">
                                <div class="flex justify-between items-end">
                                    <div>
                                        <p class="text-white font-bold text-lg">Total Amount</p>
                                        <p class="text-white/40 text-[10px] uppercase tracking-widest">Taxes included</p>
                                    </div>
                                    <span id="est-total" class="text-[#C5A059] font-bold text-2xl">NPR 0</span>
                                </div>
                            </div>

                            <!-- Info Box -->
                            <div class="bg-[#C5A059]/10 rounded-xl p-4 flex gap-3">
                                <span class="material-icons text-[#C5A059]">info</span>
                                <p class="text-[#C5A059]/80 text-xs leading-relaxed">
                                    No payment is required right now. The agency will contact you to confirm dates and arrange payment.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Premium Success Modal -->
<div id="success-modal" class="fixed inset-0 bg-[#07203B]/90 backdrop-blur-md z-50 hidden flex-col items-center justify-center p-4 opacity-0 transition-opacity duration-500">
    <div class="bg-[#0A1A2F] border border-white/10 rounded-3xl p-10 max-w-lg w-full text-center shadow-[0_20px_50px_rgba(0,0,0,0.5)] transform scale-95 transition-transform duration-500" id="success-card">
        
        <div class="w-24 h-24 bg-gradient-to-tr from-emerald-500 to-emerald-300 rounded-full flex items-center justify-center mx-auto mb-6 shadow-[0_0_30px_rgba(16,185,129,0.3)]">
            <span class="material-icons text-5xl text-white animate-check">check</span>
        </div>
        
        <h2 class="font-serif text-4xl text-white font-bold mb-3">Booking Requested!</h2>
        <p class="text-white/60 text-base mb-6">Your request has been securely sent to the agency.</p>
        
        <div class="bg-white/5 rounded-2xl p-4 mb-8 inline-flex items-center gap-3 border border-white/5">
            <div class="w-10 h-10 rounded-full bg-yellow-500/20 flex items-center justify-center text-yellow-500">
                <span class="material-icons text-xl">hourglass_empty</span>
            </div>
            <div class="text-left">
                <p class="text-white text-sm font-bold">Status: Pending Review</p>
                <p class="text-white/40 text-xs">Expect a response within 24 hours</p>
            </div>
        </div>
        
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="my-bookings.jsp" class="bg-gradient-to-r from-[#C5A059] to-[#b8904f] text-[#07203B] font-bold text-sm uppercase tracking-widest px-8 py-4 rounded-xl shadow-lg hover:shadow-[#C5A059]/30 transition-shadow">
                Go to Dashboard
            </a>
            <a href="../packages.jsp" class="bg-white/5 text-white hover:bg-white/10 font-bold text-sm uppercase tracking-widest px-8 py-4 rounded-xl border border-white/10 transition-colors">
                Explore More
            </a>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />

<script>
    // URL Params
    const params = new URLSearchParams(window.location.search);
    const listingId   = params.get('listingId') || '';
    const agentId     = params.get('agentId')   || '';
    const title       = params.get('title')     || 'Selected Package';
    const priceRaw    = parseFloat(params.get('price') || '0');
    const pkgType     = params.get('type')      || 'travel';
    const agencyName  = params.get('agency')    || 'YatraConnect Partner';

    // Populate Hidden Fields
    document.getElementById('f-listingId').value = listingId;
    document.getElementById('f-agentId').value   = agentId;
    document.getElementById('f-bookingType').value = pkgType;

    // Populate Receipt
    document.getElementById('pkg-title-card').textContent = title;
    document.getElementById('pkg-agency-card').textContent = agencyName;
    document.getElementById('pkg-type-badge').textContent = pkgType;

    // Fetch Hero Image
    if (listingId) {
        fetch('../api/listings/' + listingId)
            .then(r => r.ok ? r.json() : null)
            .then(pkg => {
                if (pkg && pkg.images) {
                    try {
                        const imgs = JSON.parse(pkg.images);
                        if (imgs && imgs[0]) document.getElementById('pkg-img').src = imgs[0];
                    } catch(e) {}
                }
            }).catch(()=>{});
    }

    // Dynamic Price Logic
    function formatNPR(val) { return val ? 'NPR ' + Number(val).toLocaleString('en-IN') : 'Contact Agency'; }
    document.getElementById('price-per').textContent = formatNPR(priceRaw);
    document.getElementById('f-totalAmount').value = priceRaw || 0;

    const travellerInput = document.getElementById('f-travellers');
    function updateTotal() {
        const count = parseInt(travellerInput.value) || 1;
        document.getElementById('travellers-count').textContent = count;
        const total = priceRaw * count;
        document.getElementById('est-total').textContent = formatNPR(total);
        document.getElementById('f-totalAmount').value = total;
    }
    travellerInput.addEventListener('input', updateTotal);
    updateTotal();

    // Date Logic
    const today = new Date().toISOString().split('T')[0];
    const startInput = document.getElementById('f-startDate');
    const endInput = document.getElementById('f-endDate');
    startInput.min = today;
    endInput.min = today;
    
    startInput.addEventListener('change', function() {
        endInput.min = this.value;
        if(endInput.value && endInput.value < this.value) endInput.value = this.value;
    });

    // Form Submission
    async function submitBooking(event) {
        event.preventDefault();

        const btn = document.getElementById('submit-btn');
        const errBanner = document.getElementById('error-banner');
        const errMsg = document.getElementById('error-msg');

        errBanner.classList.add('hidden');
        btn.disabled = true;
        const originalBtnHtml = btn.innerHTML;
        btn.innerHTML = `<span class="material-icons animate-spin">sync</span> Processing...`;

        const form = document.getElementById('booking-form');
        const formData = new FormData(form);
        const urlParams = new URLSearchParams();
        for (const [key, value] of formData.entries()) {
            urlParams.append(key, value);
        }

        try {
            const res = await fetch('../api/bookings/', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: urlParams.toString()
            });
            const json = await res.json();

            if (res.ok && json.success) {
                showSuccess();
            } else if (res.status === 401) {
                window.location.href = '../login.jsp?redirect=traveller/booking.jsp' + window.location.search;
            } else {
                throw new Error(json.error || 'Failed to submit booking.');
            }
        } catch(e) {
            errMsg.textContent = e.message || 'Network error. Please try again.';
            errBanner.classList.remove('hidden');
            btn.disabled = false;
            btn.innerHTML = originalBtnHtml;
            // Scroll to error
            window.scrollTo({top: 0, behavior: 'smooth'});
        }
    }

    function showSuccess() {
        const modal = document.getElementById('success-modal');
        const card = document.getElementById('success-card');
        
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        
        // Trigger animations
        setTimeout(() => {
            modal.classList.remove('opacity-0');
            card.classList.remove('scale-95');
        }, 10);
    }
</script>
</body>
</html>
