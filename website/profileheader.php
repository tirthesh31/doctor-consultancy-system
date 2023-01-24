<?php
    session_start();
    if(!isset($_SESSION["demail"])){
        echo "<script>location.href='signinpage.php'</script>";
    }
    include 'backendFile\Connection.php';
        ?>
<!DOCTYPE html>
<?php
$email = $_SESSION["demail"];
if(isset($_POST["logout"])){
        session_unset();
        session_destroy();
        header('location:signinpage.php');
}
$query = "SELECT * FROM `doctor_tbl` WHERE `dEmailId` = '$email'";
if($result = mysqli_query($conn,$query)){
    $row = $result -> fetch_assoc();
    $fName = $row["dFname"];
    $lName = $row["dLname"];
    $spec = $row["dSpeciality"];
    $degree = $row["dDegreeName"];
    $id = $row["dId"];
    $file = $row["file"];
    $_SESSION['docId'] = $id;
} 
if(isset($_POST['submit'])){
    $status = 'error';      
    if(!empty($_FILES["image"]["name"])) 
    { 
        $files = $_FILES["image"]["name"];

        $insert = mysqli_query($conn,"UPDATE `doctor_tbl` SET `file`='$files' WHERE dId = '$id'");

        if($insert){
            move_uploaded_file($_FILES['image']['tmp_name'],"files/$files");
        }
    }
    else
    { 
        $statusMsg = 'Please select an image file to upload.'; 
    } 
}
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PROFILE</title>
    <!--Font link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <!--custom css link-->
    <link rel="stylesheet" href="css/profileheader.css">
</head>
<body>
    <div class="container">
        <div class="pic">
        <?php
               echo "<img src = files/".$file." style = 'width:100%;height:100%;border-radius:20px;'>";
            ?>
        </div>
        <div class="detail">
                <div class="basic">
                        <label>NAME :</label><div class="name">
                        <label for="name" id="name"><?php echo $fName." ".$lName;?></label>
                </div>
                </div>
                <div class="basic1">
                    <label >QUALIFICATION:</label><label for="qualification" id="qua"><?php echo $degree;?></label>
                </div>
                <div class="basic1">
                    <label >SPECIALITY:</label><label for="Hospital" id="hos"><?php echo $spec;?></label>
                </div>
                <div class="basic1">
                    <form method="post" enctype="multipart/form-data">
                        <input type="file" name="image" placeholder="file"> <input type="submit" name="submit">
                    </form>
                </div>
        </div>
    </div>
    <div class="btns">
        <form method="POST">
            <button><a href="viewAppointments.php">VIEW APPOINTMENTS</a></button>
            <button><a href="viewpatientdetail.php">VIEW PATIENT DETAILS</a></button>
            <button><a href="forgetpassword.php">CHANGE PASSWORD</a></button>
            <button><a href="signuppage.php?id=<?php echo $id; ?>">VIEW UPDATE PROFILE</a></button>
            <button><a href="createschedule.php">CREATE SCHEDULE</a></button>
            <button name="logout"><a name="logout"> LOG OUT</a></button>
            </form>
    </div>
</body>
</html>