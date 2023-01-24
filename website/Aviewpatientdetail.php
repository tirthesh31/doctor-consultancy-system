<?php include 'admin.php';
include 'backendFile\Connection.php';
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
            <th>Contact</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Blood Group</th>
            <th>Height</th>
            <th>Weigth</th>
        </tr>
        <?php
                    //To fetch all data from doctor table
                    $selQuery = "SELECT * FROM patient_tbl ";
                    $query = mysqli_query($conn,$selQuery);
                    //In order to check whether the doctor is already validate or not.
                    $flag = 0;
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