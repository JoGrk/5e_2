
<?php
$link = new mysqli ('localhost','root','','rzeki');
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poziomy rzek</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header>
        <section class='h1'>
            <img src="obraz1.png " alt="Mapa Polski">
        </section>
        <section class='h2'>
            <h1>Rzeki w województwie
            dolnośląskim</h1>
        </section>
    </header>
    <nav>
        <form action="" method="post">
            
            <input type="radio" name="form" id="all"  value='all'>
            <label for="all" class="label">„Wszystkie”</label>
            <input type="radio" name="form" id="warning" value='warning'>
            <label for="warning" class="label">„Ponad stan ostrzegawczy</label>
            <input type="radio" name="form" id="alarm" value='alarm'>
            <label for="alarm" class="label">Ponad stan alarmowy”</label>
            <button>Wyślij</button>
        </form>
    </nav>
    <main>
        <section class='left'>
            <h3>Stany na dzień 2022-05-05</h3>
            <table>
                <tr>
                    <th>Wodomierz</th>
                    <th>Rzeka</th>
                    <th>Ostrzegawczy</th>
                    <th>Alarmowy</th>
                    <th>Aktualny</th>
                    <!-- skrypt -->
                </tr>
                <?php
                    
                    if(!empty($_POST['form'])){
                        $form = $_POST['form'];
                        if($form == 'all'){
                            $sql = "select nazwa, rzeka, stanOstrzegawczy, stanAlarmowy 
                            from wodowskazy
                            inner join pomiary
                            on pomiary.wodowskazy_id = wodowskazy.id
                            where dataPomiaru = '2022-05-05';";
                        }
                        else if($form == 'warning'){
                            $sql = "select nazwa, rzeka, stanOstrzegawczy, stanAlarmowy 
                                        from wodowskazy
                                        inner join pomiary
                                        on pomiary.wodowskazy_id = wodowskazy.id
                                        where dataPomiaru = '2022-05-05'
                                        and stanWody > stanOstrzegawczy;";
                        }
                        else if($form == 'alarm'){
                            $sql = "select nazwa, rzeka, stanOstrzegawczy, stanAlarmowy 
                                        from wodowskazy
                                        inner join pomiary
                                        on pomiary.wodowskazy_id = wodowskazy.id
                                        where dataPomiaru = '2022-05-05'
                                        and stanWody > stanAlarmowy;";
                                                                    
                        }

                        $result = $link -> query($sql);
                        $stany = $result -> fetch_all(1);
                        foreach($stany as $stan){
                            echo "<tr>";
                            foreach($stan as $state){
                                echo "<td>$state</td>";
                            }
                            echo "</tr>";
                        }
                    }
                    
                ?>
            </table>
        </section>
        <section class='right'>
            <h3>Informacje</h3>
            <ul>
                <li>Brak ostrzeżeń o burzach
                z gradem</li>
                <li>Smog w mieście Wrocław</li>
                <li>Silny wiatr w Karkonoszach</li>
            </ul>
            <h3>Średnie stany wód</h3>
                <!-- skrypt 2 -->
            <a href="https://komunikaty.pl">Dowiedz się więcej</a>
            <img src="obraz2.jpg" alt="rzeka">
        </section>
    </main>
    <footer>
        <p>Stronę wykonał: 0000000</p>
    </footer>
</body>
</html>



















































































































<?php
$link -> close()
?>