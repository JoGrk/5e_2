<?php
    $conn = new mysqli('localhost', 'root', '', '5e_2_podzespoly');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body> 
    <?php
    if(!empty($_POST['name']) && !empty($_POST['type']) && !empty($_POST['price'])){
        $name = $_POST['name'];
        $type = $_POST['type'];
        $price = $_POST['price'];

        $sql="INSERT INTO podzespoly (typy_id,nazwa,cena)
              VALUES($type, '$name', $price);";
        if($conn -> query($sql)){
            echo "Dodano podzespół $name";
        }
        
    }else{
        echo "Uzupełnij dane";
    }

    ?>

</body>
</html>
<?php
    $conn -> close();
?>