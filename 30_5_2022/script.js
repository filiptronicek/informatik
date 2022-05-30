const dom = {
    amount: document.getElementById('amount'),
    rate: document.getElementById('rate'),
    output: document.getElementById('output')
}

const update = () => {
    const amount = dom.amount.value;
    const rate = dom.rate.value;
    const tax = 0.15;

    const yearlyResult = amount * (rate / 100);
    const yearlyResultTaxed = yearlyResult - (yearlyResult * tax);
    const montlyResultTaxed = yearlyResultTaxed / 12;

    dom.output.innerText = `Váš měsíční úrok je ${montlyResultTaxed.toFixed(2)} Kč`;
};

dom.amount.onkeyup = update;
dom.rate.onkeyup = update;

dom.amount.onchange = update;
dom.rate.onchange = update;