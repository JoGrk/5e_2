<?php
$link=new mysqli('localhost','root','','5e_2_biblioteka');
$sql="SELECT imie, nazwisko
FROM czytelnicy";
$result=$link->query($sql);
$readers=$result->fetch_all(1);
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
    
        <label for="name">Imie</label>
        <input type="text" name="name" id="name">
        <label for="surname">nazwisko</label>
        <input type="text" name="surname" id="surname">
        <label for="birthday">rok urodzenia</label>
        <input type="number" name="birthday" id="birthday">
        <button>DODAJ</button>
    </form>

    <?php
        if(!empty($_POST['name']) && !empty($_POST['surname']) && !empty($_POST['birthday'])){
            $name= $_POST['name'];
            $surname= $_POST['surname'];
            $birthday= $_POST['birthday'];
            $code= substr($name, 0, 2).substr($birthday, -2, 2).substr($surname, 0, 2);
            $code=strtolower($code);
            $sql="INSERT INTO czytelnicy(imie, nazwisko, kod)    
            VALUES ('$name', '$surname', '$code');";
            if($link->query($sql)){
                echo "Czytelnik: {$surname}  został dodany do bazy danych";
            }
             
        }
        else{
            echo " uzupełnij dane";
        }
    ?>

    <h3>nasi czytelnicy </h3>
    <ul>
        <?php 
            foreach($readers as $reader){
                echo "<li> {$reader['imie']} {$reader['nazwisko']} </li>";
            }
        ?>
    </ul>
        

    
</body>
</html>

<?php
$link->close();
?>