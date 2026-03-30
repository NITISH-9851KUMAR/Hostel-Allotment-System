<%@ page import="model.Student" %>
<%@ page import="java.util.List" %>
<%@include file="modal-code.jsp" %>
<%@ page isErrorPage="true" %>
<%@ page errorPage="/student/student-error-page.jsp" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html><html class="light" lang="en"><head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>B5 Hostel</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
      rel="stylesheet">
<script id="tailwind-config">
    tailwind.config = {
        darkMode: "class",
        theme: {
            extend: {
                colors: {
                    "on-primary-fixed-variant": "#343d96",
                    "on-tertiary-fixed": "#390c00",
                    "primary": "#000666",
                    "on-tertiary-fixed-variant": "#7b2e12",
                    "secondary-container": "#8a99fe",
                    "on-tertiary": "#ffffff",
                    "tertiary": "#380b00",
                    "on-primary-container": "#8690ee",
                    "on-primary-fixed": "#000767",
                    "inverse-primary": "#bdc2ff",
                    "surface-tint": "#4c56af",
                    "error": "#ba1a1a",
                    "surface-bright": "#f8f9fa",
                    "primary-fixed": "#e0e0ff",
                    "error-container": "#ffdad6",
                    "inverse-surface": "#2e3132",
                    "inverse-on-surface": "#f0f1f2",
                    "on-surface-variant": "#454652",
                    "on-secondary-fixed-variant": "#2d3c9c",
                    "outline-variant": "#c6c5d4",
                    "surface-dim": "#d9dadb",
                    "secondary-fixed": "#dfe0ff",
                    "surface-container-low": "#f3f4f5",
                    "on-error-container": "#93000a",
                    "secondary-fixed-dim": "#bbc3ff",
                    "on-secondary-container": "#1b2b8c",
                    "on-surface": "#191c1d",
                    "surface-variant": "#e1e3e4",
                    "on-error": "#ffffff",
                    "surface-container-high": "#e7e8e9",
                    "on-primary": "#ffffff",
                    "on-secondary-fixed": "#000d5f",
                    "on-background": "#191c1d",
                    "surface-container": "#edeeef",
                    "surface-container-highest": "#e1e3e4",
                    "background": "#f8f9fa",
                    "primary-fixed-dim": "#bdc2ff",
                    "outline": "#767683",
                    "tertiary-fixed-dim": "#ffb59d",
                    "on-secondary": "#ffffff",
                    "primary-container": "#1a237e",
                    "tertiary-fixed": "#ffdbd0",
                    "tertiary-container": "#5c1800",
                    "on-tertiary-container": "#e17c5a",
                    "surface": "#f8f9fa",
                    "secondary": "#4755b6",
                    "surface-container-lowest": "#ffffff"
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

    .glass-card {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
    }

    .primary-gradient {
        background: linear-gradient(135deg, #000666 0%, #4755b6 100%);
    }
</style>
<style>
    body {
        min-height: max(884px, 100dvh);
    }
</style>

<%
    List<Student> studentList = (List<Student>) session.getAttribute("student_roommate_list");
    Student student = (Student) session.getAttribute("current_login_student");
    int room_space = 0;
    for (Student st : studentList) {
        room_space++;
    }
    room_space++;
    String room_space_msg;
    if (room_space == 8) {
        room_space_msg = "full";
    } else {
        room_space_msg = String.valueOf(8 - room_space);
    }
%>


</head>
<body class="bg-surface font-body text-on-surface min-h-screen pb-24 md:pb-0">
<!-- TopAppBar -->
<header class="w-full top-0 sticky z-50 bg-[#f8f9fa] dark:bg-slate-950">
    <div class="flex justify-between items-center px-6 py-4 max-w-7xl mx-auto">
        <div class="flex items-center gap-3">
            <span class="material-symbols-outlined text-[#1A237E] dark:text-blue-400 text-3xl" data-icon="school"
                  style="">school</span>
            <h1 class="font-['Manrope'] font-bold tracking-tight text-2xl text-[#1A237E] dark:text-blue-400" style="">
                Sandip University</h1>
        </div>
        <div class="hidden md:flex items-center gap-8">
            <button id="logout-student"
                    class="flex items-center gap-2 text-slate-500 hover:text-red-500 transition-colors active:scale-95">
                <span class="material-symbols-outlined">logout</span>
                <span class="font-semibold">Logout</span>
            </button>
        </div>
        <button class="md:hidden text-slate-500" style="">
            <span class="material-symbols-outlined" data-icon="menu" style="">menu</span>
        </button>
    </div>
</header>
<main class="max-w-7xl mx-auto px-6 py-8 space-y-8">
    <!-- Welcome Section -->
    <section class="relative overflow-hidden rounded-xl p-8 primary-gradient text-white shadow-lg">
        <div class="relative z-10 flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div>
                <h2 class="font-headline text-3xl md:text-4xl font-extrabold tracking-tight" style="">
                    Welcome,<%=student.getName()%>
                </h2>
                <p class="mt-2 text-primary-fixed-dim font-medium tracking-wide opacity-90" style="">
                    PRN: <%=student.getPrn()%>
                </p>
            </div>
            <div class="flex items-center gap-4 bg-white/10 backdrop-blur-md p-4 rounded-xl border border-white/10">
                <div class="p-3 bg-secondary-container rounded-lg text-on-secondary-container">
                    <span class="material-symbols-outlined" data-icon="notifications_active" style="">notifications_active</span>
                </div>
                <div>
                    <p class="text-xs font-semibold uppercase tracking-wider opacity-70" style="">Warden Contact</p>
                    <p class="font-bold" style="">Meet @ 6 PM, R-412</p>
                </div>
            </div>
        </div>
        <!-- Decorative Element -->
        <div class="absolute -right-12 -bottom-12 w-64 h-64 bg-white/5 rounded-full blur-3xl"></div>
    </section>
    <!-- Bento Grid Layout -->
    <div class="grid grid-cols-1 md:grid-cols-12 gap-6">
        <!-- Profile Card -->
        <div class="md:col-span-5 lg:col-span-4 bg-surface-container-lowest rounded-xl p-6 shadow-[0_-10px_30px_rgba(26,35,126,0.02)] transition-all hover:shadow-md border border-outline-variant/10">
            <div class="flex items-center justify-between mb-8">
                <h3 class="font-headline text-xl font-bold text-primary" style="">Student Profile</h3>
            </div>
            <div class="flex flex-col items-center mb-8">
                <div class="relative w-24 h-24 rounded-full p-1 bg-gradient-to-tr from-primary to-secondary">
                    <img alt="Student Portrait" class="w-full h-full object-cover rounded-full border-2 border-white"
                         data-alt="Close up portrait of a young male student with a friendly expression in a modern bright setting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuBd6l8mEhlKtye9_rrXIo3YTZNg1VbrB1HnaWD6D4tqOTfK5_uGtuEkMXISbmK0VWgk7NBfM_UYp66OmgqrBKATSAJJi4zaLXqp6n8c_5sWvupQgKEalSJqR2cPgImiJKWix4ASfSqzKcnNLOMTcP3OdqndfCY4MmEm6tBi36C0rLb-hueU1-39Ghb_k_6mT57lnXKccnEHbcOjPIgmeZHP5RPEQIMGhAPP0e-Mes-oT_pS7Z1P_W7sK0uYfKfxAKJaKTidTGd5Y0_v"
                         style="">
                    <div class="absolute bottom-0 right-0 w-6 h-6 bg-green-500 border-2 border-white rounded-full"></div>
                </div>
                <h4 class="mt-4 font-headline text-lg font-bold" style=""><%=student.getName()%>
                </h4>
                <p class="text-sm text-outline" style=""><%=student.getCourse()%>(<%=student.getBranch()%>)</p>
            </div>
            <div class="space-y-5">
                <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-surface-container-low transition-colors">
                    <span class="material-symbols-outlined text-secondary" data-icon="mail" style="">mail</span>
                    <div>
                        <p class="text-xs text-outline font-medium" style="">Email Address</p>
                        <p class="text-sm font-semibold" style=""><%=student.getEmail()%>
                        </p>
                    </div>
                </div>
                <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-surface-container-low transition-colors">
                    <span class="material-symbols-outlined text-secondary" data-icon="phone_iphone" style="">phone_iphone</span>
                    <div>
                        <p class="text-xs text-outline font-medium" style="">Mobile Number</p>
                        <p class="text-sm font-semibold" style=""><%=student.getPhone()%>
                        </p>
                    </div>
                </div>
                <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-surface-container-low transition-colors">
                    <span class="material-symbols-outlined text-secondary" data-icon="history_edu"
                          style="">history_edu</span>
                    <div>
                        <p class="text-xs text-outline font-medium" style="">Academic Year</p>
                        <p class="text-sm font-semibold" style=""><%=student.getYear()%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Room Details & Roommates -->
        <div class="md:col-span-7 lg:col-span-8 space-y-6">
            <!-- Room Status Card -->
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                <div class="bg-surface-container-lowest p-6 rounded-xl border border-outline-variant/10 shadow-sm relative overflow-hidden group">
                    <div class="relative z-10">
                        <div class="flex items-center justify-between mb-4">
                            <span class="material-symbols-outlined text-3xl text-primary" data-icon="bed"
                                  style="">bed</span>
                            <span class="px-3 py-1 bg-primary-fixed text-on-primary-fixed text-[10px] font-bold uppercase tracking-widest rounded-full"
                                  style="">Allotted</span>
                        </div>
                        <p class="text-sm text-outline font-medium">Current Room</p>

                        <div class="flex items-center justify-between">

                            <h3 class="text-3xl font-headline font-extrabold text-primary">
                                <%=student.getRoom_number()%>
                            </h3>
                            <span class="text-sm font-semibold text-outline">
                                Space : <%=room_space_msg%>
                            </span>
                        </div>

                    </div>
                </div>
                <div class="bg-surface-container-lowest p-6 rounded-xl border border-outline-variant/10 shadow-sm relative overflow-hidden group">
                    <div class="relative z-10">
                        <div class="flex items-center justify-between mb-4">
                            <span class="material-symbols-outlined text-3xl text-secondary" data-icon="calendar_today"
                                  style="">calendar_today</span>
                            <span class="px-3 py-1 bg-secondary-fixed text-on-secondary-fixed text-[10px] font-bold uppercase tracking-widest rounded-full"
                                  style="">Active</span>
                        </div>
                        <p class="text-sm text-outline font-medium" style="">Allotment Date</p>
                        <h3 class="text-3xl font-headline font-extrabold text-primary"
                            style=""><%=student.getAllot_date()%>
                        </h3>
                    </div>
                </div>
            </div>
            <!-- Roommates Table -->
            <div class="bg-surface-container-lowest rounded-xl border border-outline-variant/10 shadow-sm overflow-hidden">
                <div class="p-6 border-b border-surface-container-low flex items-center justify-between">
                    <h3 class="font-headline text-xl font-bold text-primary" style="">Roommates</h3>
                    <div class="flex gap-2">
                        <span class="w-2 h-2 rounded-full bg-green-500"></span>
                        <span class="text-xs font-semibold text-outline"
                              style="">Current Capacity: <%=room_space%>/8</span>
                    </div>
                </div>
                <div class="overflow-x-auto">
                    <%--                    Table will only print when Room has atleast two student--%>
                    <%
                        if (room_space == 1) {
                    %>
                    <div class="w-full text-center py-12">
                        <p class="text-2xl font-bold text-primary">
                            You are currently the only student in this room.
                        </p>
                    </div>
                    <%
                    } else {
                    %>
                    <table class="w-full text-left">
                        <thead>
                        <tr class="bg-surface-container-low/50">
                            <th class="px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant">
                                Student Name
                            </th>
                            <th class="px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant">
                                Course
                            </th>
                            <th class="px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant text-center">
                                Allotment Date
                            </th>
                            <th class="px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant text-right">
                                Year
                            </th>
                        </tr>
                        </thead>

                        <tbody class="divide-y divide-outline-variant/5">
                        <%
                            for (Student roommatesList : studentList) {
                        %>

                        <tr class="group hover:bg-surface-container-low transition-colors">
                            <td class="px-8 py-5">
                                <p class="font-bold text-on-surface text-sm">
                                    <%=roommatesList.getName()%>
                                </p>
                                <p class="text-[10px] text-outline font-medium">
                                    <%=roommatesList.getBranch()%>
                                </p>
                            </td>

                            <td class="px-8 py-5 text-sm font-medium text-on-surface-variant">
                                <%=roommatesList.getCourse()%>
                            </td>

                            <td class="px-8 py-5 text-center text-sm text-outline">
                                <%=roommatesList.getAllot_date()%>
                            </td>

                            <td class="px-8 py-5 text-right text-sm text-outline">
                                <%=roommatesList.getYear()%>
                            </td>
                        </tr>

                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <!-- Quick Actions / Additional Info -->
    <section class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div id="paymentBtn" class="bg-surface-container p-6 rounded-xl flex items-center justify-between hover:bg-surface-container-high transition-colors cursor-pointer group">
            <div class="flex items-center gap-4">
                <div class="p-3 bg-white rounded-lg shadow-sm">
                    <span class="material-symbols-outlined text-primary" data-icon="payments" style="">payments</span>
                </div>
                <div>
                    <h4 class="font-bold" style="">Hostel Payments</h4>
                    <p class="text-xs text-outline" style="">Academic your 2025-2026</p>
                </div>
            </div>
            <span class="material-symbols-outlined text-outline group-hover:translate-x-1 transition-transform" data-icon="chevron_right" style="">chevron_right</span>
        </div>
        <div id="maintenanceBtn"
             class="bg-surface-container p-6 rounded-xl flex items-center justify-between hover:bg-surface-container-high transition-colors cursor-pointer group">

            <div class="flex items-center gap-4">
                <div class="p-3 bg-white rounded-lg shadow-sm">
                    <span class="material-symbols-outlined text-primary">construction</span>
                </div>

                <div>
                    <h4 class="font-bold">Maintenance</h4>
                    <p class="text-xs text-outline">Report an issue</p>
                </div>
            </div>

            <span class="material-symbols-outlined text-outline group-hover:translate-x-1 transition-transform">
            chevron_right
                </span>
        </div>
        <div id="RuleBtn" class="bg-surface-container p-6 rounded-xl flex items-center justify-between hover:bg-surface-container-high transition-colors cursor-pointer group">
            <div class="flex items-center gap-4">
                <div class="p-3 bg-white rounded-lg shadow-sm">
                    <span class="material-symbols-outlined text-primary" data-icon="assignment_late" style="">assignment_late</span>
                </div>
                <div>
                    <h4 class="font-bold" style="">Rules &amp; Conduct</h4>
                    <p class="text-xs text-outline" style="">Hostel guidelines</p>
                </div>
            </div>
            <span class="material-symbols-outlined text-outline group-hover:translate-x-1 transition-transform"
                  data-icon="chevron_right" style="">chevron_right</span>
        </div>
    </section>
</main>
<!-- BottomNavBar (Mobile Only) -->
<nav class="md:hidden fixed bottom-0 left-0 w-full z-50 bg-white/70 dark:bg-slate-900/70 backdrop-blur-xl border-t border-[#c6c5d4]/15 shadow-[0_-10px_30px_rgba(26,35,126,0.04)]">
    <div class="flex justify-around items-center pb-safe pt-2 px-4 h-16">
        <a class="flex flex-col items-center justify-center bg-[#1A237E] text-white rounded-xl px-4 py-1.5 transition-all duration-300 ease-out">
            <span class="material-symbols-outlined" data-icon="dashboard" style="">dashboard</span>
            <span class="font-['Inter'] text-xs font-semibold" style="">Dashboard</span>
        </a>
        <a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 hover:text-[#1A237E] transition-all duration-300 ease-out"
           href="#" style="">
            <span class="material-symbols-outlined" data-icon="bed" style="">bed</span>
            <span class="font-['Inter'] text-xs font-semibold" style="">Room</span>
        </a>
        <a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 hover:text-[#1A237E] transition-all duration-300 ease-out"
           href="#" style="">
            <span class="material-symbols-outlined" data-icon="payments" style="">payments</span>
            <span class="font-['Inter'] text-xs font-semibold" style="">Payments</span>
        </a>
        <a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 hover:text-[#1A237E] transition-all duration-300 ease-out"
           href="#" style="">
            <span class="material-symbols-outlined" data-icon="person" style="">person</span>
            <span class="font-['Inter'] text-xs font-semibold" style="">Profile</span>
        </a>
    </div>
</nav>
</body>
<script>
    const contextPath= "<%=request.getContextPath()%>";
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/student/js/student-logout.js"></script>
<script src="${pageContext.request.contextPath}/student/js/student-modal.js"></script>
</html>