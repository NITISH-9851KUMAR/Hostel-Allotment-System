<%@ page isErrorPage="true" %>
<%@ page errorPage="error-page.jsp" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Warden Portal Login</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>

    <style>
        body{
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>

<body class="min-h-screen flex items-center justify-center relative bg-gray-100">

<!-- ========== RESPONSIVE BACKGROUND (Change Image Anytime) ========== -->
<div class="fixed inset-0 -z-10">
    <img src="image/Hostel_Image1.jpeg"
         class="w-full h-screen object-cover object-center"
         alt="background">
    <!-- Change overlay color here -->
    <div class="absolute inset-0 bg-black/40"></div>
</div>

<!-- ========== LOGIN CARD ========== -->
<main class="w-full max-w-md mx-auto px-6 py-10 sm:py-14">

    <div class="bg-white/80 backdrop-blur-lg rounded-2xl shadow-xl p-8 sm:p-10">

        <!-- Heading -->
        <div class="text-center mb-8">
            <h1 class="text-2xl font-bold text-indigo-900">Warden Portal</h1>
            <p class="text-sm text-gray-600 mt-1">Secure Login Access</p>
        </div>

        <!-- Form -->
        <form id="warden-login-form" class="space-y-6">

            <!-- Username -->
            <div>
                <label class="text-sm font-semibold text-gray-700">Warden ID</label>
                <input type="text"
                       id="username"
                       name="userid"
                       required
                       placeholder="Enter your ID"
                       class="w-full mt-2 px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-600">
            </div>

            <!-- Password -->
            <div>
                <label class="text-sm font-semibold text-gray-700">Password</label>
                <input type="password"
                       id="password"
                       name="password"
                       required
                       placeholder="Enter password"
                       class="w-full mt-2 px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-600">
            </div>

            <!-- Button -->
            <button type="submit"
                    class="w-full bg-indigo-700 hover:bg-indigo-800 text-white py-3 rounded-lg font-semibold transition">
                Login
            </button>

        </form>

        <!-- Footer text -->
        <div class="text-center mt-6">
            <p class="text-xs text-gray-600">© 2026 Sandip University</p>
        </div>

    </div>
</main>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- JS File -->
<script src="js/warden-login.js"></script>

</body>
</html>


