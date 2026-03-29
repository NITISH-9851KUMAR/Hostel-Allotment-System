<%@ page import="java.util.List" %>
<%@ page import="dao.CountValue" %>
<%@ page isELIgnored="false" %>
<html class="light" lang="en">

<!DOCTYPE html>
<head>
    <%
        List<String> roomNumberList = CountValue.getEmptyRoom();
    %>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Add Rooms - Hostel Management System</title>
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap"
          rel="stylesheet"/>
    <!-- Material Symbols Outlined -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "outline-variant": "#c5c5d4",
                        "on-primary-fixed-variant": "#293ca0",
                        "on-tertiary-container": "#ffc7a2",
                        "tertiary-container": "#8f4700",
                        "inverse-on-surface": "#eff1f3",
                        "on-error": "#ffffff",
                        "on-primary": "#ffffff",
                        "tertiary-fixed": "#ffdcc6",
                        "surface-container-lowest": "#ffffff",
                        "surface-dim": "#d8dadc",
                        "on-primary-container": "#cacfff",
                        "on-secondary": "#ffffff",
                        "surface-variant": "#e0e3e5",
                        "on-surface": "#191c1e",
                        "surface-container-low": "#f2f4f6",
                        "surface-bright": "#f7f9fb",
                        "primary-fixed": "#dee0ff",
                        "primary-fixed-dim": "#bac3ff",
                        "on-primary-fixed": "#00105c",
                        "surface-container": "#eceef0",
                        "surface-tint": "#4355b9",
                        "primary": "#24389c",
                        "on-surface-variant": "#454652",
                        "inverse-surface": "#2d3133",
                        "on-background": "#191c1e",
                        "on-tertiary-fixed-variant": "#713700",
                        "tertiary-fixed-dim": "#ffb784",
                        "tertiary": "#6c3400",
                        "secondary-fixed": "#d5e3fc",
                        "on-tertiary-fixed": "#301400",
                        "inverse-primary": "#bac3ff",
                        "background": "#f7f9fb",
                        "on-tertiary": "#ffffff",
                        "on-secondary-fixed-variant": "#3a485b",
                        "on-secondary-fixed": "#0d1c2e",
                        "secondary-container": "#d5e3fc",
                        "on-error-container": "#93000a",
                        "surface-container-highest": "#e0e3e5",
                        "outline": "#757684",
                        "error-container": "#ffdad6",
                        "error": "#ba1a1a",
                        "surface": "#f7f9fb",
                        "surface-container-high": "#e6e8ea",
                        "primary-container": "#3f51b5",
                        "secondary-fixed-dim": "#b9c7df",
                        "on-secondary-container": "#57657a",
                        "secondary": "#515f74"
                    },
                    fontFamily: {
                        "headline": ["Inter"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    },
                    borderRadius: {"DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem"},
                },
            },
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 20;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f7f9fb;
        }
    </style>
    <style>
        body {
            min-height: max(884px, 100dvh);
        }
    </style>
