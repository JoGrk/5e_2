<?php
$link=new mysqli('localhost', 'root', '', '5e_2_biblioteka');
$sql="select id, imie ,nazwisko 
FROM autorzy;";
$result=$link->query($sql);
$authors=$result->fetch_all(1);

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
        <select name="authorlist" id="authorlist">
            <!-- <option value="1">Błazej Pawlinski</option> -->
            <?php
                foreach($authors as $author){
                    echo "<option value='{$author['id']}'>{$author['imie']} {$author['nazwisko']}</option>";
                }
            ?>
        </select>
        <button>Wyślij</button>
    </form>
    <?php

       if (!empty($_POST['authorlist'])){
        $id = $_POST['authorlist'];
        $sql="SELECT tytul, imie, nazwisko FROM ksiazki 
                JOIN autorzy ON ksiazki.id_autor = autorzy.id  
                WHERE id_autor = $id;";
        $result = $link->query($sql);
        $books = $result->fetch_all(1);
        echo "<table border='1'>";
        foreach($books as $book){
            echo "<tr>";
            echo "<td> {$book['imie']} </td>";
            echo "<td> {$book['nazwisko']} </td>";
            echo "<td> {$book['tytul']} </td>";
            echo "</tr>";
        }
        echo "</table>";
       }
    ?>
</body>
</html>
<?php 
$link->close();
?>