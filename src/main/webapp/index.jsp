<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Hostel Room Allotment System</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#1d4ed8",
                        "background-light": "#f8fafc",
                        "background-dark": "#0f172a",
                    },
                    fontFamily: {
                        "display": ["Public Sans", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
    <link rel="stylesheet" href="css/index.css">
</head>

<body class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-slate-100 font-display transition-colors duration-300">
<header class="fixed top-0 left-0 right-0 z-50 bg-white/80 dark:bg-background-dark/80 backdrop-blur-md border-b border-slate-200 dark:border-slate-800">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        <div class="flex items-center gap-3">
            <div class="size-10 bg-primary flex items-center justify-center rounded-lg shadow-lg shadow-primary/20">
                <span class="material-symbols-outlined text-white">domain</span>
            </div>
            <div class="flex flex-col">
                <span class="font-bold text-lg leading-tight text-slate-900 dark:text-slate-100">Hostel System</span>
                <span class="text-[10px] uppercase tracking-widest text-primary font-semibold">University Hostel Portal</span>
            </div>
        </div>
        <div class="flex items-center gap-6">
            <a class="text-sm font-medium text-slate-600 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors"
               href="#about">About Hostel</a>
            <button class="bg-primary hover:bg-primary/90 text-white px-5 py-2 rounded-lg text-sm font-semibold transition-all shadow-md shadow-primary/20">
                Contact
            </button>
        </div>
    </nav>
</header>
<main>
    <section class="relative h-screen w-full flex items-center justify-center overflow-hidden">
        <div class="absolute inset-0 z-0">
            <div class="absolute inset-0 bg-slate-900/60 z-10"></div>
            <img alt="Modern college hostel building architecture" class="w-full h-full object-cover"
                 data-alt="Modern college hostel building with large windows"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuAgKalhbctgWSd14hhWGD86IEsZqgvaDEF9kwrdftil_t9rAeE0OIpymYO70DAN1G4v7H9yxgGjk_vZI181YDfA_lbLb90ztQKzC77JsUEPJR8fFXCVUCnRNd6KbaW6weNE0UWsUw18xFSnvAUdcJZMgB5lvJ5C2bmY-hOdh_I6bA9pTifr6RUggLYePE3pnG3fAQXX96kvKhJKMMVSA8dxzLj4XHqal7Z2ryxpz7GE_SZh5CbYbcPLaTwlDoxXroCXNHqusidPcnFJ"/>
        </div>
        <div class="relative z-20 text-center px-4 max-w-4xl mx-auto">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white text-xs font-medium mb-6">
<span class="relative flex h-2 w-2">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-primary opacity-75"></span>
<span class="relative inline-flex rounded-full h-2 w-2 bg-primary"></span>
</span>
                Academic Year 2026 Allotment Now Open
            </div>
            <h1 class="text-5xl md:text-7xl font-extrabold text-white mb-6 tracking-tight">
                Hostel Room <br/>
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-blue-200">Allotment System</span>
            </h1>
            <p class="text-lg md:text-xl text-slate-200 mb-10 max-w-2xl mx-auto font-light leading-relaxed">
                A streamlined digital experience for managing hostel rooms and student allotments. Efficient,
                transparent, and user-friendly.
            </p>
            <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a class="group relative flex min-w-[200px] items-center justify-center overflow-hidden rounded-xl bg-primary px-8 py-4 text-white transition-all hover:bg-primary/90 shadow-xl shadow-primary/30"
                   href="#login-portal">
                    <span class="relative text-lg font-bold">Get Started</span>
                    <span class="material-symbols-outlined ml-2 text-xl group-hover:translate-x-1 transition-transform">arrow_forward</span>
                </a>
            </div>
        </div>
        <div class="absolute bottom-10 left-1/2 -translate-x-1/2 z-20 animate-bounce text-white/50">
            <span class="material-symbols-outlined text-3xl">keyboard_double_arrow_down</span>
        </div>
    </section>
    <section class="py-24 bg-background-light dark:bg-background-dark" id="login-portal">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16">
                <h2 class="text-3xl font-bold text-slate-900 dark:text-slate-100 mb-4">Access Portals</h2>
                <p class="text-slate-600 dark:text-slate-400">Select your role to continue to the secure management
                    system</p>
            </div>
            <div class="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
                <div class="group p-8 rounded-2xl bg-white dark:bg-slate-800/50 border border-slate-200 dark:border-slate-800 hover:border-primary dark:hover:border-primary transition-all duration-300 hover:shadow-2xl hover:shadow-primary/5">
                    <div class="size-16 rounded-xl bg-primary/10 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined text-primary text-3xl">school</span>
                    </div>
                    <h3 class="text-xl font-bold mb-2 dark:text-white">Student Login</h3>
                    <p class="text-slate-500 dark:text-slate-400 mb-8">Access your room preferences, check allotment
                        status, and manage your hostel fees.</p>
                    <a href="${pageContext.request.contextPath}/student/student-login.jsp" class="w-full py-4 rounded-xl bg-primary text-white font-bold transition-all hover:shadow-lg hover:shadow-primary/20 flex items-center justify-center gap-2">
                        Enter Student Portal
                        <span class="material-symbols-outlined text-sm">login</span>
                    </a>
                </div>
                <div class="group p-8 rounded-2xl bg-white dark:bg-slate-800/50 border border-slate-200 dark:border-slate-800 hover:border-primary dark:hover:border-primary transition-all duration-300 hover:shadow-2xl hover:shadow-primary/5">
                    <div class="size-16 rounded-xl bg-primary/10 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined text-primary text-3xl">shield_person</span>
                    </div>
                    <h3 class="text-xl font-bold mb-2 dark:text-white">Administrative Login</h3>
                    <p class="text-slate-500 dark:text-slate-400 mb-8">Administrative access to manage inventory, allot
                        rooms, and generate student reports.</p>
<%--                    <button onclick="window.location.href='${pageContext.request.contextPath}/warden/warden-login.jsp'" class="w-full py-4 rounded-xl bg-slate-900 dark:bg-slate-700 text-white font-bold transition-all hover:bg-slate-800 flex items-center justify-center gap-2">--%>
<%--                        Enter Warden Portal--%>
<%--                        <span class="material-symbols-outlined text-sm">admin_panel_settings</span>--%>
<%--                    </button>--%>
                    <a href="${pageContext.request.contextPath}/warden/warden-login.jsp" class="w-full py-4 rounded-xl bg-slate-900 dark:bg-slate-700 text-white font-bold transition-all hover:bg-slate-800 flex items-center justify-center gap-2" >
                        Enter Administrative Portal
                        <span class="material-symbols-outlined text-sm">admin_panel_settings</span>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <section class="py-24 border-t border-slate-200 dark:border-slate-800" id="about">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col lg:flex-row items-center gap-16">
                <div class="lg:w-1/2">
                    <div class="relative rounded-2xl overflow-hidden shadow-2xl">
                        <img alt="Shared hostel room facility" class="w-full h-[400px] object-cover"
                             data-alt="Clean and modern shared hostel room"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuCTFIKr0ARk34JAjh9hzrXcKIS-JqF6HwCY6N7Ag_4aPq79iJn9VxSzP515aMAC_Sh9P9y10s27W1t06Xz0Mg06-dnQzpsvQ_Yr4NEsYqJ4LO6twmK33BNOpZWWsMGzUe5IhgVLLgw4NjbAc08yJclFBsU1yKhAk5wlVjqh8a2jdIIpRZQwmJXAo5CsMfceW4v2mPj0v9yhZkjAG6Jc7QlC-OBVabKeL2kTozXfnCiuP26tO7sQWnshFK0wDzN1Gqlt-NKe995NOPEB"/>
                        <div class="absolute inset-0 bg-primary/10 mix-blend-multiply"></div>
                    </div>
                </div>
                <div class="lg:w-1/2">
                    <span class="text-primary font-bold uppercase tracking-widest text-sm mb-4 block">Our Facility</span>
                    <h2 class="text-4xl font-bold mb-6 text-slate-900 dark:text-slate-100">Modern Living for Future
                        Leaders</h2>
                    <p class="text-slate-600 dark:text-slate-400 mb-8 leading-relaxed">
                        Our hostel system is designed to provide students with more than just a place to sleep. We offer
                        a vibrant community environment equipped with high-speed internet, secure premises, and modern
                        amenities that support academic excellence.
                    </p>
                    <ul class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <li class="flex items-center gap-2 text-slate-700 dark:text-slate-300">
                            <span class="material-symbols-outlined text-primary">check_circle</span>
                            High-speed Fiber Wi-Fi
                        </li>
                        <li class="flex items-center gap-2 text-slate-700 dark:text-slate-300">
                            <span class="material-symbols-outlined text-primary">check_circle</span>
                            24/7 Security &amp; CCTV
                        </li>
                        <li class="flex items-center gap-2 text-slate-700 dark:text-slate-300">
                            <span class="material-symbols-outlined text-primary">check_circle</span>
                            On-campus Laundry
                        </li>
                        <li class="flex items-center gap-2 text-slate-700 dark:text-slate-300">
                            <span class="material-symbols-outlined text-primary">check_circle</span>
                            24/7 Warden Available
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</main>
<footer class="bg-white dark:bg-slate-950 border-t border-slate-200 dark:border-slate-900 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row items-center justify-between gap-8">
            <div class="flex items-center gap-3">
                <div class="size-8 bg-slate-200 dark:bg-slate-800 rounded flex items-center justify-center">
                    <span class="material-symbols-outlined text-slate-500 dark:text-slate-400 text-lg">apartment</span>
                </div>
                <span class="font-bold text-slate-900 dark:text-slate-100">Hostel Management System</span>
            </div>
            <div class="text-slate-350 text-sm">
                © 2026 Sandip University. All rights reserved.
            </div>
        </div>
    </div>
</footer>

</body>
</html>