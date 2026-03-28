<%@ page import="static dao.GetStudentDetails.getRecentFiveStudent" %>
<%@ page import="model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Warden" %>
<%@ page isErrorPage="true" %>
<%@ page errorPage="error-page.jsp" %>

<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0, viewport-fit=cover" name="viewport"/>
    <title>Academic Vanguard - Warden Portal</title>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Manrope:wght@600;700;800&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "on-surface": "#191c1d",
                        "on-error": "#ffffff",
                        "error-container": "#ffdad6",
                        "surface-container-lowest": "#ffffff",
                        "inverse-surface": "#2e3132",
                        "on-tertiary": "#ffffff",
                        "secondary-fixed-dim": "#bbc3ff",
                        "primary-fixed": "#e0e0ff",
                        "surface-variant": "#e1e3e4",
                        "surface-container-high": "#e7e8e9",
                        "surface-container-highest": "#e1e3e4",
                        "background": "#f8f9fa",
                        "on-secondary-fixed-variant": "#2d3c9c",
                        "on-primary-fixed-variant": "#343d96",
                        "outline": "#767683",
                        "on-secondary-container": "#1b2b8c",
                        "surface-bright": "#f8f9fa",
                        "surface": "#f8f9fa",
                        "surface-tint": "#4c56af",
                        "secondary-container": "#8a99fe",
                        "surface-container-low": "#f3f4f5",
                        "inverse-on-surface": "#f0f1f2",
                        "on-tertiary-fixed-variant": "#7b2e12",
                        "on-secondary": "#ffffff",
                        "error": "#ba1a1a",
                        "on-tertiary-container": "#e17c5a",
                        "secondary": "#4755b6",
                        "on-secondary-fixed": "#000d5f",
                        "inverse-primary": "#bdc2ff",
                        "on-background": "#191c1d",
                        "primary": "#000666",
                        "surface-dim": "#d9dadb",
                        "on-primary": "#ffffff",
                        "tertiary-fixed-dim": "#ffb59d",
                        "surface-container": "#edeeef",
                        "primary-fixed-dim": "#bdc2ff",
                        "on-primary-fixed": "#000767",
                        "tertiary-fixed": "#ffdbd0",
                        "on-error-container": "#93000a",
                        "outline-variant": "#c6c5d4",
                        "on-primary-container": "#8690ee",
                        "tertiary-container": "#5c1800",
                        "tertiary": "#380b00",
                        "on-tertiary-fixed": "#390c00",
                        "on-surface-variant": "#454652",
                        "secondary-fixed": "#dfe0ff",
                        "primary-container": "#1a237e"
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
            vertical-align: middle;
        }
        /* Mobile Sidebar Overlay */
        .sidebar-overlay {
            @apply fixed inset-0 bg-black/50 z-40 lg:hidden;
        }

        /* Responsive table on mobile */
        @media (max-width: 1024px) {
            .table-container {
                @apply overflow-x-auto -mx-4 px-4 pb-4;
            }
            .table-container table {
                @apply min-w-full;
            }
        }
    </style>
</head>
<body class="bg-background font-body text-on-surface">
<%
    // get the student value
    List<Student> studentList = getRecentFiveStudent();
    int percentValue = dao.CountValue.getPercentageValue();
    Warden warden = (Warden)session.getAttribute("current_warden");
    int count = dao.CountValue.countAllotRoom();
%>
<!-- Mobile Sidebar Toggle Button -->
<button id="mobile-menu-toggle" class="lg:hidden fixed top-4 left-4 z-50 w-12 h-12 rounded-xl bg-white/90 backdrop-blur-xl shadow-lg flex items-center justify-center text-primary">
    <span class="material-symbols-outlined text-xl">menu</span>
</button>

