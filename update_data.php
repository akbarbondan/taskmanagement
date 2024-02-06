<?php

include("db_connect.php");
$con = dbconnection();



if(isset($_POST["id"])){
    $id=$_POST["id"];
}
else return ;

if(isset($_POST["title"])){
    $title=$_POST["title"];
}


if(isset($_POST["description"])){
    $descript=$_POST["description"];
}
else return ;



$query="UPDATE `task` SET `title`='$title',`description`='$descript',`editeAt`=NOW() WHERE `uid`=$id;";
$exect = mysqli_query($con, $query);


$arr=[];
if($exect){
    $arr["success"] = "true";
}
else{
    $arr["success"] = "fales";
}
print(json_encode($arr));

?>