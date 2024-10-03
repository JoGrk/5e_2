
<?php
    $link=new mysqli ('localhost','root','','5e_2_raporty');
    $sql ="SELECT adres_sklepu, AVG(cena) as sr_cena FROM sklep_informacje JOIN sklep_magazyn ON sklep_informacje.id_sklepu = sklep_magazyn.id_sklepu JOIN zabawka_informacje ON sklep_magazyn.id_zabawki = zabawka_informacje.id_zabawki GROUP BY sklep_informacje.id_sklepu;";

    
    $result=$link->query($sql);
   $shops_avg = $result -> fetch_all(1);


   $sql="SELECT adres_sklepu, stan_magazynu, zabawka FROM sklep_informacje JOIN sklep_magazyn ON sklep_informacje.id_sklepu = sklep_magazyn.id_sklepu JOIN zabawka_informacje ON sklep_magazyn.id_zabawki = zabawka_informacje.id_zabawki;   ";
    $result=$link->query($sql);
    $shops_toys =$result->fetch_all(1);

    $link->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>srednia cena</h2>

    <ol>
        <?php
        foreach($shops_avg as $shop_avg){
            echo "<li>";
                echo "<b>{$shop_avg['adres_sklepu']}</b> ";
                echo $shop_avg['sr_cena'];
            echo "</li>";
        }
        ?>
    </ol>
    <h2>zabawki</h2>
    <table>   
        <?php
        foreach($shops_toys as $shop_toy){
            echo"<tr>";
            echo"<td><i>{$shop_toy['adres_sklepu']}</i></td>";
            echo"<td>{$shop_toy['stan_magazynu']}</td>";
            echo"<td>{$shop_toy['zabawka']}</td>";
                
            echo"</tr>";
        }
        ?>
    </table>
</body>
</html>