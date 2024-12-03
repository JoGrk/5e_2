const btnE=document.getElementById('btn')
const btn2E=document.getElementById('btn2')
const zatE=document.getElementById('zat')
const blok1E=document.getElementById('blok1')
const blok2E=document.getElementById('blok2')
const blok3E=document.getElementById('blok3')
const firstNameE=document.getElementById('firstName')
const surNameE=document.getElementById('surName')



btnE.addEventListener('click',(e)=>{
    e.preventDefault()
    blok1E.style.visibility='hidden'
    blok2E.style.visibility=`visible`

})

btn2E.addEventListener('click',(e)=>{
    e.preventDefault()
    blok2E.style.visibility='hidden'
    blok3E.style.visibility=`visible`
})
zatE.addEventListener('click',(e)=>{
    e.preventDefault()
    const passE=document.getElementById('pass')
    const pass2E=document.getElementById('pass2')
    firstName=firstNameE.value
    surName=surNameE.value
    pass=passE.value
    pass2=pass2E.value
    if(pass!=pass2){
        Alert('Podane hasła różnią się')
    }
        console.log(`Witaj ${firstName} ${surName}`)
})