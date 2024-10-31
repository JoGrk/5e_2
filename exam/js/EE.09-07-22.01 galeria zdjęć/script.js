const imgEArray = document.querySelectorAll('.left img')
const imgEMain = document.querySelector('main img')
const iconE = document.querySelector ('.right img')

let heartOn = false

iconE.addEventListener('click', (e) =>{
    if(heartOn){
       heartOn = false;
       iconE.src = 'icon-off.png'
    }
    else{
        heartOn = true;
        iconE.src = 'icon-on.png'
    }
    })
for(let imgE of imgEArray){
    
    imgE.addEventListener('click', (e) =>{
        imgEMain.src = imgE.src
    })
}