</head>
<body class="flex min-h-screen text-on-surface">
<!-- Main Content Canvas -->
<main class="flex flex-col min-h-screen">
    <!-- TopAppBar -->
    <header class="w-full top-0 sticky bg-[#f7f9fb] dark:bg-slate-950 flex items-center justify-between px-10 py-6 z-40">
        <div class="flex items-center gap-4">
            <div class="p-2 bg-primary-fixed rounded-xl text-primary flex items-center justify-center">
                <span class="material-symbols-outlined">meeting_room</span>
            </div>
            <h1 class="font-['Inter'] font-extrabold text-3xl tracking-tight text-[#24389c] dark:text-indigo-400">
                Allocate rooms to the students</h1>

        </div>
    </header>
    <!-- Main Content Area -->
    <div class="p-10 space-y-12">
        <form id="add-new-student-form" class="space-y-8">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

                <!-- Student Name -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Student Name
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">person</span>
                        <input name="studentName" type="text" required
                               placeholder="Enter student name"
                               class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium"/>
                    </div>
                </div>

                <!-- Roll Number -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        PRN
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">badge</span>
                        <input name="prnNumber"
                               type="text"
                               required
                               maxlength="12"
                               pattern="[0-9]{12}"
                               title="PRN number must be exactly 12 digits"
                               placeholder="Enter PRN number"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium"/>
                    </div>
                </div>

                <!-- Email -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Email Address
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">mail</span>
                        <input name="email" type="email" required
                               placeholder="Enter email address"
                               class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium"/>
                    </div>
                </div>

                <!-- Phone Number -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Phone Number
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">call</span>
                        <input name="phone" type="text" required
                               maxlength="10"
                               pattern="[0-9]{10}"
                               placeholder="Enter phone number"
                               title="PRN number must be exactly 12 digits"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium"/>
                    </div>
                </div>

                <!-- Course -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Course
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">school</span>
                        <select name="course" required
                                class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium appearance-none">
                            <option value="" selected disabled>Select Course</option>
                            <option value="B.Tech">B.Tech</option>
                            <option value="M.Tech">M.Tech</option>
                            <option value="BCA">BCA</option>
                            <option value="MCA">MCA</option>
                            <option value="BBA">BBA</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                </div>

                <!-- Branch -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Branch
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">school</span>
                        <select name="branch" required
                                class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium appearance-none">
                            <option value="" selected disabled>Select Branch</option>
                            <option value="CSE">CSE</option>
                            <option value="EE">EE</option>
                            <option value="ME">ME</option>
                            <option value="Civil">Civil</option>
                            <option value="AI/ML">AI/ML</option>
                            <option value="Agriculture">Agriculture</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>

                <!-- Year -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Year
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">calendar_today</span>
                        <select required name="year"
                                class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium appearance-none">
                            <option value="" selected disabled>Select Year</option>
                            <option value="1st Year">1st Year</option>
                            <option value="2nd Year">2nd Year</option>
                            <option value="3rd Year">3rd Year</option>
                            <option value="4th Year">4th Year</option>
                            <option value="Final Year">Final Year</option>
                        </select>
                    </div>
                </div>

                <!-- Room Number -->
                <div class="space-y-2">
                    <label class="block text-[10px] font-black uppercase tracking-wider text-on-surface-variant ml-1">
                        Room Number
                    </label>
                    <div class="relative flex items-center">
                        <span class="absolute left-4 material-symbols-outlined text-outline">meeting_room</span>
                        <select name="room_number" required
                                class="w-full pl-12 pr-4 py-4 bg-surface-container-low border-none rounded-xl focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all text-sm font-medium appearance-none">
                            <option value="" selected disabled>Select Room</option>
                            <%
                                for (String roomNumber : roomNumberList) {
                                    if (roomNumber.equals("R-408")) { %>
                            <option value="" disabled>R-408  Rector Room
                            </option>
                            <%} else if (roomNumber.equals("R-412")) { %>
                            <option value="R-412">R-412  Developer Room
                            </option>
                            <%} else if (roomNumber.equals("R-424")) { %>
                            <option value="" disabled>R-424  Store Room
                            </option>
                            <%
                            } else if (roomNumber.equals("R-412 Room is Full")) { %>
                            <option disabled value="">R-412 Room is Full, Developer Room
                            </option>
                            <%
                            } else { %>
                            <option value="<%=roomNumber%>"><%=roomNumber%>
                            </option>
                            <%
                                    }
                                } %>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="pt-8 flex justify-end">
                <button type="submit"
                        class="flex items-center gap-3 px-8 py-4 bg-gradient-to-b from-primary to-primary-container text-white rounded-xl font-bold text-sm shadow-xl shadow-primary/20 hover:scale-[1.02] transition-all">
                    <span class="material-symbols-outlined">person_add</span>
                    Add Student
                </button>
            </div>
        </form>
    </div>
</main>
</body>
<script>
    const contextPath = "<%= request.getContextPath() %>";
</script>
<script src="${pageContext.request.contextPath}/warden/js/add-new-student.js"></script>
</html>

