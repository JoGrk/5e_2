const sendE = document.getElementById('send')
const btngenE = document.getElementById('btn-gen')
const btnsendE = document.getElementById('btn-send')
const chatE = document.querySelector('.chat')



btnsendE.addEventListener('click', (e) => {
    let message = sendE.value;
    let divE = document.createElement('div')
    divE.classList.add('jola')

    let imgE = document.createElement('img')
    imgE.src = "./Jolka.jpg"
    imgE.alt = "Jolanta Nowak"

    let pE = document.createElement('p')
    pE.innerHTML = message;

    divE.appendChild(imgE)
    divE.appendChild(pE)
    chatE.appendChild(divE)
})


const tableE[
    "Świetnie!",
    "Kto gra główną rolę?",
    "Lubisz filmy Tego reżysera?",
    "Będę 10 minut wcześniej",
    "Może kupimy sobie popcorn?",
    "Ja wolę Colę",
    "Zaproszę jeszcze Grześka",
    "Tydzień temu też byłem w kinie na Diunie",
    "Ja funduję bilety"
]

btngenE.addEventListener('click',(e)=>{
    let number= Math.random
})




