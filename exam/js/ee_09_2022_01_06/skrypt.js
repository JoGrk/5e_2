const rightE=document.querySelector('.right')
const indigoE=document.querySelector('#indigo')
const steelBlueE=document.querySelector('#steelblue')
const oliveE=document.querySelector('#olive')
const fontColorE=document.querySelector('#font-color')
const sizeE=document.querySelector('#size')
const frameE=document.querySelector('#frame')
const imgE=document.querySelector('.right img')

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

sizeE.addEventListener('change',(e)=>{
    rightE.style.fontSize=sizeE.value;

})
frameE.addEventListener('change', (e)=>{
    if(frameE.checked){
        imgE.style.border='1px solid white';
    }
    else{
        imgE.style.border='none';
    }
})

const listE = document.getElementById('lista')
const ulE = document.querySelector('.right ul')

listE.addEventListener('click', (e)=>{
   
    const typeE = document.querySelector('input[name="type"]:checked')
    console.dir(ulE)
    ulE.style.listStyleType = typeE.value
})