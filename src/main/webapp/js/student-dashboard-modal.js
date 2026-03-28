const btnPayment = document.getElementById("paymentBtn");
const modalPayment = document.getElementById("contactModalPayment");
const closePayment = document.getElementById("closeModalPayment");

btnPayment.onclick = function () {
    modalPayment.classList.remove("hidden");
};

closePayment.onclick = function () {
    modalPayment.classList.add("hidden");
};

const btnMaintenance = document.getElementById("maintenanceBtn");
const modalMaintenance = document.getElementById("contactModal");
const closeMaintenance = document.getElementById("closeModal");
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