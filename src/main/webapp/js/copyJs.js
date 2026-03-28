document.getElementById("form-id").addEventListener("submit", function (e) {
    e.preventDefault();

    let formData = new FormData(this);

    fetch("servlt-link", {
        method: "POST",
        body: formData
    })
        .then(function (response) {
            return response.json().then(function (data) {

                if (!response.ok) {
                    throw new Error(data.message);
                }
                return data;
            });
        })
        .then(function (data) {
            // alert(data.message);
            Swal.fire({
                icon: 'success',
                title: 'Welcome ',
                text: data.message,
                timer: 3000
            });
        })
        .catch(function (error) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: error.message,
                timer: 5000
            });
        });
});

// For sweet Alert,  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

// response.setContentType("application/json");

// out.print("{\"status\":\"error\",\"message\":\"Invalid Details\"}");
// response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

// out.print("{\"status\":\"success\",\"message\":\"Student registered successfully\"}");
// response.setStatus(HttpServletResponse.SC_OK);
