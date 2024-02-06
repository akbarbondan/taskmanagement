<?php
include("db_connect.php");
$con = dbconnection();

if(isset($_GET["id"])){
    $id=$_GET["id"];
}
else return;

$query="DELETE FROM `task` WHERE uid='$id'";
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