<!-- 2. Formularz z grupą opcji wydawnictwo. Wyświetla książki wybranego wydawnictwa w postaci elementów listy wypunktowanej -->

<?php
$link=new mysqli('localhost', 'root', '', '5e_2_biblioteka');
$sql = "SELECT id, nazwa
FROM wydawnictwa;";
$result = $link -> query($sql);
$wydawnictwa = $result -> fetch_all(1);


?>
<!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 </head>
 <body>
    <form method="POST">
      <!-- <label><input type="radio" name="wydawnictwo" value="1">Amber</label><br>  -->
    <?php
        foreach($wydawnictwa as $wydawnictwo){
            echo "<label>
                <input type='radio' name='wydawnictwo' value='{$wydawnictwo['id']}'>{$wydawnictwo['nazwa']}
                </label><br>";
        }
    ?>
      <button>Wyślij</button>  
    </form>
    <?php
        if(!empty($_POST['wydawnictwo'])){
            $id = $_POST['wydawnictwo'];
            $sql = "SELECT tytul FROM ksiazki WHERE ID_wydawnictwo = $id;";
            $result = $link -> query($sql);
            $titles = $result -> fetch_all(1);
            echo "<ul>";
            foreach($titles as $title){
                echo "<li>{$title['tytul']}</li>";

            }
            echo "</ul>";     
        }

    ?>
 </body>
 </html>
 <?php

$link->close();
?>