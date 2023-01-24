<?php include 'profileheader.php'; ?>
<div class="data">
    <div class="query_details">
        <form action="viewAppointments.php" method="post">
            <label for="date"><input type="Date" name="date"></label>
            <input type="submit" value="SUBMIT">
        </form>
    </div>
    <div class="tbl">
        <table>
        <tr>
            <th>Patient Id</th>
            <th>Patient</th>
            <th>Date</th>
            <th>Time</th>
            <th>Delete</th>
        </tr>
        <?php
                    $dId = $_SESSION['docId'];
                    //To fetch all data from doctor table
                    if(isset($_POST['date'])){
                        $date = $_POST['date'];
                        $selQuery = "SELECT * FROM appointment_tbl INNER JOIN patient_tbl
                        ON appointment_tbl.pId=patient_tbl.pId where appointment_tbl.dId = '$dId' and appointment_tbl.date = '$date'";
                    }else{
                    $selQuery = "SELECT * FROM appointment_tbl INNER JOIN patient_tbl
                    ON appointment_tbl.pId=patient_tbl.pId where appointment_tbl.dId = '$dId';";
                    }
                    $query = mysqli_query($conn,$selQuery);
                    //In order to check whether the doctor is already validate or not.
                    while($result = mysqli_fetch_array($query)){
                        
                    ?>  
                        <tr>
                            <td><?php echo $result['pId'] ?></td>
                            <td><?php echo $result['pFname'] . " " . $result['pLname']?></td>
                            <td><?php echo $result['date'] ?></td>
                            <td><?php echo $result['time'] ?></td>
                            <td><a href="viewAppointments.php?del=<?php echo $result['aId']; ?>"><i class="fas fa-trash"></i></a></td>
                        </tr>
                        <?php }?>
        </table>
    </div>
    <?php
        if(isset($_GET["del"])){
            $aId = $_GET["del"];

                $query = mysqli_query($conn,"select * from `appointment_tbl` WHERE aId = '$aId'");
                while($result = mysqli_fetch_array($query)){
                    $id = $result['pId'];
                    $query1 = mysqli_query($conn,"select * from patient_tbl WHERE pId = '$id'");
                    if($result1 = mysqli_fetch_array($query1)){
                    $email = $result1['pEmailId'];        
                    $to = $email;
                    $subject = "Appoinment Gets Deleted due to reason";
                    $header = "From:appointmanage017058@gmail.com";
                    $body = "Greeting you, Sorry sir your appoinment had been canceled by doctor therefore appointment fees had been credited to your bank account so plz book your next appointment.Sorry for the inconvenience";

                    $retval = mail ($to,$subject,$body,$header);
                                                        
                    if( $retval == true ) {
                        $selQuery1 = "DELETE FROM `appointment_tbl` WHERE aId = '$aId'";
                        if($query1 = mysqli_query($conn,$selQuery1)){
                        header('location:profileheader.php');
                        die('died');
                    }
                }else {
                        echo '<script>alert("Message couldnt be send!!")</script>';
                        }
                }else {
                    echo '<script>alert("Message couldnt be send!!")</script>';
                    }
            }
            

                    echo "<script>location.href='profileheader.php'</script>";
                }
        else{
        }
    ?>
</div>
</body>
</html>