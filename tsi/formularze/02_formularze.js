const perfectE=document.querySelector('#perfect')
const middleE=document.querySelector('#middle')
const weakE=document.querySelector('#weak')
const btn1E=document.querySelector('#btn1')
const resultE=document.querySelector('#result')


btn1E.addEventListener('click',(e)=>{
    if(perfectE.checked){
        resultE.innerHTML="Twoje zdanie na ten temat to:doskonale "
    }
    else if(middleE.checked){
        resultE.innerHTML="Twoje zdanie na ten temat to: srednie "
    }
    else if(weakE.checked){
        resultE.innerHTML="Twoje zdanie na ten temat to: slabe "
    }    
})

const changeE=document.querySelector('#change')

changeE.addEventListener('click', (e) =>{
    changeE.textContent="kolorowa jesien"
})

const coffeE = document.getElementById('coffe');
const weightE = document.getElementById('weight');
const btn2 = document.getElementById('btn2');
const result2 = document.getElementById('result2');

btn2.addEventListener('click', (e)=>{
    let cost =0;
    if(coffeE.value==1){
        cost = weightE.value*5;
    }
    if(coffeE.value==2){
        cost = weightE.value*7;
    }
    if(coffeE.value==3){
        cost = weightE.value*6;
    }
    result2.innerHTML=`Koszt zamówienia wynosi ${cost}`;
})