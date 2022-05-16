const elms = {
    list: document.getElementById("list").getElementsByTagName("li"),
    form: document.getElementById("form"),
    output: document.getElementById("out")
}

const totalQs = elms.list.length;

const correctAnswers = {
    1: "b",
    2: "a",
    3: "b",
    4: "b",
    5: "b"
}

function output (msg) {
    elms.output.innerText += `${msg}\n`;
}

elms.form.onsubmit = (e) => {
    e.preventDefault();
    elms.output.innerText = "";
    for (let index = 1; index < elms.list.length + 1; index++) {
        const correctA = correctAnswers[index];
        const entered = document.querySelector(`input[name=q${index}]:checked`);

        if (!entered) {
           output(`Otázka ${index} nebyla zodpovězena!`);
            continue;
        }

        if (entered.value !== correctA) {
            output(`Otázka ${index} byla zodpovězena špatně`);
        }

    }
}

