const num1E=document.getElementById('num1')
const num2E=document.getElementById('num2')
const result=document.getElementById('result')
const btn=document.getElementById('btn')
const shortE=document.getElementById('short')
const middleE=document.getElementById('middle')
const halflongE=document.getElementById('halflong')
const longE=document.getElementById('long')
const buttonhairE=document.getElementById('buttonhair')
const resulthairE=document.getElementById('resulthair')

btn.addEventListener('click',(e)=>{
    let num1=Number(num1E.value)
    let num2=Number(num2E.value)
    let suma=num1+num2
    let iloczyn=num1*num2
    result.innerHTML=`suma liczb to: ${suma}, iloczyn liczb to ${iloczyn}`;
})

const hE = document.querySelector('h2')

hE.addEventListener('click', (e)=>{
    hE.innerHTML="marian podgorski"
})

buttonhairE.addEventListener('click' , (e)=>{
    let price  
    if(shortE.checked){
        price = 25
    }
    else if(middleE.checked) {
        price = 30
    }
    else if(halflongE.checked){
        price=40
    }
    else if(longE.checked){
        price= 50
    }
    resulthairE.innerHTML=`Cena strzyżenia ${price}` 
})