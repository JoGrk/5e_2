const quantityArrayE=document.querySelectorAll('.quantity')
const updateArrayE=document.querySelectorAll('.update')
const orderArrayE=document.querySelectorAll('.order')

let orderID=0;

function checkQuantity(){
    quantityArrayE.forEach((quantityE) => {
       let quantity=Number(quantityE.innerHTML)
        if(quantity==0){
            quantityE.style.backgroundColor="red"  
        }
        else if(quantity<=5){
            quantityE.style.backgroundColor="yellow"  
        }
        else{
            quantityE.style.backgroundColor="Honeydew"  
        }
    });
}
checkQuantity()




updateArrayE.forEach((updateButton, index)=>{
    updateButton.addEventListener('click',(e)=>{
        let wartosc=Number(prompt('Podaj nowa ilosc:'))
         quantityArrayE[index].innerHTML =wartosc; 
         checkQuantity()
    })
})

