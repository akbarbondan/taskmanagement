<?php

function dbconnection(){
    $con=mysqli_connect("localhost","root","root","task_management");


    return $con;
}

?>