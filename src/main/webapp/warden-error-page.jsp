<!-- error.jsp -->
<%@ page isErrorPage="true" %>

<html>
<head>
  <title>Error Page</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: linear-gradient(to right, #eef2ff, #f8fafc);
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .error-box {
      background: white;
      padding: 40px;
      border-radius: 16px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      width: 400px;
    }

    .error-box img {
      width: 120px;
      margin-bottom: 15px;
    }

    .error-title {
      color: #dc2626;
      font-size: 24px;
      margin-bottom: 10px;
    }

    .error-text {
      color: #555;
      font-size: 14px;
      margin-bottom: 20px;
    }

    .btn {
      background: #2563eb;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 8px;
      font-size: 14px;
      cursor: pointer;
    }

    .btn:hover {
      background: #1e40af;
    }
  </style>
</head>

<body>

<div class="error-box">

  <!-- Error Image -->
  <img src="https://cdn-icons-png.flaticon.com/512/595/595067.png" alt="Error">

  <h2 class="error-title">Something went wrong</h2>

  <p class="error-text">
    The page could not be loaded properly.
    Please login again or contact the administrator.
  </p>

  <a href="warden-login.jsp">
    <button class="btn">Go to Login Page</button>
  </a>

</div>

</body>
</html>