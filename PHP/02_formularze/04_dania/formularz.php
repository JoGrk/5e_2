<?php
$link= new mysqli('localhost','root','','5e_2_dania');
$sql="SELECT id,nazwa
FROM typy_dan;";
$result=$link->query($sql);
$typydan=$result->fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action="" method="POST">
    <select name="type_id" id="type_id">
        <!-- <option value="1">zupy</option> -->
         <?php
         foreach($typydan as $typdania){
            echo "<option value='{$typdania['id']}'>
                {$typdania['nazwa']}
                </option>";
         }

         ?>
</select>
        <button>wyslij</button>
</form>
         <ul>
            <?php
            if(!empty($_POST['type_id'])){
               $type_id=$_POST['type_id'];
               $sql="SELECT nazwa,cena
                FROM dania
                WHERE typ=$type_id;";
                $result=$link->query($sql);
                $dania=$result->fetch_all(1);
                foreach($dania as $danie){
                    echo "<li>
                            {$danie['nazwa']}
                             {$danie['cena']}
                        </li>";
                }
            }
            
            else{
                echo "wybierz typ dania";
            }
        
            ?>
         </ul>
</body>
</html>
<?php
$link->close();
?>
