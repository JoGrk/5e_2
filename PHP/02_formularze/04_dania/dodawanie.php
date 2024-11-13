<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php 
    $link = new mysqli('localhost','root','','5e_2_dania');

    if(!empty($_POST['typeMeal']) && !empty($_POST['price']) && !empty($_POST['name'])){
        $typMeal=$_POST['typeMeal'];
        $price=$_POST['price'];
        $name=$_POST['name'];

        $sql="INSERT INTO dania(typ, nazwa, cena)
        VALUES ($typMeal, '$name', $price);";
        if($link -> query($sql) ){
            echo "Nowe danie zostało dodane";
        }
        else{
            echo "Błąd przy dodawaniu";
        }

    }
    ?>
</body>
</html>
<?php 
$link->close();
?>