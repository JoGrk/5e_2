<?php
$link = new mysqli ('localhost','root','','5e_2')

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rozgrywki futbolowe</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header>
        <h2>Światowe rozgrywki piłkarskie</h2>
        <img src="./obraz1.jpg" alt="boisko">
    </header>

    <section class="mecze"></section>

    <main>
        <h2>Reprezentacja Polski</h2>
    </main>
    <footer>
        <section class="left">
            <p>Podaj pozycję zawodników (1-bramkarze, 2-obrońcy, 3-pomocnicy, 4-napastnicy):</p>
            <form action="" method="post">
                <input type="number" name="" id="">
               <button>Sprawdź</button>
            </form>
            <ul>

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