<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>


    <?php
        if(!isset($_COOKIE['login']) && empty($_POST['login'])){
            echo "
                <form method='post'>
                    <input type='text' name='login' id='login' placeholder='podaj imię'>
                    <button>Wyślij</button>
                </form>
            ";
        }
        else if(!isset($_COOKIE['login']) && !empty($_POST['login'])){
            $login=$_POST['login'];
            setcookie('login', $login, time()+2);
            echo "Witaj użytkowniku <b>$login</b>";
        }
        if(isset($_COOKIE['login'])){
            echo "Witaj użytkowniku <b>{$_COOKIE['login']}</b>";
        }
    ?>
</body>
</html>