<!-- Sidebar Navigation -->
<aside id="sidebar" class="flex flex-col fixed left-0 top-0 h-full h-screen w-64 bg-slate-100 z-50 border-r-0 transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">
    <div class="px-6 py-8 h-full flex flex-col">
        <div class="flex items-center gap-3 mb-10 flex-shrink-0">
            <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-primary to-secondary flex items-center justify-center text-white">
                <span class="material-symbols-outlined" data-icon="account_balance">account_balance</span>
            </div>
            <div>
                <h1 class="text-xl font-bold text-blue-900">Warden Portal</h1>
                <p class="text-[10px] uppercase tracking-widest text-outline font-bold">Hostel Administration</p>
            </div>
        </div>
        <nav class="space-y-1 flex-1">
            <!-- Dashboard Home - ACTIVE -->
            <a class="menu-link flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200
             bg-slate-200 text-blue-700 font-bold border-r-4 border-blue-700 scale-[0.99] opacity-80"
               href="warden-login-dashboard.jsp">
                <span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
                <span class="font-manrope text-sm tracking-tight">Dashboard Home</span>
            </a>
            <a onClick="getAddRoom(this)"
               class="menu-link flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200 text-slate-600 hover:text-blue-800 hover:bg-slate-200">
                <span class="material-symbols-outlined" data-icon="add_home">add_home</span>
                <span class="font-manrope text-sm tracking-tight">Allot New Student</span>
            </a>
            <a class="flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200 text-slate-600 hover:text-blue-800 hover:bg-slate-200"
               href="#">
                <span class="material-symbols-outlined" data-icon="hotel">hotel</span>
                <span class="font-manrope text-sm tracking-tight">View Rooms</span>
            </a>
            <a class="flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200 text-slate-600 hover:text-blue-800 hover:bg-slate-200"
               href="#">
                <span class="material-symbols-outlined" data-icon="group">group</span>
                <span class="font-manrope text-sm tracking-tight">View Students</span>
            </a>
            <a class="flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200 text-slate-600 hover:text-blue-800 hover:bg-slate-200"
               href="#">
                <span class="material-symbols-outlined" data-icon="assignment_ind">assignment_ind</span>
                <span class="font-manrope text-sm tracking-tight">Room Allotment</span>
            </a>
            <a class="flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200 text-slate-600 hover:text-blue-800 hover:bg-slate-200"
               href="#">
                <span class="material-symbols-outlined" data-icon="list_alt">list_alt</span>
                <span class="font-manrope text-sm tracking-tight">Allotment List</span>
            </a>
        </nav>
        <div class="pt-10 mt-auto">
            <a onclick="logoutWarden(event)"
               class="flex items-center gap-3 px-4 py-3 rounded-xl transition-colors duration-200 text-error hover:bg-error-container/20">
                <span class="material-symbols-outlined" data-icon="logout">logout</span>
                <span class="font-manrope text-sm tracking-tight">Logout</span>
            </a>
        </div>
    </div>
</aside>

<!-- Mobile Sidebar Overlay -->
<div id="sidebar-overlay" class="sidebar-overlay hidden"></div>

