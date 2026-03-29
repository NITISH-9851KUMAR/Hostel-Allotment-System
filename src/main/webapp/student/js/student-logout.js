document.getElementById("logout-student").addEventListener("click", function(e){
    e.preventDefault();
    // call logout servlet using fetch
    fetch( contextPath+"/logout-student", {
        method: "POST"
    })
        .then(() => {
            // show success popup
            Swal.fire({
                icon: 'success',
                title: 'Logout Successfully',
                timer: 2000
            })
                // redirect to login page
                .then(() => {
                    window.location.href = contextPath + "/student/student-login.jsp";
                });
        })
})

