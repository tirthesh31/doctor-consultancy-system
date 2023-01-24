<?php 
include 'backendFile\Connection.php';
session_start();
if(isset($_POST['submit'])){
    if((!empty($_POST['password'])) && !empty($_POST['confirmPassword']) && ($_POST['confirmPassword'] == $_POST['password'])){
        $email = $_SESSION['email'];
        $pwd =  $_POST['password'];
        $hash_pass = password_hash($pwd, PASSWORD_DEFAULT);
        $query = "UPDATE `doctor_tbl` SET `dPassword` = '$hash_pass' WHERE `dEmailId`='$email'";
        if($result = mysqli_query($conn,$query)){
            header("location:signinpage.php");
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/updatepwd.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
<div class="mainDiv">
    <img src="./image/bg.jpg" alt="">
  <div class="cardStyle">
    <form method="post" name="signupForm" id="signupForm">
        <div class="logo">
    <a href="index.php" class="logo"><i class="fas fa-heartbeat"></i>medcare</a>
    </div>
    <div class="inputDiv">
      <label class="inputLabel" for="password">New Password</label>
      <input type="password" id="password" name="password" required>
    </div>
      
    <div class="inputDiv">
      <label class="inputLabel" for="confirmPassword">Confirm Password</label>
      <input type="password" id="confirmPassword" name="confirmPassword">
    </div>
    
    <div class="buttonWrapper">
      <button type="submit" id="submitButton" name="submit" class="submitButton pure-button pure-button-primary">
        <span>Continue</span>
        <span id="loader"></span>
      </button>
    </div>
      
  </form>
  </div>
</div>
</body>
</html>