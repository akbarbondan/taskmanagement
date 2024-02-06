<?php
include("db_connect.php");
$con = dbconnection();

$query = "SELECT * FROM `task` order by uid DESC";
$exect = mysqli_query($con,$query);

$arr=[];

while($row=mysqli_fetch_array($exect)){
    $arr[]=$row;
}

print(json_encode($arr))

?>