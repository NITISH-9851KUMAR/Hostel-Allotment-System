function SearchStudent() {
    let searchStudentErrorMessage = document.getElementById("search-student-error-message");
    let searchStudentMain = document.getElementById("search-student-main-section");

    document.getElementById("search-student-form").addEventListener("submit", function (e) {
        e.preventDefault();
        let formData = new FormData(this);

        fetch(contextPath+"/search-student", {
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
                    title: 'Student Found Successfully',
                    text: 'Welcome!',
                    timer: 500
                });
                window.location.href = "studentDetails.jsp";
                searchStudentMain.style.display= "block";
                searchStudentErrorMessage.style.display= "none";
            })
            .catch(error => {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Student Not Found!',
                    timer: 2000
                });
                searchStudentMain.style.display= "none";
                searchStudentErrorMessage.style.display= "block";
            });
    });
}