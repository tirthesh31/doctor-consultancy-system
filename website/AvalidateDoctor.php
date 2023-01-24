<?php include 'admin.php';
include 'backendFile\Connection.php';
session_start();
    if(!isset($_SESSION['uEmailId'])){
        echo "<script>location.href='signinpage.php'</script>";
    }
 ?>
<div class="data">
    <div class="tbl">
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Emai-Id</th>
                    <th>Degree Name</th>
                    <th>Speciality</th>
                    <th>experience</th>
                    <th>Approve</th>
                    <th>Deny</th>
                </tr>
                <?php
                    //To fetch all data from doctor table
                    $selQuery = "SELECT * FROM doctor_tbl ";
                    $query = mysqli_query($conn,$selQuery);

                    //To fetch all data from doctor validation table
                    $selQuery1 = "SELECT * FROM validate_doctor_tbl ";
                    $query1 = mysqli_query($conn,$selQuery1);

                    //In order to check whether the doctor is already validate or not.
                    $flag = 0;
                    while($result = mysqli_fetch_array($query)){
                        $dId = $result['dId'];
                        while($result1 = mysqli_fetch_array($query1)){
                            $vdId = $result1['dId'];
                            if($dId == $vdId){
                                $flag=1;

                            }
                        }
                        if($flag==0){
                    ?>  
                        <tr>
                            <td><?php echo $result['dFname'] ?></td>
                            <td><?php echo $result['dLname'] ?></td>
                            <td><?php echo $result['dEmailId'] ?></td>
                            <td><?php echo $result['dDegreeName'] ?></td>
                            <td><?php echo $result['dSpeciality'] ?></td>
                            <td><?php echo $result['dExp'] ?></td>
                            <td><a href="AvalidateDoctor.php?val=<?php echo $result['dId']; ?>">Click</a></td>
                            <td><a href="AvalidateDoctor.php?del=<?php echo $result['dId']; ?>">Click</a></td>
                        </tr>
                        <?php } $flag=0; } ?>
            </table>
    </div>
    <?php
     $selQuery = "SELECT * FROM doctor_tbl ";
     $query = mysqli_query($conn,$selQuery);

        if(isset($_GET["val"])){
            $dId = $_GET["val"];
                $selQuery1 = "INSERT INTO Validate_doctor_tbl(dId,validate) values($dId,1)";
                if($query1 = mysqli_query($conn,$selQuery1)){
                    $selquery2 = "SELECT * from doctor_tbl where dId = '$dId'";
                    if($query2 = mysqli_query($conn,$selquery2)){
                        $row = $query2 -> fetch_assoc();
                        $email = $row["dEmailId"];
                        $to = $email; 
                        $body = "You are granted to access the website. Thanks for registering in our web";   
                        $subject = "Permission";
                        $header = "From:appointmanage017058@gmail.com";
                                                    
                        $retval = mail ($to,$subject,$body,$header);
                        $_SESSION['otp'] = $otp;  
                        $_SESSION['email'] = $email;                    
                        if( $retval == true ) {
                            echo "<script>location.href='admin.php'</script>";
                        }else {
                            echo '<script>alert("Message couldnt be send!!")</script>';
                        }
                    }
                }
            }
        if(isset($_GET["del"])){
            $dId = $_GET["del"];
            $selQuery1 = "INSERT INTO Validate_doctor_tbl(dId,validate) values($dId,0)";
            if($query1 = mysqli_query($conn,$selQuery1)){
                $selQuery2 = "SELECT * from doctor_tbl where dId = '$dId'";
                    if($query2 = mysqli_query($conn,$selQuery2)){
                        $row = $query2 -> fetch_assoc();
                        $email = $row["dEmailId"];
                        $to = $email; 
                        $body = "You are not granted to access the website because u failed in authentication.";   
                        $subject = "Permission";
                        $header = "From:appointmanage017058@gmail.com";
                                                    
                        $retval = mail ($to,$subject,$body,$header);
                        $_SESSION['otp'] = $otp;  
                        $_SESSION['email'] = $email;                    
                        if( $retval == true ) {
                            echo "<script>location.href='admin.php'</script>";
                        }else {
                            echo '<script>alert("Message couldnt be send!!")</script>';
                        }
                    }
                }
        }
    ?>
</div>
</body>
</html>

            