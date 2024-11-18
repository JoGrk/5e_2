<?php 
    $link=new mysqli('localhost','root','','5e_2_portal');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post">
        <label for="login">Login</label>
        <input type="text" name="login" id="login"><br>
        <label for="password">Hasło</label>
        <input type="password" name="password" id="password"><br>
        <button type="submit">Zaloguj</button>
    </form>

    <section class="wiz">
        <?php 
            if(!empty($_POST['login']) && !empty($_POST['password'])){
                $login=$_POST['login'];
                $password=$_POST['password'];
                $sql="SELECT haslo
                FROM uzytkownicy
                WHERE login='$login';";
                $result=$link->query($sql);
                if($result->num_rows>0){
                    // jest login
                    $row=$result->fetch_assoc();
                    $password=sha1($password);
                    if($password==$row['haslo']){
                        $sql="SELECT login,rok_urodz,przyjaciol,hobby,zdjecie
                        FROM uzytkownicy
                            INNER JOIN dane ON dane.id=uzytkownicy.id
                        WHERE login='$login';";
                        $result=$link->query($sql);
                        $users=$result->fetch_all(1);
                        foreach($users as $user){
                            echo "<div>";
                            // tutaj wypisujemy wizytówkę śmieciu 
                            echo" ";
                           echo "</div>";
                        }
                    }
                }
                else{
                    echo "Login nie istnieje"
                }
            }
        ?>
    </section>
    <img src='o6.jpg' alt='osoba'>
    <h4>Login (wiek)</h4>
    <p>Hobby</p>
    <h1><img src='icon-on.png' alt='heart'></h1>
    <button><a href="dane.html"></a>Więcej informacji</button>
</body>
</html>
<?php 
    $link->close();
?>