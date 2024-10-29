<?php
$link=new mysqli('localhost', 'root', '', '5e_2_biblioteka');
$sql="select id, imie ,nazwisko 
FROM autorzy;";
$result=$link->query($sql);
$authors=$result->fetch_all(1);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post">
        <select name="authorlist" id="authorlist">
            <!-- <option value="1">Błazej Pawlinski</option> -->
            <?php
                foreach($authors as $author){
                    echo "<option value='{$author['id']}'>{$author['imie']} {$author['nazwisko']}</option>";
                }
            ?>
        </select>
    </form>
</body>
</html>
<?php 
$link->close();
?>