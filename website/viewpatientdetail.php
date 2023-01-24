<?php include 'profileheader.php';
include 'backendFile\Connection.php';
session_start();
if(!isset($_SESSION["demail"])){
    header('location:signinpage.php');
}
if(isset($_POST['submit'])){
    if(!empty($_POST['ID'])){
        $_SESSION['pId'] = $_POST['ID'];
        header('location:viewpatientdetail.php');
    }
}
?>
<div class="data">
    <div class="indata">
        <form method="post">
        <label for="ID" name='ID'>ID:</label><input type="number" name="ID"><input type="submit" name='submit' placeholder="SUBMIT"></input>
        </form>
    </div>
<div class="tbl">
        <table>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Emai-Id</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Blood Group</th>
            <th>Height</th>
            <th>Weigth</th>
        </tr>
        <?php
                    $dId = $_SESSION['docId'];
                    //To fetch all data from doctor table or to find a specific record
                    if(isset($_SESSION['pId'])){
                        $pId = $_SESSION['pId'];
                        $selQuery = "SELECT * FROM appointment_tbl INNER JOIN patient_tbl
                        ON appointment_tbl.pId=patient_tbl.pId where appointment_tbl.dId = '$dId' and appointment_tbl.pId = '$pId'";    
                    }else{
                        $selQuery = "SELECT * FROM appointment_tbl INNER JOIN patient_tbl
                        ON appointment_tbl.pId=patient_tbl.pId where appointment_tbl.dId = '$dId'";
                    }
                    $query = mysqli_query($conn,$selQuery);
                    //In order to check whether the doctor is already validate or not.
                    while($result = mysqli_fetch_array($query)){
                        
                    ?>  
                        <tr>
                            <td><?php echo $result['pFname'] ?></td>
                            <td><?php echo $result['pLname'] ?></td>
                            <td><?php echo $result['pEmailId'] ?></td>
                            <td><?php echo $result['pContact'] ?></td>
                            <td><?php echo $result['pAddress'] ?></td>
                            <td><?php echo $result['pGender'] ?></td>
                            <td><?php echo $result['pBloodGrp'] ?></td>
                            <td><?php echo $result['pHeight'] ?></td>
                            <td><?php echo $result['pWeight'] ?></td>
                        </tr>
                        <?php }?>
        </table>
    </div>
</div>
</body>
</html>