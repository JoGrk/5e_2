const btnClient = document.getElementById('client')
const btnAddress = document.getElementById('address')
const btnContact = document.getElementById('client')
const block1E = document.getElementById('block1')
const block2E = document.getElementById('block2')
const block3E = document.getElementById('block3')


btnClient.addEventListener('click',(e)=>{
    block1E.classList.remove('hidden')
    block1E.classList.add('hidden')
    block1E.classList.add('hidden')
})


btnAddress.addEventListener('click',(e)=>{
    block1E.classList.add('hidden')
    block1E.classList.remove('hidden')
    block1E.classList.add('hidden')
})

btnContact.addEventListener('click',(e)=>{
    block1E.classList.add('hidden')
    block1E.classList.add('hidden')
    block1E.classList.remove('hidden')
})