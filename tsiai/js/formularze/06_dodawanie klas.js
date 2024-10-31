const codeE=document.getElementById('code')
const parE=document.querySelector('.right p') 

codeE.addEventListener('change',(e)=>{
    if(codeE.checked){
        parE.classList.add("code-text") 
    }
    else{
        parE.classList.remove("code-text") 
    }

})

const fontE=document.querySelector('.font')
const fontSizeE=document.querySelector('#font-size')
const unitE=document.querySelector('#unit')

fontE.addEventListener('change',(e)=>{
    parE.style.fontSize=fontSizeE.value+unitE.value
})


