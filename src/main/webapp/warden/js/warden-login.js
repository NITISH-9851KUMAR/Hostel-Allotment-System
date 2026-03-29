// fetch API
document.getElementById("warden-login-form").addEventListener("submit", function (e) {

    e.preventDefault();

    // get form details
    let form = new FormData(this);
    fetch("warden-login", {
        method: "POST",
        body: form
    })
        .then(response => { // get response from servlet
            if (!response.ok) { // if response is not ok then throw Error
                return response.text().then(err => {
                    throw new Error(err);
                })
            }
            return response.text(); // if return is ok then it will execute
        })
        .then(() => {
            // loginError.style.display = "none";
            Swal.fire({
                icon: 'success',
                title: 'Login Successfully',
                text: 'Welcome!',
                timer: 2000
                // confirmButtonText: 'OK'
            }).then(() => {
                window.location.replace("warden-login-dashboard.jsp");
            });
        })
        .catch(() => {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!',
                footer: 'Check your warden id and password'
            });
        })

})