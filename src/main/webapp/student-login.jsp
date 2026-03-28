<%@ page isErrorPage="true" %>
<%@ page errorPage="error-page.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Student - Login</title>
    <!-- BEGIN: External Scripts -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- END: External Scripts -->
    <!-- BEGIN: Custom Configuration -->
    <script data-purpose="tailwind-config">
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        brand: {
                            light: '#f0f4f8',
                            primary: '#1e3a8a', // Deep blue as seen in the Sign In button
                            secondary: '#64748b',
                            accent: '#3b82f6',
                        }
                    }
                }
            }
        }
    </script>
    <!-- END: Custom Configuration -->
    <!-- BEGIN: Custom Styles -->
    <style data-purpose="layout-styles">
        body {
            background-color: #a5b4c6; /* Mimicking the muted blue background from the reference image */
            background-image: linear-gradient(135deg, #a5b4c6 0%, #cbd5e1 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-shadow {
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
        }
    </style>
    <style data-purpose="typography">
        .font-brand {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
        }
    </style>
    <!-- END: Custom Styles -->
</head>
<body class="font-brand p-4">
<!-- BEGIN: Login Modal Container -->
<main class="w-full max-w-md bg-white rounded-2xl modal-shadow overflow-hidden relative" data-purpose="login-card">
    <!-- Close Button (Visual Placeholder) -->
    <button aria-label="Close" class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors">
        <svg class="h-5 w-5" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M6 18L18 6M6 6l12 12" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
        </svg>
    </button>
    <!-- BEGIN: Tabs Navigation -->
    <nav class="flex border-b border-gray-100" data-purpose="modal-tabs">
        <button class="flex-1 py-4 text-sm font-semibold text-brand-primary border-b-2 border-brand-primary">
            Login
        </button>
        <button onclick="window.location.href='student-register.jsp'"
                class="flex-1 py-4 text-sm font-semibold text-gray-400 hover:text-gray-600 transition-colors">
            Register
        </button>
    </nav>
    <!-- END: Tabs Navigation -->
    <!-- BEGIN: Login Form Content -->
    <div class="p-8 sm:p-10">
        <header class="text-center mb-8">
            <h1 class="text-2xl font-bold text-brand-primary" data-purpose="welcome-heading">Welcome Back</h1>
        </header>
        <form class="space-y-5" id="student-login-form">
            <!-- Email Input -->
            <div class="relative">
                <label class="sr-only" for="prn">PRN</label>
                <input class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-brand-primary focus:border-transparent transition-all placeholder-gray-400 text-gray-700"
                       id="prn"
                       name="prn"
                       placeholder="PRN"
                       required
                       maxlength="12"
                       pattern="[0-9]{12}"
                       inputmode="numeric"
                       oninput="this.value = this.value.replace(/[^0-9]/g, ''); this.setCustomValidity('')"
                       oninvalid="this.setCustomValidity('PRN number must be exactly 12 digits')"
                       type="text"/>
            </div>
            <!-- Password Input -->
            <div class="relative">
                <label class="sr-only" for="password">Password</label>
                <input class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-brand-primary focus:border-transparent transition-all placeholder-gray-400 text-gray-700 pr-12"
                       id="password"
                       name="password"
                       placeholder="Password"
                       required
                       type="password"
                       pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z0-9@$!%*?&]{8,}$"
                       oninvalid="this.setCustomValidity('Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special symbol')"
                       oninput="this.setCustomValidity('')"
                />
                <!-- Eye Icon (Show/Hide) -->
                <button class="absolute inset-y-0 right-0 pr-4 flex items-center text-gray-400 hover:text-gray-600"
                        data-purpose="toggle-password-visibility" type="button">
                    <svg class="h-5 w-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" stroke-linecap="round" stroke-linejoin="round"
                              stroke-width="2"></path>
                        <path d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                              stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                    </svg>
                </button>
            </div>
            <!-- Sign In Button -->
            <div class="pt-2">
                <button class="w-full bg-brand-primary hover:bg-blue-900 text-white font-semibold py-3.5 rounded-lg shadow-md transition-all active:scale-[0.98]"
                        data-purpose="submit-button" type="submit">
                    Sign In
                </button>
            </div>
            <!-- Links Section -->
            <div class="text-center space-y-4 pt-2">
                <a class="text-sm font-medium text-brand-accent hover:underline block"
                   data-purpose="forgot-password-link" href="student-password-forgot.jsp">
                    Forgot Password?
                </a>
                <p class="text-sm text-gray-500">
                    New to Hostel?
                    <a class="text-brand-primary font-bold hover:underline" data-purpose="create-account-link"
                       href="student-register.jsp">
                        Create Account
                    </a>
                </p>
            </div>
        </form>
    </div>
    <!-- END: Login Form Content -->
</main>
<!-- END: Login Modal Container -->
<!-- BEGIN: Interactive Elements Script -->
<script data-purpose="event-handlers">
    // Minimal JS for the password toggle visualization
    document.querySelector('[data-purpose="toggle-password-visibility"]').addEventListener('click', function () {
        const passwordInput = document.getElementById('password');
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
    });

</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/student-login.js"></script>
<!-- END: Interactive Elements Script -->
</body>
</html>