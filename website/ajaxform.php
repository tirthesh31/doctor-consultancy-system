<?php
include 'C:\xampp\htdocs\website\exampreparationn\connect.php';

if(isset($_post['cId'])){
    $cid =  $_post['cId'];
    $query = mysqli_query($conn,"SELECT * FROM `statetbl` WHERE `cId` = $cid ");
    while($result = mysqli_fetch_array($query)){
        $id = $result['sId'];
        $sname = $result['sName'];
        echo("<option value = '$id'> $sname </option>");
    }
}
?>