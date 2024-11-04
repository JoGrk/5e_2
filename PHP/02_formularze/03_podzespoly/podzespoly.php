<?php
$link=new mysqli('localhost','root','','5e_2_podzespoly');
$sql="SELECT nazwa,cena 
FROM podzespoly";
$result=$link->query($sql);
$podzespoly=$result->fetch_all(1);


$link -> close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<body>
<h1>lista podzespolow</h1>

<ul>
    <?php
    foreach($podzespoly as $podzespol){
        echo "<li>
                <b>{$podzespol['nazwa']}</b>
                    {$podzespol['cena']}
                
            </li>";
    }
    ?>
   
</ul>
  <form action="dodawanie.php" method="post">
    <label for="type">id_typu</label>
    <input type="number" name="type" id="type"><br>
    <label for="name">Nazwy</label>
    <input type="text" name="name" id="name"><br>
    <label for="price">Cena</label>
    <input type="number" name="price" id="price"><br>
    <button>Wyslij</button>


  </form>  


</body>
</html>