const changeE=document.getElementById('change')
const treeE=document.getElementById('tree')
const bushE=document.getElementById('bush')
const perennialsE=document.getElementById('perennials')
const btnE=document.getElementById('btn')
const resultE=document.getElementById('result')





changeE.addEventListener('click',(e)=>{
    changeE.innerHTML="kolorowa jesien"
    changeE.style.color="red"
})

btnE.addEventListener('click',(e)=>{
    if (treeE.checked){
        resultE.innerHTML="Koszt to 500zł"
    }
    else if(bushE.checked){
        resultE.innerHTML="koszt to 300zł"
    }
    else if(perennialsE.checked){
        resultE.innerHTML="koszt to 150zł"
    }
        
    
})

const resultFE=document.getElementById('resultF')
const serviceE=document.getElementById('service')
const submitE=document.getElementById('submit')
const copyE=document.getElementById('copy')
const emailE=document.getElementById('e-mail')

submitE.addEventListener('click',(e)=>{
    e.preventDefault()
    let service=serviceE.value
    let email=emailE.value
    if(copyE.checked){
        resultFE.innerHTML=`${email}<br> Usługa ${service} wysłano z kopią`
    }
    else{
        resultFE.innerHTML=`${email}<br> Usługa ${service}`
    }
})