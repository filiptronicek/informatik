const animalDom = {
    mravenec: document.getElementById('mravenec'),
    beruska: document.getElementById('beruska'),
    motyl: document.getElementById('motyl'),
    vcela: document.getElementById('vcela')
}

const shownImg = document.getElementById('shownImg');

let selected = 'mravenec';

Object.keys(animalDom).forEach((animul) => {
    animalDom[animul].onclick = () => window.open(`assets/${animul}.gif`, '_blank', 'width=300,height=400');
    animalDom[animul].onmouseover = () => {
        shownImg.src = `assets/${animul}.gif`;
        shownImg.setAttribute('alt', animalDom[animul].innerText);
        selected = animul;
    }
});

document.getElementById('share').onclick = () => {
    const shareData = {
        title: animalDom[selected].innerText,
        text: 'Supr zvířátko!',
        files: [
            new Image().src = `assets/${selected}.gif`
        ]
    }
    if (navigator.share && navigator.canShare(shareData)) {
        navigator.share(shareData);
    } else {
        alert(JSON.stringify(shareData, null, 2))
    }
}