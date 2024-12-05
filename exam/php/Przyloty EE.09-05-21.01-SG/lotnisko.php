
<?php
$link = new mysqli ('localhost','root','','egzamin');
$sql = "SELECT czas, kierunek, nr_rejsu, status_lotu
FROM przyloty
ORDER BY czas;";
$result = $link -> query($sql);
$przyloty = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Port Lotniczy</title>
    <link rel="stylesheet" href="styl1.css">
</head>
<body>
    <header>
        <section class="header1">
            <img src="zad5.png" alt="logo lotnisko">
        </section>

        <section class="header2">
            <h1>Przyloty</h1>
        </section>

        <section class="header3">
            <h3>przydatne linki</h3>
            <a href="kwerendy.txt">Pobierz...</a>
        </section>
    </header>
    
    <main>
        <table>
            <tr>
                <th>czas</th>
                <th>kierunek</th>
                <th>numer rejsu</th>
                <th>status</th>
            </tr>
            <?php
            foreach($przyloty as $przylot){
                echo "
                    <tr>
                    <td>{$przylot['czas']}</td>
                    <td>{$przylot['kierunek']}</td>
                    <td>{$przylot['nr_rejsu']}</td>
                    <td>{$przylot['status_lotu']}</td>
                    </tr>
                ";
            }
            ?>
        </table>
    </main>

    <footer>
        <section class="footer1">
            <?php
                if(!isset($_COOKIE['kukis'])){
                    setcookie('kukis','1', time()+2*3600);
                    echo  "<p>Dzień dobry! Strona lotniska używa ciasteczek</p>";
                }
                else{
                    setcookie('kukis','1', time()+2*3600);
                    echo "<p><em>Witaj ponownie na stronie lotniska</em></p>";
                }
            ?>
        </section>

        <section class="footer2">
            <h2>Autor: 000000000000000</h2>
        </section>
    </footer>
</body>
</html>
<?php
$link -> close()
?>