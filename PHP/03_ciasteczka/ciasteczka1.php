<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    setcookie('nazwa','witam na stronie',time()+10);
    
    if(isset($_COOKIE['nazwa'])){
        echo $_COOKIE['nazwa'];
    }
    ?>
</body>
</html>