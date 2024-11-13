<?php
    $link = new mysqli('localhost', 'root', '', '5e_2_dania');
    $sql="SELECT id,nazwa
    FROM typy_dan;";
    $result=$link->query($sql);
    $typydan=$result->fetch_all(1);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="dodawanie.php" method='POST'>
        <!-- <input type='radio' name='typeMeal' value=''> <br> -->
        <?php
        foreach($typydan as $typdania){
            echo "
                <input type='radio' name='typeMeal' 
                value='{$typdania['id']}'>
                {$typdania['nazwa']} <br>
                ";
        }
        ?>

        <label for="price">Podaj cene:</label>
        <input type="number" name="price" id="price"> <br>

        <label for="name">Podaj nazwe dania</label> 
        <input type="text" name="name" id="name">  <br>
        <button>Wyslij</button>
    </form>
</body>
</html>
<?php
    $link -> close();
?>