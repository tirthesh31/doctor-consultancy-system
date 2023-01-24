<?php 
include 'backendFile\Connection.php';
session_start();
if(isset($_POST['submit'])){
    if(!empty($_POST['email'])){
        $email = $_POST['email'];
        $query = "SELECT dEmailId from doctor_tbl where dEmailId = '$email'";
        if($result = mysqli_query($conn, $query))
        {
            $rowcount=mysqli_num_rows($result);
            if($rowcount==1){
                $otp = rand(1111,9999);
                $to = $email; 
                $body = "OTP: ".$otp;   
                $subject = "This is subject";
                $header = "From:appointmanage017058@gmail.com";
                                            
                $retval = mail ($to,$subject,$body,$header);
                $_SESSION['otp'] = $otp;  
                $_SESSION['email'] = $email;                    
                if( $retval == true ) {
                    header("location:otp.php");
                }else {
                    echo '<script>alert("Message couldnt be sent!!")</script>';
                }
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
    <link rel="stylesheet" href="css/forgetpassword.css">
</head>
<body>
        <div class="container">
            <div class="pic">
                        <img src="./image/bg.jpg" alt="hiie">
            </div>
            <div class="data">
                <div class="head">
                <label for="">FORGET PASSWORD MODULE</label>
                </div>
                <div class="form">
                    <form method="POST">
                        <div class="info">
                            <div class="label">
                            <label for="">ENTER YOUR EMAIL</label>
                            </div>
                            <input type="text" name="email">
                        </div>
                        <div class="info">
                            <button type="submit" name="submit">SUBMIT</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>        
</body>
</html>