<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php 
    $link=new mysqli('localhost','root','','5e_2_biblioteka');

    if(!empty($_POST['title'])){
        $title=$_POST['title'];
        $sql="DELETE FROM ksiazki
            WHERE tytul='$title';";
        if($result=$link->query($sql)){
            echo "Książka została usnięta";  
        }
        else{
            echo "MAMY BŁĘDY!!!";
        }
    }

    $link->close();
    ?>
    <a href="biblioteka4.php">Powrót do usuwania</a>
</body>
</html>