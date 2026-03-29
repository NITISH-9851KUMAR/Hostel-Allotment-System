// Function for getAddRoom

function getAddRoom(element) {

    let existPage = document.getElementById("post-container");
    existPage.style.display = "none";

    // remove active style from all links
    document.querySelectorAll(".menu-link").forEach(link => {
        link.classList.remove(
            "bg-slate-200",
            "text-blue-700",
            "font-bold",
            "border-r-4",
            "border-blue-700"
        );
    });

    // add active style to clicked link
    element.classList.add(
        "bg-slate-200",
        "text-blue-700",
        "font-bold",
        "border-r-4",
        "border-blue-700"
    );

    // load page
    fetch(contextPath+"/warden/add-new-student.jsp")
        .then(res => res.text())
        .then(data => {
            document.getElementById("allot-new-student-section").innerHTML = data;
            addStudentFormSubmit();
        })
        .catch(error => console.log(error));
}

// function called when logout button is clicked
function logoutWarden(event) {
    event.preventDefault();

    // call logout servlet using fetch
    fetch(contextPath+"/warden-logout", {
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
                    window.location.href = contextPath+ "/warden/warden-login.jsp";
                });
        })
}
