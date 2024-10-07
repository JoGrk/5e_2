<?php
    $link = new mysqli('localhost','root','','5e_2_terminarz');
    $sql="SELECT DISTINCT wpis
        from zadania
        WHERE dataZadania BETWEEN '2020-07-01' AND '2020-07-07'
        AND
        wpis IS NOT NULL
        AND
        wpis !='';";
    $result= $link -> query($sql);
    $tasks1= $result -> fetch_all(1);

    $sql="SELECT dataZadania, wpis
        FROM zadania
        WHERE miesiac='lipiec';";
    $result= $link -> query($sql);
    $tasks2= $result -> fetch_all(1);
    $link->close();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styl6.css">
</head>
<body>
    <header>
        <section id="left">
            <img src="logo1.png" alt="lipiec">
        </section>
        <section id="right">
            <h1>TERMINARZ</h1>
            <p>najbliższe zadania:
                <?php
                    // script 1
                    foreach($tasks1 as $task){
                        echo "{$task['wpis']}; ";
                    }
                ?>
            </p>
        </section>
    </header>
    <main>
        <?php
            // script 2
            foreach($tasks2 as $task){
                echo "<section class='calendar'>";
                echo "<h6>{$task['dataZadania']}</h6>";
                echo "<p>{$task['wpis']}</p>";
                echo "</section>";
            }
        ?>
    </main>
    <footer>
        <a href="sierpien.html">Terminarz na sierpień</a>
        <p>Stronę wykonał: 472115</p>
    </footer>
</body>
</html>