const  goldE=document.querySelector('#gold')
const  silverE=document.querySelector('#silver')
const  noneE=document.querySelector('#none')
const  btnE=document.querySelector('#btn')
const  resultE=document.querySelector('#result')
const priceE=document.querySelector('#price')
const h1E=document.querySelector('h1')

btnE.addEventListener('click', (e)=>{
    let price = Number(priceE.value)
    if(goldE.checked){
        price = price*0.8
    }
    else if(silverE.checked){
        price = price*0.9
    }
    resultE.innerHTML=`cena z uwzględnieniem rabatu to: ${price}`
})
 h1E.addEventListener('mouseover',(e)=>{
    h1E.innerHTML=`deszcz `
    h1E.style.color="grey"

 })
 h1E.addEventListener('mouseout',(e)=>{
    h1E.innerHTML=`taka pogoda`
    h1E.style.color="black"
 })


const paragrafE=document.getElementById('paragraf')
 const sizeE=document.getElementById('size')

 sizeE.addEventListener('change',(e)=>{
    paragrafE.style.fontSize=sizeE.value + "%"
 })


const listE=document.querySelector('#list')
const redE=document.getElementById('red')
const greenE=document.getElementById('green')
const blueE=document.getElementById('blue')

 listE.addEventListener('change',(e)=>{
    paragrafE.style.fontStyle=listE.value
 })

redE.addEventListener('click',(e)=>{
    paragrafE.style.color='red'
})
greenE.addEventListener('click',(e)=>{
    paragrafE.style.color='green'
})
blueE.addEventListener('click',(e)=>{
    paragrafE.style.color='blue'
})
 

 