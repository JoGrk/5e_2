const loremE=document.querySelector('#lorem')
const sizeE=document.querySelector('#size')
const italicE=document.querySelector('#italic')
const btnE=document.querySelector('#btn')

btnE.addEventListener('click', (e)=>{
    let s=sizeE.value
    loremE.style.fontSize=`${s}px`

})