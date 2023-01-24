<?php
include 'backendFile\Connection.php';
session_start();
if(isset($_SESSION['newPatientEmailId'])){
    $newPatientEmailId = $_SESSION['newPatientEmailId'];

    $query = mysqli_query($conn,"select * from patient_tbl where pEmailId = '$newPatientEmailId'");
    if($result = mysqli_fetch_array($query)){
        $id = $result['pId'];
        $to = $newPatientEmailId;
        $subject = "File Id is Here";
        $header = "From:appointmanage017058@gmail.com";
        $body = "Greeting you, Thanks for enrolling in our website this is your file Id: $id";

        $retval = mail ($to,$subject,$body,$header);
                                            
        if( $retval == true ) {
            header('location:index.php');
            die('died');
        }else {
            echo '<script>alert("Message couldnt be send!!")</script>';
            }
    }
}
else {
            echo '<script>alert("Message couldnt be send!!")</script>';
            }