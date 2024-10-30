<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="usuwanie.php" method="post">
        <label for="title">Podaj tytuł książki do usunięcia</label>
        <input type="text" name="title" id="title">
        <button type="submit">Wyślij</button>
    </form>
    <?php 
    $link=new mysqli('localhost','root','','5e_2_biblioteka');

    $sql="SELECT tytul FROM ksiazki";
    $result=$link->query($sql);
    $titles=$result->fetch_all(1);

    foreach($titles as $title){
        echo "{$title['tytul']}<br>";
    }
    ?>
</body>
</html>