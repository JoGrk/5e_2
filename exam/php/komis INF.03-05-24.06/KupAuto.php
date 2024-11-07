<?php
    $link = new mysqli('localhost', 'root', '', 'kupauto');
    $sql = "SELECT model, rocznik, przebieg, paliwo, cena, zdjecie
            FROM samochody
            WHERE id=10;";
    $result=$link->query($sql);
    $cars=$result->fetch_all(1);

    $sql = "SELECT nazwa, model, rocznik, cena, zdjecie
                    FROM samochody 
                    JOIN marki ON samochody.marki_id = marki.id 
                    WHERE wyrozniony = 1
                    LIMIT 4;";
    $result = $link->query($sql);
    $special_cars = $result-> fetch_all(1);

    $sql="SELECT nazwa 
    FROM marki;
    ";
    $result=$link->query($sql);
    $names=$result->fetch_all(1);
    
    


    
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styl.css">
    <title>Document</title>
</head>
<body>
    <header>
        <h1><em>KupAuto!</em> Internetowy Komis Samochodowy</h1>
    </header>

    <!-- <img src='' alt='oferta dnia'>
    <h4>Oferta Dnia: Toyota</h4>
    <p>Rocznik: Przebieg: Rodzaj paliwa: </p>
    <h4>Cena</h4> -->

    <article id="main1">
        <!-- script 1 -->
    <?php
        foreach($cars as $car){
            echo "
                <img src='{$car['zdjecie']}' alt='oferta dnia'>
                <h4>Oferta Dnia: Toyota {$car['model']}</h4>
                <p>
                    Rocznik: {$car['rocznik']}
                    Przebieg: {$car['przebieg']}
                    Rodzaj paliwa: {$car['paliwo']}
                 </p>
                <h4>Cena {$car['cena']}</h4>
            ";
        }
    ?>

    </article>

    <article id="main2">
        <h2>Oferty wyróżnione</h2>
        <div class="flex">
            <!-- script 2 -->
           
             <?php
             foreach($special_cars as $s_car){
                echo " 
                <div class='block'>
                    <img src='{$s_car['zdjecie']}' alt='{$s_car['model']}'>
                    <h4>{$s_car['nazwa']} {$s_car['model']}</h4>
                    <p>Rocznik: {$s_car['rocznik']} </p>
                    <h4>Cena: {$s_car['cena']} </h4>
                </div>
                ";
             }
             ?>
        </div>
        
    </article>

    <article id="main3">
        <h2>Wybierz markę</h2>
        <form method="post">
            <select name="markName" id="markName">
                
                <!-- skrypt 3 -->
                <?php 
                    foreach($names as $name){
                        echo "<option value='{$name['nazwa']}'>{$name['nazwa']}</option>";
                    }
                ?>
            </select>
            <button>Wyszukaj</button>
        </form>
        <div class="flex">
            <!-- skrypt 4 -->
            <?php
                if(!empty($_POST['markName'])){
                    $name =$_POST['markName'];
                    $sql="SELECT nazwa, model, cena, zdjecie FROM samochody
                        JOIN marki ON samochody.marki_id = marki.id 
                    WHERE nazwa='$name';";
                    $result = $link->query($sql);
                    $cars2=$result->fetch_all(1);
                    foreach($cars2 as $car){
                        echo "
                            <div class='block'>
                                <img src='{$car['zdjecie']}' alt='{$car['model']}'>
                                <h4>{$car['nazwa']} {$car['model']}</h4>
                                <h4>Cena: {$car['cena']}</h4>
                            </div>
                        ";
                    }
                }
            ?>
        </div>
         
    </article>

    <footer>
        <p>Strone wykonał 00</p>
        <p><a href="http://firmy.pl/komis">znajdz nas także</a></p>
    </footer>
</body>
</html>

<?php
    $link -> close();

?>