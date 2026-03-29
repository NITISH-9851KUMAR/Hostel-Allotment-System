function addStudentFormSubmit() {
    document.getElementById("add-new-student-form").addEventListener("submit", function (e) {
        e.preventDefault();   // stops ?studentName=... in URL
        let formData = new FormData(this);

        fetch("allot-room-servlet", {
            method: "POST",
            body: formData
        })
            .then(response => { // get response from servlet
                if (!response.ok) { // if response is not ok then throw Error
                    return response.text().then(err => {
                        throw new Error(err);
                    })
                }
                return response.text();
            })// if return is ok then it will execute
            .then(() => {
                Swal.fire({
                    icon: 'success',
                    title: 'Alloted Room Successfully',
                    text: 'Welcome!',
                    timer: 3000
                });
            })
            .catch(error => {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: error.message,
                    timer: 5000
                });

            });
    });
}