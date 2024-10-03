const rightE=document.querySelector('.right')
const indigoE=document.querySelector('#indigo')
const steelBlueE=document.querySelector('#steelblue')
const oliveE=document.querySelector('#olive')
const fontColorE=document.querySelector('#font-color')
indigoE.addEventListener('click',(e)=>{
    rightE.style.backgroundColor="indigo"
});
steelBlueE.addEventListener('click',(e)=>{
    rightE.style.backgroundColor="steelblue"
});
oliveE.addEventListener('click',(e)=>{
    rightE.style.backgroundColor="olive"
});

fontColorE.addEventListener('click',(e) =>{
    rightE.style.color=fontColorE.value
})
