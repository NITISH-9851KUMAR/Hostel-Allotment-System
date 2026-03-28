document.getElementById("student-login-form").addEventListener("submit", function (e) {
    e.preventDefault();

    let formData = new FormData(this);
    fetch("student-login", {
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
                timer: 1000,
                showConfirmButton: false,
                willClose: () => {
                    window.location.href = "student-login-dashboard.jsp";
                }
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