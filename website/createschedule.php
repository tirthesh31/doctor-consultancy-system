<?php include 'profileheader.php';
include 'backendFile\Connection.php'; 
session_start();
    if(!isset($_SESSION['demail'])){
        echo "<script>location.href='signinpage.php'</script>";
    }
    $dId = $_SESSION['dId'];
    $query2 = "SELECT * FROM `schedule_tbl` WHERE `d_id` = '$dId'";
    $runQuery2 = mysqli_query($conn,$query2);
            

    if(isset($_POST['submit'])){
        $uEmailId = $_SESSION['uEmailId'];
        if(isset($_POST['date']) && isset($_POST['stime']) && isset($_POST['etime']) && isset($_POST['consultingtime']) && isset($_POST['astime']) && isset($_POST['aetime'])){
            $date = $_POST['date'];
            $stime = $_POST['stime'];
            $etime = $_POST['etime'];
            $consultingtime = $_POST['consultingtime'];
            $astime = $_POST['astime'];
            $aetime  = $_POST['aetime'];

            
            $query1 = "INSERT INTO `schedule_tbl`(`d_id`, `start_time`, `end_time`, `avg_cou_time`, `start_time_avoid`, `end_time_avoid`,`sc_date`)
            VALUES ('$dId','$stime','$etime','$consultingtime','$astime','$aetime','$date')";

            $runQuery1 = mysqli_query($conn,$query1);
            if($result = mysqli_fetch_array($runQuery1)){
                header('location: profileheader.php');
            }
        }
    }
    if(isset($_GET['del'])){
        $id = $_GET['del'];
        $selQuery1 = "DELETE FROM `schedule_tbl` WHERE sc_id = '$id'";
                        if($query1 = mysqli_query($conn,$selQuery1)){
                        header('location:profileheader.php');
                        die('died');
                    }
    }
?>
<div class="data">
    <div class="Add">
        <button onclick="myFunction()">+</button>
    </div>
    <div class="scheduleform" id="scheduleform">
        <form method="post">
                <div class="info">
                    <div class="sect1">
                        <div class="input_field">
                            <label>DATE</label>
                            <input type="date" name="date">
                        </div>
                        <div class="input_field">
                            <label>START-TIME</label>
                            <input type="time" name="stime">
                        </div>
                        <div class="input_field">
                            <label>END-TIME</label>
                            <input type="time" name="etime">
                        </div>
                    </div>
                    <div class="sect2">
                        <div class="input_field">
                            <label>AVERAGE-CONSULTING-TIME</label>
                            <input type="number" name="consultingtime">
                        </div>
                        <div class="input_field">
                            <label>START-TIME-AVOID</label>
                            <input type="time" name="astime">
                        </div>
                        <div class="input_field">
                            <label>END-TIME-AVOID</label>
                            <input type="time" name="aetime">
                        </div>
                    </div>
                </div>
                    <div class="btn">
                        <input type="submit" value="SCHEDULE" name='submit'>
                        <button onclick="myFunctionClose()">CLOSE</button>
                    </div>
        </form>
    </div>
    <div class="tbl" id="tbl">
        <table>
        <tr>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Consultancy Duration</th>
            <th>Break Time(Start)</th>
            <th>Break Time(End)</th>
            <th>Delete</th>
        </tr>
        <?php
        while($result2 = mysqli_fetch_array($runQuery2)){
        ?>
        <tr>
            <td><?php echo $result2['sc_date'] ?></td>
            <td><?php echo $result2['start_time'] ?></td>
            <td><?php echo $result2['end_time'] ?></td>
            <td><?php echo $result2['avg_cou_time'] ?></td>
            <td><?php echo $result2['start_time_avoid'] ?></td>
            <td><?php echo $result2['end_time_avoid'] ?></td >
            <td><a href="createschedule.php?del=<?php echo $result2['sc_id']; ?>"><i class="fas fa-trash"></i></a></td>
        </tr>
        <?php } ?>
        </table>
    </div>
</div>    
<script>
    function myFunction() {
    document.getElementById('scheduleform').style.cssText = 'display:block';
    document.getElementById('tbl').style.cssText = 'display:none';
}
    function myFunctionClose() {
    document.getElementById('scheduleform').style.cssText = 'display:none';
    document.getElementById('tbl').style.cssText = 'display:block';
}
</script>


