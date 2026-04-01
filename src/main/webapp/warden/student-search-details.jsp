<%@ page import="model.Student" %>
<%
    Student student= (Student) session.getAttribute("search_student_details");
    String roomSpace= (String) (session.getAttribute("room_space"));
%>

<div class="bg-surface-container-lowest rounded-2xl shadow-lg p-6 md:p-8 relative overflow-hidden group">
    <!-- Decorative background -->
    <div class="absolute top-0 right-0 w-36 h-36 bg-primary/10 rounded-full -mr-20 -mt-20 transition-transform group-hover:scale-110"></div>

    <!-- Top Section: Profile Image + Basic Info -->
    <div class="flex flex-col md:flex-row items-center gap-6 relative z-10">
        <div class="relative w-28 h-28 md:w-32 md:h-32 rounded-xl overflow-hidden border-2 border-primary/10">
            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCHkkHbW3AzxAufTtWFiWXa1k_Lep1GFwYix4xLX50Uyc-2vxjnrQBMy-CUdia2SKWlzZmli2I51S2xizkUQvg-GeUZsUY1YGe1JRREsXD_pJlUxtPBZysFcayVW3Wg8P2-VCG9LlFfYGKaLicu0yCO-tbsiiA-q-TrjAA2mrddRKPC9i3_0e2cQLuh_boFLuIgfRcgdI-Ack9Mx4BAuSzwZXllFK7j28XovEfxarW6lMrU2RSjutNzBeSyWT-2yxYxSYyUDotTOVRF"
                 alt="Student Profile" class="w-full h-full object-cover"/>
        </div>
        <div class="text-center md:text-left space-y-2 md:flex-1">
            <span class="inline-block px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-[10px] font-bold tracking-widest uppercase">Active Resident</span>
            <h2 class="font-headline font-extrabold text-2xl md:text-3xl text-primary tracking-tight mt-1"><%=student.getName()%>
            </h2>
            <div class="flex flex-wrap justify-center md:justify-start gap-4 text-on-surface-variant font-medium mt-1">
                    <span class="flex items-center gap-1.5"><span
                            class="material-symbols-outlined text-sm">id_card</span> <%=student.getBranch()%></span>
                    <span class="flex items-center gap-1.5"><span
                        class="material-symbols-outlined text-sm">apartment</span> Room <%=student.getRoom_number()%></span>
                    <span class="flex items-center gap-1.5"><span
                        class="material-symbols-outlined text-sm">room</span><%=roomSpace%></span>
            </div>
        </div>
        <!-- Quick Stats -->
        <div class="bg-primary rounded-xl p-4 md:p-6 text-white flex flex-col justify-between items-center md:items-start relative overflow-hidden w-full md:w-48 mt-4 md:mt-0">
            <div class="absolute bottom-0 right-0 opacity-10">
                <span class="material-symbols-outlined text-[80px] translate-y-4 translate-x-4">school</span>
            </div>
            <div class="relative z-10">
                <p class="text-primary-fixed-dim text-sm font-medium">Occupancy Status</p>
                <h3 class="text-xl font-bold mt-1">Confirmed</h3>
            </div>
            <div class="mt-6 flex justify-between items-center w-full relative z-10">
                <div>
                    <p class="text-primary-fixed-dim text-[10px] font-bold uppercase tracking-wider">Fees Status</p>
                    <p class="text-lg font-bold">Paid</p>
                </div>
                <span class="material-symbols-outlined text-primary-fixed-dim"
                      style="font-variation-settings: 'FILL' 1;">check_circle</span>
            </div>
        </div>
    </div>

    <!-- Divider -->
    <hr class="my-6 border-outline-variant/50">

    <!-- Bottom Section: Contact & Allotment Info -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Personal Info -->
        <div class="space-y-4">
            <h3 class="flex items-center gap-2 font-headline font-bold text-lg text-on-surface">
                <span class="material-symbols-outlined text-primary">contact_mail</span>
                Personal & Contact
            </h3>
            <div class="bg-surface-container-low rounded-xl p-4 space-y-4">
                <div class="flex items-start gap-4">
                    <div class="p-3 bg-surface-container-low rounded-lg">
                        <span class="material-symbols-outlined text-secondary">mail</span>
                    </div>
                    <div>
                        <p class="text-on-surface-variant text-xs font-semibold uppercase tracking-wider">Email
                            Address</p>
                        <p class="text-on-surface font-medium mt-0.5"><%=student.getEmail()%>
                        </p>
                    </div>
                </div>
                <div class="flex items-start gap-4">
                    <div class="p-3 bg-surface-container-low rounded-lg">
                        <span class="material-symbols-outlined text-secondary">phone_iphone</span>
                    </div>
                    <div>
                        <p class="text-on-surface-variant text-xs font-semibold uppercase tracking-wider">Mobile
                            Number</p>
                        <p class="text-on-surface font-medium mt-0.5"><%=student.getPhone()%>
                        </p>
                    </div>
                </div>
                <div class="flex items-start gap-4">
                    <div class="p-3 bg-surface-container-low rounded-lg">
                        <span class="material-symbols-outlined text-secondary">history_edu</span>
                    </div>
                    <div>
                        <p class="text-on-surface-variant text-xs font-semibold uppercase tracking-wider">Academic
                            Path</p>
                        <p class="text-on-surface font-medium mt-0.5"><%=student.getCourse()%> <%=student.getBranch()%>
                            | <%=student.getYear()%>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hostel Info -->
        <div class="space-y-4">
            <h3 class="flex items-center gap-2 font-headline font-bold text-lg text-on-surface">
                <span class="material-symbols-outlined text-primary">other_houses</span>
                Current Allotment
            </h3>
            <div class="bg-surface-container-low rounded-xl p-4 space-y-4">
                <div class="flex items-start gap-4">
                    <div class="p-3 bg-surface-container-low rounded-lg">
                        <span class="material-symbols-outlined text-secondary">domain</span>
                    </div>
                    <div>
                        <p class="text-on-surface-variant text-xs font-semibold uppercase tracking-wider">Hostel
                            Block</p>
                        <p class="text-on-surface font-medium mt-0.5">Boys 5 : Top Floor</p>
                    </div>
                </div>
                <div class="flex items-start gap-4">
                    <div class="p-3 bg-surface-container-low rounded-lg">
                        <span class="material-symbols-outlined text-secondary">event_available</span>
                    </div>
                    <div>
                        <p class="text-on-surface-variant text-xs font-semibold uppercase tracking-wider">Allotment
                            Date</p>
                        <p class="text-on-surface font-medium mt-0.5"><%=student.getAllot_date()%>
                        </p>
                    </div>
                </div>
                <div class="flex items-start gap-4">
                    <div class="p-3 bg-surface-container-low rounded-lg">
                        <span class="material-symbols-outlined text-secondary">key</span>
                    </div>
                    <div>
                        <p class="text-on-surface-variant text-xs font-semibold uppercase tracking-wider">Access
                            Level</p>
                        <p class="text-on-surface font-medium mt-0.5">Type 1 - Standard Dormitory</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>