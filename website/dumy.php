<?php
 include 'backendFile\Connection.php';
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up</title>
    <link rel="stylesheet" href="css/signin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
    <?php
    if($conn){
        if(isset($_POST['submit'])){
            echo "hrll";
            if(!empty($_POST['emailId']) && !empty($_POST['pwd']))
            {
                    $emailId = $_POST['emailId'];
                    $pwd = $_POST['pwd'];
                    echo $pwd;
                    echo "hrll";

                    $query = "SELECT * FROM `doctor_tbl` where `dEmailId`='$emailId'";
                     
                    if($result2 = mysqli_query($conn,$query))
                    {
                            $row1 = $result2 -> fetch_assoc();
                            $dId = $row1["dId"];
                            $dEmailId = $row1["dEmailId"];
                            $dPwd = $row1["dPassword"];
                           // $hashpwd = password_hash($pwd,PASSWORD_DEFAULT);
                            if($emailId == $dEmailId){
                                echo 'pass';
                                echo $pwd;
                                if(password_verify($pwd,$dPwd))
                                {
                                echo 'hrrl3';
                                $_SESSION["uEmailId"] = $emailId;
                                header('location: profileheader.php');
                            }else{
                                echo $dPwd."database <br>";
                                //echo $hashpwd;
                                echo 'fail';
                            }
                        }
                    }
            }
            else{
                echo 'Enter data properly';
            }
        }
    }
    else{
        echo 'Connection error';
    }
    ?>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form method="POST" class="sign-in-form">
                    <a href="index.php" class="logo"><i class="fas fa-heartbeat"></i>medcare</a>
                    <h2 class="title">Sign in</h2>
                    <label>Email ID:</label>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="emailId" placeholder="EMAIL ID" required>
                    </div>
                    <label>Password:</label>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="pwd" placeholder="password" >
                    </div>
                    <input type="submit" name="submit" class="btnsolid" value="Login">
                </form>
                <div class="pic">
                    <img src="./image/bg.jpg" alt="hiie">
                </div>
                <div class="btn">
                    <h3 style=" font-size: 12px;">If you dont register. Please register first <a href="signuppage.php" style="font-size: 14px;">REGISTER</a></h3>
                    <h3 style="font-size: 12px; margin-top: 5px;">If you lost your password than click on this link<a href="forgetpassword.php" style="font-size: 14px;">FORGET PASSWORD</a></h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>