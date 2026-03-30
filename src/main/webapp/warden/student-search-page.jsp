<%@ page import="model.Student" %>
<%@ page import="static dao.ValidDetails.studentDetailsByPrn" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Student Details | Warden Portal</title>
    <!-- Fonts: Manrope & Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap"
          rel="stylesheet"/>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "surface-bright": "#f8f9fa",
                        "on-surface": "#191c1d",
                        "on-error": "#ffffff",
                        "tertiary-fixed": "#ffdbd0",
                        "tertiary-container": "#5c1800",
                        "background": "#f8f9fa",
                        "on-primary-fixed-variant": "#343d96",
                        "outline": "#767683",
                        "secondary-container": "#8a99fe",
                        "surface-container-low": "#f3f4f5",
                        "surface-container-highest": "#e1e3e4",
                        "error": "#ba1a1a",
                        "tertiary-fixed-dim": "#ffb59d",
                        "on-tertiary-fixed": "#390c00",
                        "primary-fixed": "#e0e0ff",
                        "surface-tint": "#4c56af",
                        "on-secondary-fixed-variant": "#2d3c9c",
                        "on-secondary-container": "#1b2b8c",
                        "primary-container": "#1a237e",
                        "surface-dim": "#d9dadb",
                        "surface-container": "#edeeef",
                        "secondary-fixed": "#dfe0ff",
                        "on-tertiary-fixed-variant": "#7b2e12",
                        "primary": "#000666",
                        "inverse-surface": "#2e3132",
                        "on-secondary": "#ffffff",
                        "on-error-container": "#93000a",
                        "primary-fixed-dim": "#bdc2ff",
                        "inverse-on-surface": "#f0f1f2",
                        "on-secondary-fixed": "#000d5f",
                        "on-primary-container": "#8690ee",
                        "surface-container-lowest": "#ffffff",
                        "on-tertiary-container": "#e17c5a",
                        "inverse-primary": "#bdc2ff",
                        "outline-variant": "#c6c5d4",
                        "on-surface-variant": "#454652",
                        "secondary-fixed-dim": "#bbc3ff",
                        "secondary": "#4755b6",
                        "on-tertiary": "#ffffff",
                        "on-primary-fixed": "#000767",
                        "tertiary": "#380b00",
                        "on-primary": "#ffffff",
                        "surface-variant": "#e1e3e4",
                        "on-background": "#191c1d",
                        "error-container": "#ffdad6",
                        "surface-container-high": "#e7e8e9",
                        "surface": "#f8f9fa"
                    },
                    fontFamily: {
                        "headline": ["Manrope"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .glass-panel {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }
    </style>
    <style>
        body {
            min-height: max(884px, 100dvh);
        }
    </style>
</head>
<body class="bg-surface-bright font-body text-on-surface antialiased min-h-screen pb-32">
<!-- Search Form -->
<section class="max-w-3xl mx-auto mt-8 px-4 sm:px-6 lg:px-8">
    <form id="search-student-form"
          class="flex flex-col sm:flex-row items-center gap-4 bg-surface-container-lowest p-4 sm:p-6 rounded-xl shadow-sm">
        <div class="relative flex-1 w-full">
            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant">search</span>
            <input
                    type="text"
                    placeholder="Enter PRN"
                    name="prn"
                    class="w-full pl-10 pr-4 py-2 sm:py-3 rounded-lg border border-outline-variant focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all text-on-surface"
            />
        </div>
        <button type="submit"
                class="bg-primary text-on-primary px-6 py-2 sm:py-3 rounded-lg font-semibold tracking-wide hover:bg-primary-container transition-colors w-full sm:w-auto">
            Search Student
        </button>
    </form>

    <!-- Error Message -->
    <div style="display: none" id="search-student-error-message" class="mt-4 text-center">
        <h3 class="inline-flex items-center justify-center gap-2 bg-error-container text-on-error-container px-4 py-2 rounded-lg font-bold shadow-sm">
            <span class="material-symbols-outlined">error</span>
            Student Not Found
        </h3>
    </div>
</section>

<main id="search-student-main-section" style="display: none" class="max-w-4xl mx-auto px-4 pt-8">
    <!-- Unified Student Card -->
    <%
        Student student= (Student) session.getAttribute("search_student_details");
        if(student!=null){
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
                            <p class="text-on-surface font-medium mt-0.5">Einstein Hall (Block B)</p>
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
    <%
        }
    %>
</main>


</body>
<script>
    const contextPath = "<%= request.getContextPath() %>";
</script>
<script src="${pageContext.request.contextPath}/warden/js/search-student.js"></script>
</html>