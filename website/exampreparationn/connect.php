<?php
$servername = 'localhost:3307';
$username = 'root';
$password = "";
$database = "couns_sug_sys";

$conn = mysqli_connect($servername,$username,$password,$database);

if(!$conn){
    die("Something went wrong");
}
?>