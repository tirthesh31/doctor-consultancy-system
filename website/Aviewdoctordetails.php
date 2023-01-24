<?php 
include 'admin.php';
include 'backendFile\Connection.php';
?>
<div class="data">
    <div class="indata">
        <form action='Aviewdoctordetails.php' method="post">
        <label for="ID">ID:</label><input type="number" name="ID"><input type="submit" value="submit" name="submit">
        </form>
    </div>
    <div class="tbl">
        <table>
                <tr>
                    <th>Sr.NO</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Emai-Id</th>    
                    <th>Address</th>  
                    <th>Contact</th>
                    <th>Degree</th>
                    <th>Speciality</th>
                    <th>Experience</th>
                </tr>
            <?php
            $limit = 6;
            if(isset($_GET['page'])){
                $page = $_GET['page'];
            }else{
                $page = 1;
            }
            $offset = ($page - 1) * $limit;
            if(isset($_POST['ID'])){
                $id = $_POST['ID'];
                $selQuery = "SELECT * FROM doctor_tbl where dId = '$id'";
            }else{
            $selQuery = "SELECT * FROM doctor_tbl LIMIT {$offset},{$limit}";
            }
            $query = mysqli_query($conn,$selQuery);
            
            while($result = mysqli_fetch_array($query)){
            ?>  
                <tr>
                    <td><?php echo $result['dId'] ?></td>
                    <td><?php echo $result['dFname'] ?></td>
                    <td><?php echo $result['dLname'] ?></td>
                    <td><?php echo $result['dEmailId'] ?></td>
                    <td><?php echo $result['dAddress'] ?></td>
                    <td><?php echo $result['dContact'] ?></td>
                    <td><?php echo $result['dDegreeName'] ?></td>
                    <td><?php echo $result['dSpeciality'] ?></td>
                    <td><?php echo $result['dExp'] ?></td>
                </tr>
            <?php } ?>
                </table>
            <?php
            if(isset($_POST['ID'])){
                $id = $_POST['ID'];
                $selQuery1 = "SELECT * FROM doctor_tbl where dId = '$id'";
            }else{
            $selQuery1 = "SELECT * FROM doctor_tbl ";
            }
            $query1 = mysqli_query($conn,$selQuery1);

            $noOfRows = mysqli_num_rows($query1);
            $totalPage = ceil( $noOfRows / $limit );
            echo '<div class="subcont">';
            echo '<div class="noOfRows">';
            echo '<label>Number of Rows Fetched : '.$noOfRows.'</label>';
            echo '</div>';

                echo '<ul class="Pagination">';
                if($page > 1){
                    echo '<li><a href="Aviewdoctordetails.php?page='.($page-1).'">PREV</a></li>';
                }
                for ($i=1; $i <= $totalPage ; $i++) {
                    if($page == $i){
                        $active = "active";
                    }else{
                        $active = "";
                    } 
                    echo '<li class="'.$active.'"><a href="Aviewdoctordetails.php?page='.$i.'">'.$i.'</a></li>';
                }
                if($totalPage > $page){
                echo '<li><a href="Aviewdoctordetails.php?page='.($page+1).'">NEXT</a></li>';
                }
                echo '</ul>';
            echo '</div>';    
            ?>
    </div>
</div>
</body>
</html>