<?php
    $link= new mysqli('localhost','root','','biblioteka');
    $sql="SELECT imie, nazwisko
    FROM autorzy
    ORDER BY nazwisko ASC;";
    $result=$link->query($sql);
    $autorzy=$result->fetch_all(1);
    $link->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ol>
        <?php 
            foreach($autorzy as $autor){
                echo "<li>{$autor['imie']} {$autor['nazwisko']}</li>";
            }
        ?>
    </ol>
</body>
</html>