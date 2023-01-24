<?php include 'admin.php';
include 'backendFile\Connection.php'; 
session_start();
    if(!isset($_SESSION['uEmailId'])){
        echo "<script>location.href='signinpage.php'</script>";
    }
?>
<div class="data">
<div class="indata">
        <label for="ID">ID:</label><input type="number" name="ID"><button>FIND</button>
    </div>
<div class="tbl">
<table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Emai-Id</th>
                    <th>Degree Name</th>
                    <th>Speciality</th>
                    <th>Experience</th>
                    <th>Delete</th>
                </tr>
                <?php
                    //To fetch all data from doctor table
                    $selQuery = "SELECT * FROM doctor_tbl ";
                    $query = mysqli_query($conn,$selQuery);
                    //In order to check whether the doctor is already validate or not.
                    $flag = 0;
                    while($result = mysqli_fetch_array($query)){
                        
                    ?>  
                        <tr>
                            <td><?php echo $result['dFname'] ?></td>
                            <td><?php echo $result['dLname'] ?></td>
                            <td><?php echo $result['dEmailId'] ?></td>
                            <td><?php echo $result['dDegreeName'] ?></td>
                            <td><?php echo $result['dSpeciality'] ?></td>
                            <td><?php echo $result['dExp'] ?></td>
                            <td><a href="AupdateDoctorprofile.php?del=<?php echo $result['dId']; ?>"><i class="fas fa-trash"></i></a></td>
                        </tr>
                        <?php }?>
            </table>
    </div>
</div>
<?php
        if(isset($_GET["del"])){
            $dId = $_GET["del"];
                $selQuery1 = "DELETE FROM `doctor_tbl` WHERE dId = $dId";
                if($query1 = mysqli_query($conn,$selQuery1)){
                    echo "<script>location.href='admin.php'</script>";
                }
        }
        else{
            echo 'errpr';
        }
    ?>
</body>
</html>