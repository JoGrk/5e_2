<?php 
$link= new mysqli('localhost','root','','5e_2_galeria');
/////skrypt1
$sql="SELECT plik,tytul,polubienia ,imie,nazwisko
FROM zdjecia 
INNER JOIN autorzy ON zdjecia.autorzy_id=autorzy.id
ORDER BY nazwisko  ;";
$result=$link->query($sql);
$pictures=$result->fetch_all(1);

////skrypt2
$sql2="SELECT tytul,plik 
FROM zdjecia 
WHERE polubienia >=100;";
$result=$link->query($sql2);
$pictures2=$result->fetch_all(1);


$link->close();
?>



<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galeria</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header>
        <h1>Zdjęcia</h1>
    </header>
    <section id="left">
        <h2>Tematy zdjęć</h2>
        <ol>
            <li>Zwierzęta</li>
            <li>Krajobrazy</li>
            <li>Miasta</li>
            <li>Przyroda</li>
            <li>Samochody</li>
        </ol>
    </section>
    <section id="mid">
        <!-- <div class="block">
            <img src='PLIK' alt='zdjecie'>
            <h3>TYTUL</h3>
            if(POLUBIENIA>40){
                <p>Autor:IMIE NAZWISKO.<br>
                wiele osob polubilo ten obraz</p>
                
            }
            else{
                <p>Autor:IMIE NAZWISKO</p>
            }
            <a href="PLIK" download>Pobierz</a>
        </div> -->
        <?php 
            foreach($pictures as $picture){
                echo"
                    <div class='block'>
                         <img src='{$picture['plik']}' alt='zdjecie'>
                        <h3>{$picture['tytul']}</h3>
                    ";
                if($picture['polubienia']>40){
                    echo "
                        <p>Autor:{$picture['imie']} {$picture['nazwisko']}.<br>
                        wiele osob polubilo ten obraz</p>
                    ";
                    
                
                }
                else{
                    echo "
                        <p>Autor:{$picture['imie']} {$picture['nazwisko']}</p>
                    ";
                        
                    };
                
                echo "
                    <a href='{$picture['plik']}' download>Pobierz</a>
            
                </div>";

            }
        ?>
    </section>
    <section id="right">
        <h2>Najbardziej lubiane</h2>
        <!-- script 2 -->
        <strong>Zobacz wszystkie nasze zdjęcia</strong>
    </section>
    <footer>
    <h5>Stronę wykonał: ja</h5>
    </footer>
</body>
</html>