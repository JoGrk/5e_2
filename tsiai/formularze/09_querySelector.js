const linkE = document.querySelector('input[type="text"]')
const imgE = document.querySelector('aside img')
const div1E = document.querySelector('nav div:first-child')
const div2E = document.querySelector('nav div:first-child+div')
const div3E = document.querySelector('nav div:last-child')
const pArrayE = document.querySelectorall('aside p')

linkE.addEventListener('change',(e)=>{
    imgE.src=linkE.value
})

div2E.addEventListener('change', (e)=>{
    let hue = document.querySelector('input[name="color"]:checked').value
    div1E.style.backgroundColor=`hsl(${hue}, 50%, 80%)`
    div2E.style.backgroundColor=`hsl(${hue}, 50%, 60%)`
    div3E.style.backgroundColor=`hsl(${hue}, 50%, 40%)`
    console.log('pArrayE')
     
})


