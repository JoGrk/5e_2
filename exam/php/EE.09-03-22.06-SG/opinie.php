<?php
$link = new mysqli ('localhost','root','','hurtownia');
$sql = "SELECT zdjecie, imie, opinia
FROM Klienci 
    JOIN opinie ON klienci.id = opinie.Klienci_id
WHERE Typy_id IN (2,3);";
$result = $link -> query($sql);
$customers1 = $result -> fetch_all(1);

$sql = "SELECT nazwa, COUNT(*)
FROM Typy
    INNER JOIN Klienci ON Klienci.typy_id = typy.id
GROUP BY nazwa;";

$result = $link -> query($sql);
$customers2 = $result -> fetch_all(1); 
$link -> close();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opinie klientów</title>
    <link rel="stylesheet" href="styl3.css">
</head>
<body>
    <header>
        <h1>Hurtownia spożywcza</h1>
    </header>
    <main>
        <h2>Opinie naszych klientów</h2>
        <!-- skrypt 1 -->

    </main>
    <footer>
        <section class="f1">
            <h3>Współpracują z nami</h3>
            <a href="http://sklep.pl/">Sklep1</a>
        </section>
        <section class="f2">
            <h3>Nasi top klienci</h3>
            <ol>
                <!-- skrypt 2 -->
            </ol>
        </section>
        <section class="f3">
            <h3>Skontaktuj się</h3>
            <p>telefon: 111222333</p>
        </section>
        <section class="f4">
            <h3>Autor: 00000000000000</h3>
        </section>
    </footer>


</body>
</html>