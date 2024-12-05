<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        if(!isset($_COOKIE['licznik'])){
            setcookie('licznik', 1, time()+15);
            echo '1';
        }
        else{
            echo $_COOKIE['licznik']+1;
            setcookie('licznik', $_COOKIE['licznik']+1, time()+15);
        }

    ?>
</body>
</html>