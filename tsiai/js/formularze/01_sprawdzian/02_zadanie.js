const btnE=document.getElementById('btn')
const redE=document.getElementById('red')
const blueE=document.getElementById('blue')
const greenE=document.getElementById('green')
const loremE=document.querySelector('p')

btnE.addEventListener('click',(e)=>{
    if(redE.checked){
        loremE.style.color='red'
    }
    else if(blueE.checked){
        loremE.style.color='blue'
    }
    else if(greenE.checked){
        loremE.style.color='green'
    }
})