<!-- Main Content Wrapper -->
<main class="min-h-screen transition-all duration-300 lg:ml-64">
    <!-- Top Navigation Bar -->
    <header class="flex justify-between items-center w-full px-4 sm:px-6 lg:px-8 py-4 sticky top-0 z-40 bg-white/90 backdrop-blur-xl shadow-sm shadow-blue-900/5">
        <div class="flex items-center gap-4 lg:gap-6 flex-1">
            <div class="relative w-full max-w-sm sm:max-w-md group">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-outline group-focus-within:text-primary transition-colors">search</span>
                <input class="w-full bg-surface-container-lowest border-none rounded-xl py-2.5 pl-12 pr-4 text-sm focus:ring-2 focus:ring-blue-500/20 font-body outline-none transition-all"
                       placeholder="Search students, rooms, or allotments..." type="text"/>
            </div>
        </div>
        <div class="flex items-center gap-3 sm:gap-6">
            <div class="flex gap-2">
                <button class="w-10 h-10 rounded-full flex items-center justify-center text-slate-500 hover:bg-surface-container-low transition-colors">
                    <span class="material-symbols-outlined" data-icon="notifications">notifications</span>
                </button>
                <button class="w-10 h-10 rounded-full flex items-center justify-center text-slate-500 hover:bg-surface-container-low transition-colors">
                    <span class="material-symbols-outlined" data-icon="help_outline">help_outline</span>
                </button>
            </div>
            <div class="h-8 w-[1px] bg-outline-variant/30 mx-2 hidden sm:block"></div>
            <div class="flex items-center gap-3 group cursor-pointer">
                <div class="text-right hidden sm:block">
                    <p class="text-sm font-bold text-blue-900 leading-tight"><%=warden.getName()%></p>
                    <p class="text-[10px] text-outline font-medium">Chief Warden Sir</p>
                </div>
                <div class="relative w-10 h-10 rounded-full overflow-hidden border-2 border-primary-container ring-4 ring-primary/5">
                    <img alt="Warden Profile" class="w-full h-full object-cover"
                         data-alt="Portrait of a middle aged man in academic attire" src="image/warden_sir_logo.png"/>
                </div>
            </div>
        </div>
    </header>

    <%-- Page Content of Warden-login-dashboard Page --%>
    <div id="post-container" class="p-4 sm:p-6 lg:p-10 max-w-[1400px] mx-auto">
        <!-- Welcome Header -->
        <div class="mb-8 sm:mb-10 flex flex-col lg:flex-row lg:justify-between lg:items-end gap-4 lg:gap-0">
            <div>
                <h2 class="font-headline text-2xl sm:text-3xl lg:text-4xl font-extrabold text-primary tracking-tight mb-2">Welcome Warden Sir: B5 Top Floor</h2>
                <p class="text-on-surface-variant font-medium">Academic Year 2025-26 | Fall Semester Overview</p>
            </div>
        </div>

        <!-- Dashboard Stats Bento Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6 mb-8 sm:mb-12">
            <!-- Total Rooms -->
            <div class="bg-surface-container-lowest p-4 sm:p-6 rounded-xl border border-transparent hover:border-outline-variant/30 transition-all duration-300">
                <div class="flex justify-between items-start mb-3 sm:mb-4">
                    <div class="w-10 h-10 sm:w-12 sm:h-12 rounded-xl bg-blue-50 flex items-center justify-center text-primary">
                        <span class="material-symbols-outlined text-lg sm:text-3xl" data-icon="hotel">hotel</span>
                    </div>
                    <span class="text-xs font-bold text-primary px-2 py-1 bg-primary-container/10 rounded-full">Total Capacity</span>
                </div>
                <div class="space-y-1">
                    <h3 class="text-2xl sm:text-3xl font-black text-on-surface">200</h3>
                    <p class="text-xs sm:text-sm text-on-surface-variant font-medium">Total Rooms: 27</p>
                </div>
                <div class="mt-3 sm:mt-4 pt-3 sm:pt-4 border-t border-outline-variant/10">
                    <div class="w-full bg-surface-container-low h-1.5 rounded-full overflow-hidden">
                        <div class="bg-primary h-full w-full"></div>
                    </div>
                </div>
            </div>

            <!-- Rooms Space -->
            <div class="bg-surface-container-lowest p-4 sm:p-6 rounded-xl border border-transparent hover:border-outline-variant/30 transition-all duration-300">
                <div class="flex justify-between items-start mb-3 sm:mb-4">
                    <div class="w-10 h-10 sm:w-12 sm:h-12 rounded-xl bg-indigo-50 flex items-center justify-center text-indigo-600">
                        <span class="material-symbols-outlined text-lg sm:text-3xl" data-icon="assignment">assignment</span>
                    </div>
                    <span class="text-xs font-bold text-indigo-700 px-2 py-1 bg-indigo-100 rounded-full">Room Space</span>
                </div>
                <div class="space-y-1">
                    <h3 class="text-xl sm:text-2xl font-black text-on-surface">8 Student</h3>
                    <p class="text-xs sm:text-sm text-on-surface-variant font-medium">Every Room</p>
                </div>
                <div class="mt-3 sm:mt-4 pt-3 sm:pt-4 border-t border-outline-variant/10">
                    <div class="w-full bg-surface-container-low h-1.5 rounded-full overflow-hidden">
                        <div class="bg-indigo-500 h-full w-[100%]"></div>
                    </div>
                </div>
            </div>

            <!-- Available Rooms -->
            <div class="bg-surface-container-lowest p-4 sm:p-6 rounded-xl border border-transparent hover:border-outline-variant/30 transition-all duration-300">
                <div class="flex justify-between items-start mb-3 sm:mb-4">
                    <div class="w-10 h-10 sm:w-12 sm:h-12 rounded-xl bg-emerald-50 flex items-center justify-center text-emerald-600">
                        <span class="material-symbols-outlined text-lg sm:text-3xl" data-icon="check_circle">check_circle</span>
                    </div>
                    <span class="text-xs font-bold text-emerald-700 px-2 py-1 bg-emerald-100 rounded-full">Ready to Occupy</span>
                </div>
                <div class="space-y-1">
                    <h3 class="text-2xl sm:text-3xl font-black text-on-surface"><%=200 - count%></h3>
                    <p class="text-xs sm:text-sm text-on-surface-variant font-medium">Available Total Beds</p>
                </div>
                <div class="mt-3 sm:mt-4 pt-3 sm:pt-4 border-t border-outline-variant/10">
                    <div class="w-full bg-surface-container-low h-1.5 rounded-full overflow-hidden">
                        <div class="bg-emerald-500 h-full" style="width: <%=100-percentValue%>%;"></div>
                    </div>
                </div>
            </div>

            <!-- Total Students -->
            <div class="bg-surface-container-lowest p-4 sm:p-6 rounded-xl border border-transparent hover:border-outline-variant/30 transition-all duration-300">
                <div class="flex justify-between items-start mb-3 sm:mb-4">
                    <div class="w-10 h-10 sm:w-12 sm:h-12 rounded-xl bg-amber-50 flex items-center justify-center text-amber-600">
                        <span class="material-symbols-outlined text-lg sm:text-3xl" data-icon="group">group</span>
                    </div>
                    <span class="text-xs font-bold text-amber-700 px-2 py-1 bg-amber-100 rounded-full">Enrolled</span>
                </div>
                <div class="space-y-1">
                    <h3 class="text-2xl sm:text-3xl font-black text-on-surface"><%=count%></h3>
                    <p class="text-xs sm:text-sm text-on-surface-variant font-medium">Total Students</p>
                </div>
                <div class="mt-3 sm:mt-4 pt-3 sm:pt-4 border-t border-outline-variant/10">
                    <div class="w-full bg-surface-container-low h-1.5 rounded-full overflow-hidden">
                        <div class="bg-amber-500 h-full" style="width: <%=percentValue%>%;"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <section class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm">
            <div class="px-4 sm:px-8 py-4 sm:py-6 border-b border-outline-variant/10 flex justify-between items-center">
                <h3 class="font-headline text-lg sm:text-xl font-bold text-primary">Recent Student Allotments</h3>
            </div>
            <div class="table-container">
                <table class="w-full text-left">
                    <thead>
                    <tr class="bg-surface-container-low/50">
                        <th class="px-4 sm:px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant min-w-[120px]">
                            Student Name
                        </th>
                        <th class="px-4 sm:px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant min-w-[100px]">
                            Room Number
                        </th>
                        <th class="px-4 sm:px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant min-w-[120px]">
                            Allotment Date
                        </th>
                        <th class="px-4 sm:px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant text-center min-w-[80px]">
                            Course
                        </th>
                        <th class="px-4 sm:px-8 py-4 text-[10px] uppercase tracking-widest font-bold text-on-surface-variant text-right min-w-[60px]">
                            Year
                        </th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-outline-variant/5">
                    <%
                        for (Student student : studentList) {
                    %>
                    <tr class="group hover:bg-surface-container-low transition-colors">
                        <td class="px-4 sm:px-8 py-4 sm:py-5">
                            <div class="flex items-center gap-3">
                                <div>
                                    <p class="font-bold text-on-surface text-sm"><%=student.getName()%></p>
                                    <p class="text-[10px] text-outline font-medium"><%=student.getBranch()%></p>
                                </div>
                            </div>
                        </td>
                        <td class="px-4 sm:px-8 py-4 sm:py-5">
                            <div class="flex flex-col">
                                <span class="font-bold text-primary text-sm"><%=student.getRoom_number()%></span>
                            </div>
                        </td>
                        <td class="px-4 sm:px-8 py-4 sm:py-5 text-sm font-medium text-on-surface-variant"><%=student.getAllot_date()%></td>
                        <td class="px-4 sm:px-8 py-4 sm:py-5 text-center">
                            <span class="px-2 sm:px-3 py-1 rounded-full text-[10px] font-black uppercase bg-secondary-fixed text-on-secondary-fixed"><%=student.getCourse()%></span>
                        </td>
                        <td class="px-4 sm:px-8 py-4 sm:py-5 text-right text-sm text-outline"><%=student.getYear()%></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </section>

        <!-- Bottom Information Grid (Asymmetric) -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-8 sm:mt-12">
            <div class="lg:col-span-2 bg-gradient-to-br from-primary to-secondary p-6 sm:p-8 rounded-xl text-white relative overflow-hidden group">
                <div class="relative z-10 max-w-sm sm:max-w-lg">
                    <h4 class="text-xl sm:text-2xl font-black mb-2">Hostel Maintenance Notice</h4>
                    <p class="text-blue-100 mb-4 sm:mb-6 text-sm">Students are hereby informed that hostel maintenance will be carried out as scheduled; therefore, students are requested not to disturb the process. For any queries, please contact the warden at 9031901500.</p>
                    <button class="bg-white text-primary px-4 sm:px-5 py-2 rounded-lg text-xs font-bold hover:bg-blue-50 transition-colors">
                        Broadcast to Students
                    </button>
                </div>
                <div class="absolute -right-16 sm:-right-20 -bottom-16 sm:-bottom-20 w-64 sm:w-80 h-64 sm:h-80 bg-white/10 rounded-full blur-3xl group-hover:scale-110 transition-transform duration-700"></div>
                <div class="absolute right-4 sm:right-10 top-4 sm:top-10 opacity-20">
                    <span class="material-symbols-outlined text-6xl sm:text-9xl" data-icon="construction">construction</span>
                </div>
            </div>
            <div class="bg-surface-container-highest p-6 sm:p-8 rounded-xl flex flex-col justify-center">
                <div class="flex items-center gap-3 sm:gap-4 mb-3 sm:mb-4">
                    <div class="w-10 h-10 sm:w-12 sm:h-12 rounded-full bg-primary/10 flex items-center justify-center text-primary">
                        <span class="material-symbols-outlined" data-icon="analytics">analytics</span>
                    </div>
                    <h4 class="font-headline text-base sm:text-lg font-bold text-primary">Capacity Alert</h4>
                </div>
                <p class="text-sm text-on-surface-variant mb-3 sm:mb-4">Hostel is currently at <span class="font-bold text-on-surface"><%=percentValue%>%</span> capacity. Expected full occupancy by next Month.</p>
                <div class="w-full bg-surface-container-low h-2 rounded-full mb-4 sm:mb-6">
                    <div class="bg-gradient-to-r from-primary to-secondary h-full" style="width: <%=percentValue%>%;"></div>
                </div>
                <a class="text-primary text-xs font-bold flex items-center gap-1 sm:gap-2 hover:gap-3 transition-all" href="#">
                    VIEW DETAILED ANALYTICS <span class="material-symbols-outlined text-sm" data-icon="arrow_forward">arrow_forward</span>
                </a>
            </div>
        </div>
    </div>

    <!-- Start allot-new-student-section This page is add by javascript method-->
    <div id="allot-new-student-section"></div>
    <!-- allot-new-student-section-->

    <!-- Footer -->
    <footer class="px-4 sm:px-10 py-6 sm:py-8 border-t border-outline-variant/10 mt-8 sm:mt-12 text-center">
        <p class="text-xs text-outline font-medium">
            © 2026 Sandip University. All Rights Reserved.
        </p>
    </footer>
</main>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/warden-login-dashboard.js"></script>
<script src="js/add-new-student.js"></script>
<script>
    // Mobile sidebar toggle functionality
    const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
    const sidebar = document.getElementById('sidebar');
    const sidebarOverlay = document.getElementById('sidebar-overlay');

    mobileMenuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('-translate-x-full');
        sidebarOverlay.classList.toggle('hidden');
    });

    sidebarOverlay.addEventListener('click', () => {
        sidebar.classList.add('-translate-x-full');
        sidebarOverlay.classList.add('hidden');
    });

    // Close sidebar when clicking on nav links (mobile only)
    const navLinks = sidebar.querySelectorAll('a');
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            if (window.innerWidth < 1024) {
                sidebar.classList.add('-translate-x-full');
                sidebarOverlay.classList.add('hidden');
            }
        });
    });

    // Prevent body scroll when sidebar is open on mobile
    sidebar.addEventListener('transitionend', () => {
        if (!sidebar.classList.contains('-translate-x-full') && window.innerWidth < 1024) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = '';
        }
    });
</script>
</body>
</html>