<?php 
session_start();
if(isset($_SESSION['otp'])){
    $otp = $_SESSION['otp'];
    if(isset($_POST["submit"])){
        if(!empty($_POST["otp"])){
            $check_otp = $_POST['otp'];
            if($check_otp == $otp){
                header("location:updatepwd.php");
            }else{
                echo '<script>alert("OTP is incorrect!!")</script>';
            }
        }
    }
}
if(isset($_SESSION['paymentotp'])){
    $otp = $_SESSION['paymentotp'];
    if(isset($_POST["submit"])){
        if(!empty($_POST["otp"])){
            $check_otp = $_POST['otp'];
            if($check_otp == $otp){
                header("location:payment.php");
            }else{
                echo '<script>alert("OTP is incorrect!!")</script>';
            }
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
    <link rel="stylesheet" href="css/otp.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
    <div class="background">
        <div class="intro">OTP</div>
        <div class="bsec">
            <h4>ENTER THE OTP FOR LOGIN: <BR> FOR THE NUMBER</h4>
            <form method="post">
                <div class="ibg">
                    <input type="number" name="otp" placeholder="ENTER OTP PLEASE">
                </div>
                <div class="btn">
                    <input type="submit" class="btnsolid" value="Login" name="submit">
                </div>
            </form>
        </div>
    </div>
</body>
</html>