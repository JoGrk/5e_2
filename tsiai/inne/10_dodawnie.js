const formE=document.querySelector('.left form');
const taskE=document.getElementById('task')
const ulE=document.querySelector('.right ul')

formE.addEventListener('submit',(e)=>{
    e.preventDefault()
    ///console.log(taskE.value)
    let liE = document.createElement("li");
    
     if(taskE.value.length>2){
        liE.innerHTML=taskE.value
        ulE.appendChild(liE);
        taskE.value=""
       
    }


})

