const pointsE=document.getElementById('points')
const btnE=document.getElementById('btn')
const pE=document.getElementById('p')

btnE.addEventListener('click',(e)=>{
   let speed = Number(pointsE.value)

   if(speed > 50){
    pE.innerHTML=`utrata 16 punktów karnych`
   }
   else if(speed > 40){
    pE.innerHTML=`utrata 13 punktów karnych`
   }
   else if(speed >30){
    pE.innerHTML=`utrata 10 punktów karnych`
   }
   else {
    pE.innerHTML=`brak utraty punktów`
   }
   
})