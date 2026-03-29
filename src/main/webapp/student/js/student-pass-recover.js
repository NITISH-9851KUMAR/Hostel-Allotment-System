document.getElementById("student-pass-recover-form").addEventListener("submit", function (e) {
    e.preventDefault();

    let formData = new FormData(this);
    fetch("forgot-password", {
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
                title: 'Password Recover',
                text: data.message,
                timer: 10000,
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