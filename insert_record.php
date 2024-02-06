<?php
include("db_connect.php");
$con = dbconnection();

// $dateTime = date("Y-m-d H:i:s");
// echo ($dateTime);

if(isset($_POST["title"])){
    $title=$_POST["title"];
}
else return ;

if(isset($_POST["description"])){
    $descript=$_POST["description"];
}
else return ;


$query = "INSERT INTO `task` (`uid`, `title`, `description`, `date`) VALUES (NULL, '$title', '$descript', NOW())";
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
