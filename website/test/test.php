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
                    //To fetch all data from doctor table
                    $selQuery = "SELECT * FROM doctor_tbl ";
                    $query = mysqli_query($conn,$selQuery);

                    //To fetch all data from doctor validation table
                    $selQuery1 = "SELECT * FROM validate_doctor_tbl ";
                    $query1 = mysqli_query($conn,$selQuery1);

                    //In order to check whether the doctor is already validate or not.
                    $flag = 0;
                    while($result = mysqli_fetch_array($query)){
                        $dId = $result[0];
                        echo "DID = ".$dId."<br>";
                        while($result1 = mysqli_fetch_array($query1)){
                            $vdId = $result1['dId'];
                            echo "VDID = ".$vdId."<br>";
                            if($dId == $vdId){
                                $flag=1;
                                echo $flag;
                            }
                            else{
                                echo $flag;
                            }
                        }
                    }?>