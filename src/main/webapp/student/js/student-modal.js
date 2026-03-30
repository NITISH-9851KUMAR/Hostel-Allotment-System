const btnPayment = document.getElementById("paymentBtn");
const modalPayment = document.getElementById("PaymentModal");
const closePayment = document.getElementById("PaymentClose");

btnPayment.onclick = function () {
    modalPayment.classList.remove("hidden");
};

closePayment.onclick = function () {
    modalPayment.classList.add("hidden");
};


const btnMaintenance = document.getElementById("maintenanceBtn");
const modalMaintenance = document.getElementById("MaintenanceModal");
const closeMaintenance = document.getElementById("MaintenanceClose");
btnMaintenance.onclick = function () {
    modalMaintenance.classList.remove("hidden");
}

closeMaintenance.onclick = function () {
    modalMaintenance.classList.add("hidden");
};

const btnRule = document.getElementById("RuleBtn");
const modalRule = document.getElementById("RuleModal");
const closeRule = document.getElementById("RuleClose");
btnRule.onclick = function () {
    modalRule.classList.remove("hidden");
}
closeRule.onclick = function () {
    modalRule.classList.add("hidden");
};