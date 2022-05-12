const buttons = {
    contact: document.getElementById('contact'),
    leadership: document.getElementById('leadership')
};

const dialog = document.getElementById('dialog');
const outputDial = document.getElementById('outputDial');

buttons.contact.onclick = () => {
    if (typeof dialog.showModal === "function") {
        outputDial.innerText = 'Adresa školy: Střížkovská 27/32 Praha 8 180 00';
        dialog.showModal();
    } else {
        alert("Sorry, the <dialog> API is not supported by this browser.");
    }
}

buttons.leadership.onclick = () => {
    if (typeof dialog.showModal === "function") {
        outputDial.innerText = 'Mgr. Lenka Vopařilová';
        dialog.showModal();
    } else {
        alert("Sorry, the <dialog> API is not supported by this browser.");
    }
}