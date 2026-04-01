// Function for getAddRoom

const wardenDashboardPage = document.getElementById("post-container");
const addStudentPage = document.getElementById("allot-new-student-section");
const studentSearchSection = document.getElementById("student-search-section");
const viewRoomPage = document.getElementById("view-room-section");
const roomAllotmentPage = document.getElementById("room-allotment-section");
const allotmentListPage = document.getElementById("Allotment-list-section");

function getAddRoom(element) {
    wardenDashboardPage.style.display = "none";
    addStudentPage.style.display = "block";
    studentSearchSection.style.display = "none";
    viewRoomPage.style.display = "none";
    roomAllotmentPage.style.display = "none";
    allotmentListPage.style.display = "none";

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

function searchForm(element) {
    wardenDashboardPage.style.display = "none";
    addStudentPage.style.display = "none";
    studentSearchSection.style.display = "block";
    viewRoomPage.style.display = "none";
    roomAllotmentPage.style.display = "none";
    allotmentListPage.style.display = "none";

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
    fetch(contextPath+"/warden/student-search-page.jsp")
        .then(res => res.text())
        .then(data => {
            document.getElementById("student-search-section").innerHTML = data;
            SearchStudent();
        })
        .catch(error => console.log(error));
}

function viewRooms(element){
    wardenDashboardPage.style.display = "none";
    addStudentPage.style.display = "none";
    studentSearchSection.style.display = "none";
    viewRoomPage.style.display = "block";
    roomAllotmentPage.style.display = "none";
    allotmentListPage.style.display = "none";

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
    fetch(contextPath+"/warden/view-rooms.jsp")
        .then(res => res.text())
        .then(data => {
            document.getElementById("view-room-section").innerHTML = data;
        })
        .catch(error => console.log(error));
}

function roomAllotment(element){
    wardenDashboardPage.style.display = "none";
    addStudentPage.style.display = "none";
    studentSearchSection.style.display = "none";
    viewRoomPage.style.display = "none";
    roomAllotmentPage.style.display = "block";
    allotmentListPage.style.display = "none";

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
    fetch(contextPath+"/warden/room-allotment.jsp")
        .then(res => res.text())
        .then(data => {
            document.getElementById("room-allotment-section").innerHTML = data;
        })
        .catch(error => console.log(error));
}

function allotmentList(element){
    wardenDashboardPage.style.display = "none";
    addStudentPage.style.display = "none";
    studentSearchSection.style.display = "none";
    viewRoomPage.style.display = "none";
    roomAllotmentPage.style.display = "none";
    allotmentListPage.style.display = "block";

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
    fetch(contextPath+"/warden/allotment-list.jsp")
        .then(res => res.text())
        .then(data => {
            document.getElementById("Allotment-list-section").innerHTML = data;
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
