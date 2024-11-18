<?php
$link = new mysqli ('localhost','root','','pikla_norzna');
$sql = "SELECT zespol1, zespol2, wynik, data_rozgrywki
                FROM rozgrywka 
                WHERE zespol1 = 'EVG';";
$result = $link -> query($sql);
$rozgrywki = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rozgrywki futbolowe</title>
    <link rel="stylesheet" href="styl1.css">
</head>
<body>
    <header>
        <h2>Światowe rozgrywki piłkarskie</h2>
        <img src="./obraz1.jpg" alt="boisko">
    </header>

    <section class="mecze">
        <?php
        foreach($rozgrywki as $rozgrywka){
            echo "
                <div class='block'>
                    <h3>{$rozgrywka['zespol1']} - {$rozgrywka['zespol2']}</h3>
                    <h4>{$rozgrywka['wynik']}</h4>
                    <p>w dniu: {$rozgrywka['data_rozgrywki']}</p>
                </div>";
        }

        
        

        ?>
        <!-- <div class='block'>
            <h3><zespół 1> - <zespół 2></h3>
            <h4>Wynik</h4>
            <p>w dniu: <data rozgrywki></p>
        </div> -->
    </section>

    <main>
        <h2>Reprezentacja Polski</h2>
    </main>
    <footer>
        <section class="left">
            <p>Podaj pozycję zawodników (1-bramkarze, 2-obrońcy, 3-pomocnicy, 4-napastnicy):</p>
            <form action="" method="post">
                <input type="number" name="position" id="position">
               <button>Sprawdź</button>
            </form>
            <ul>
            <?php
            if(!empty($_POST['position'])){
                $position=$_POST['position'];
                $sql="SELECT imie, nazwisko
                    FROM zawodnik 
                    WHERE pozycja_id =$position;";
                $result=$link->query($sql);
                $zawodnicy=$result->fetch_all(1);  
                echo "<ul>"; 
                foreach($zawodnicy as $zawodnik){
                 echo " <li>
                        <p>{$zawodnik['imie']} {$zawodnik['nazwisko']} </p>
                     </li>";       
                }
                echo "</ul> ";
            }
            ?>
            </ul>
        </section>
        <section class="right">
            <img src="./zad1.png" alt="piłkarz">
            <p>Autor: 000000000000</p>
        </section>
    </footer>
</body>
</html>
<?php
$link ->close()
?>