// const btnE=document.querySelector('button')
// const pillingE=document.getElementById('piling')
// const maskE=document.getElementById('mask')
// const massageE=document.getElementById('massage')
// const eyebrowE=document.getElementById('eyebrow')
// const resE=document.getElementById('result')

const inputsE=document.querySelectorAll('.right-bottom input')
const btnE=document.querySelector('button')

btnE.addEventListener('click',(e)=>{
   let price=0
   let inputE;
   for(inputE of inputsE ){
    if(inputE.checked){
        price+=Number(inputE.value)
    }
   }
   result.innerHTML=`cena zabiegow ${price} zł`
})



// btnE.addEventListener('click',(e)=>{
//     let price=0

//     if(pillingE.checked){
//         price+=45;
//     }
//     if(maskE.checked){
//         price+=30;
//     }
//     if(massageE.checked){
//         price+=20;
//     }
//     if(eyebrowE.checked){
//         price+=5
//     }
//     resE.innerHTML=`cena zabiegow ${price} zł`
// })