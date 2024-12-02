<?php
    $link= new mysqli('localhost','root','','5e_2_motory');
    $sql="SELECT nazwa, opis, poczatek, zrodlo
        FROM wycieczki
            JOIN zdjecia ON wycieczki.zdjecia_id=zdjecia.id;";
    $result=$link->query($sql);
    $informations=$result->fetch_all(1);

    
    $sql="SELECT COUNT(*) AS ilosc FROM wycieczki;";
    $result=$link->query($sql);
    $count=$result->fetch_array();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Motocykle</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <img src="motor.png" alt="motocykl" class="motor">
    <header>
        <h1>Motocykle - moja pasja</h1>
    </header>
    <main>
        <div class="left">
            <h2>Gdzie pojechać?</h2>
            <dl>
                <!-- <dt>
                    NAZWA, rozpoczyna się w POCZĄTEK,
                    <a href='ZRODLO.jpg'>zobacz zdjęcie</a>
                </dt>
                <dd>
                    OPIS
                </dd> -->
                <?php
                    foreach($informations as $info){
                        echo "
                            <dt>
                                {$info['nazwa']}, rozpoczyna się w {$info['poczatek']},
                                <a href='{$info['zrodlo']}.jpg'>zobacz zdjęcie</a>
                            </dt>
                            <dd>
                                {$info['opis']}
                            </dd>
                        ";
                    }
                ?>
            </dl>
        </div>
        <article>
            <div class="r1">
                <h2>Co kupić?</h2>
                <ol>
                    <li>Honda CBR125R</li>
                    <li>Yamaha YBR125</li>
                    <li>Honda VFR800i</li>
                    <li>Honda CBR1100XX</li>
                    <li>BMW R1200GS LC</li>
                </ol>
            </div>
            <div class="r2">
                <h2>Statystyki</h2>
                <p>
                    Wpisanych wycieczek: 
                    <?php
                        echo $count['ilosc'];
                    ?>
                </p>
                <p>Użytkowników forum: 200</p>
                <p>Przesłanych zdjęć: 1300</p>
            </div>
        </article>
    </main>
    <footer>
        <p>Stonę wykonał: ja</p>
    </footer>
</body>
</html>

<?php
    $link->close();
?>