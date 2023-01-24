<?php
    session_start();
    if(!isset($_SESSION['uEmailId'])){
        echo "<script>location.href='signinpage.php'</script>";
    }
    include 'backendFile\Connection.php';
?>
<!DOCTYPE html>
<?php
if(isset($_POST["logout"])){
    session_unset();
    session_destroy();
    header('location:signinpage.php');
}
$query = "SELECT * FROM `admin_tbl` ";
if($result = mysqli_query($conn,$query)){
    $row = $result -> fetch_assoc();
    $fName = $row["fName"];
    $lName = $row["lName"];
    $email = $row["emailId"];
    $contact = $row["contact"];
    $id = $row["adminId"];
    $file = $row["file"];
}
if(isset($_POST['submit'])){
    $status = 'error';      
    if(!empty($_FILES["image"]["name"])) 
    { 
        $files = $_FILES["image"]["name"];

        $insert = mysqli_query($conn,"UPDATE `admin_tbl` SET `file`='$files' WHERE adminId = '$id'");

        if($insert){
            move_uploaded_file($_FILES['image']['tmp_name'],"files/$files");
        }
    }
    else
    { 
        $statusMsg = 'Please select an image file to upload.'; 
    } 
} 
 
// Get image data from database 
//$result = mysqli_query($conn,"SELECT image FROM images ORDER BY idDESC");

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
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
<div class="container">
        <div class="pic">
            <?php
               echo "<img src = files/".$row['file']." style = 'width:100%;height:100%;border-radius:20px;'>";
            ?>
        </div>
        <div class="detail">
                <div class="basic">
                        <label>NAME :</label><div class="name">
                        <label for="name" id="name"><?php echo $fName." ".$lName;?></label>
                </div>
                </div>
                <div class="basic1">
                    <label >EMAIL:</label><label for="qualification" id="qua"><?php echo $email;?></label>
                </div>
                <div class="basic1">
                    <label >CONTACT:</label><label for="Hospital" id="hos"><?php echo $contact;?></label>
                </div>
                <div class="basic1">
                    <form method="post" enctype="multipart/form-data">
                    <input type="file" name="image" placeholder="file"> <input type="submit" name="submit">
                    </form>
                </div>
        </div>
    </div>
    <div class="btns">
        <form method="post">
            <div class="sect1">
                <button><a href="AupdateDoctorprofile.php">REMOVE DOCTOR PROFILE</a></button>
                <button><a href="AvalidateDoctor.php">VALIDATE DOCTOR</a></button>
            </div>
            <div class="sect2">
                <button><a href="Aviewdoctordetails.php">VIEW DOCTOR DETAILS</a></button>
                <button><a href="forgetpassword.php">CHANGE PASSWORD</a></button>
            </div>
            <div class="sect3">
                <button name="logout"><a name="logout"> LOG OUT</a></button>
            </div>
        </form>
    </div>
</body>
</html>