<?php
    $conn = new mysqli('localhost','root','','5e_2_biblioteka');

    if(!empty($_POST['firstname']) && !empty($_POST['surname'])){
        $firstname = $_POST['firstname'];
        $surname = $_POST['surname'];

        $sql = "select tytul 
from ksiazki 
inner join wypozyczenia
 on ksiazki.id = wypozyczenia.id_ksiazka
inner join czytelnicy
 on wypozyczenia.id_czytelnik = czytelnicy.id
where imie = '$firstname' and nazwisko = '$surname';";

        $result = $conn -> query($sql);
        $readers = $result -> fetch_all(1);
    };

    $conn -> close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="POST">
        <label for="firstname">imie</label>
        <input type="text" id='firstname' name="firstname"><br>
        <label for="surname">nazwisko</label>
        <input type="text" id='surname' name="surname"><br>
        <button>wyslij</button>
    </form>

    <h3>tytuly ksiazek</h3>
    <?php
        foreach($readers as $reader){
            echo "<p> {$reader['tytul']} </p>";
        };
    ?>
</body>
</html>