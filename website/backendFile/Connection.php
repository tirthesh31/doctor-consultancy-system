<?php
$servername = "localhost:3307";
$username = "root";
$password = "";
$database = "couns_sug_sys";
// Create connection
$conn = mysqli_connect($servername, $username, $password,$database);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
?>