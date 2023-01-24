<?php
include 'backendFile\Connection.php';

if(isset($_POST['cName']) && isset($_POST['spec'])){
    $spec = $_POST['spec'];
    $cName = $_POST['cName'];
    $cName = strtoupper($cName);
    $query = mysqli_query($conn,"select * from doctor_tbl where `city` = '$cName' and dSpeciality = '$spec'");
    
    while($row = mysqli_fetch_array($query)){
        $dId = $row['dId'];
        $fName = $row['dFname'];
        $lName = $row['dLname'];
        $dAdd = "| " . $row['dAddress'];
        echo "<option value ='$dId'> $fName $lName $dAdd</option>";
    }
}else{
    echo "error";
}

if(isset($_POST['docId'])){
    $dId =  $_POST['docId'];
    $query = mysqli_query($conn,"select * from schedule_tbl where d_id = '$dId'");

    while($row = mysqli_fetch_array($query)){
        $date = $row['sc_date'];
        echo "<option value ='$date'> $date</option>";
    }
}



if(isset($_POST['dDate'])){
    $dDate =  $_POST['dDate'];
    $query = mysqli_query($conn,"select * from schedule_tbl where sc_date = '$dDate'");

    while($row = mysqli_fetch_array($query)){
        $sTime = $row['start_time'];
        $eTime = $row['end_time'];
        $act = $row['avg_cou_time'];
        $bTimeS = $row['start_time_avoid'];
        $bTimeE = $row['end_time_avoid'];

        //for time zones
 
        $start = new DateTime($sTime);
        $end = new DateTime($eTime);
        $bstart = new DateTime($bTimeS);
        $bend = new DateTime($bTimeE);

        $startTime = $start->format('H:i');
        $endTime = $end->format('H:i');
        $BreakstartTime = $bstart->format('H:i');
        $BreakendTime = $bend->format('H:i');

        $i=0;
        $time = [];
        while(strtotime($startTime) <= strtotime($endTime)){
            $start = $startTime;
            $end = date('H:i',strtotime('+'.$act.' minutes',strtotime($startTime)));
            $startTime = date('H:i',strtotime('+'.$act.' minutes',strtotime($startTime)));
            $i++;
            if(strtotime($startTime) <= strtotime($endTime)){
                $a =strcmp($start,$BreakstartTime);
                $b =strcmp($end,$BreakendTime);
                if(strcmp($start,$BreakstartTime) == 0 || strcmp($end,$BreakendTime) == 0 ){
                    //echo "<option value ='$start-$end'>$start-$end --- $BreakstartTime--$a--$b</option>";
                }else{
                    echo "<option value ='$start-$end'>$start-$end</option>";       
                }
            }
        }
    }
}
?>