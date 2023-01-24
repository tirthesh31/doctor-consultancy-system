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
    <link rel="stylesheet" href="css/signup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
<?php
    if($conn)
    {
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $selQuery = "SELECT * FROM doctor_tbl WHERE dId = $id";
            $query = mysqli_query($conn,$selQuery);
                while($result = mysqli_fetch_array($query)){
                    $FName = $result['dFname'];
                    $LName = $result['dLname'];
                    $EmailId = $result['dEmailId'];
                    $Address = $result['dAddress'];
                    $Contact = $result['dContact'];
                    $DegreeName = $result['dDegreeName'];
                    $Specialty = $result['dSpeciality'];
                    $Exp = $result['dExp'];
                    $Password = $result['dPassword'];
                    $city = $result['city'];
                }
        }
        if(isset($_POST['submit']))
        {
            if(!empty($_POST['fName']) && !empty($_POST['lName'])
             && !empty($_POST['emailId']) && !empty($_POST['address']) 
             && !empty($_POST['contact']) && !empty($_POST['degreeName'])
             && !empty($_POST['specialty']) && !empty($_POST['experience'])
             )
            {
                if(($_POST['pwd'] === $_POST['cpwd']) or isset($_GET['id']))
                {
                    if(filter_var($_POST['emailId'], FILTER_VALIDATE_EMAIL))
                    {
                        if(is_numeric($_POST['contact']))
                        {
                            if(strlen($_POST['contact']) == 10)
                            {
                                $fName = strtoupper($_POST['fName']);
                                $lName = strtoupper($_POST['lName']);
                                $emailId = $_POST['emailId'];
                                $adrs = strtoupper($_POST['address']);
                                $city = strtoupper($_POST['city']);
                                $degreeName = strtoupper($_POST['degreeName']);
                                $specialty = strtoupper($_POST['specialty']);
                                $pass = $_POST['pwd'];
                                $hash_pass = password_hash($pass, PASSWORD_DEFAULT);
                                $con = $_POST['contact'];
                                $exp = strtoupper($_POST['experience']);


                                if(!isset($_GET['id'])){

                                    $query = "insert into doctor_tbl(dFname,dLname,dEmailId,dAddress,dContact,
                                    dDegreeName,dSpeciality,dExp,dPassword,city) values ('$fName','$lName','$emailId',
                                    '$adrs','$con','$degreeName','$specialty','$exp','$hash_pass','$city')";
                                }else{
                                    $query="UPDATE `doctor_tbl` SET `dfname`= '$fName',`dlname`= '$LName',`demailId`= '$emailId',`dAddress`= '$adrs',`dContact`= '$con',`dDegreeName`= '$degreeName',`dSpeciality`= '$specialty' WHERE `dId`=$id";
                                }
                                $query2="SELECT * FROM `doctor_tbl` where dEmailId='$emailId'";

                                if($result2 = mysqli_query($conn,$query2))
                                {
                                    $rowcount=mysqli_num_rows($result2);
                                    if($rowcount==0){
                                        if($result = mysqli_query($conn, $query))
                                        {
                                            $_SESSION['uEmailId'] = $emailId;
                                            if(!isset($_GET['id'])){
                                                $_SESSION['uPwd'] = $pass;
                                            }
                                            if(isset($_GET['id'])){
                                                $to = $emailId; 
                                                $body = "DATA Updated successfully";   
                                            }else{
                                                $to = "tirtheshmotiwala@gmail.com";
                                                $body = "New request has been generated so kindly visit web to accept or reject it";
                                            }
                                            $subject = "This is subject";
                                            $header = "From:appointmanage017058@gmail.com";
                                            
                                            $retval = mail ($to,$subject,$body,$header);
                                            
                                            if( $retval == true ) {
                                                echo '<script>alert("Message sent successful!!")</script>';
                                            }else {
                                                echo '<script>alert("Message couldnt be send!!")</script>';
                                            }
                                            
                                            header('location: signinpage.php');
                                        }
                                        else
                                        {
                                            echo '<script>alert("Insertion error!!")</script>';
                                        }
                                    }else{    
                                            echo '<script>alert("Fail!!")</script>';
                                        }
                                    }else{
                                        echo '<script>alert("Updation error!!")</script>';
                                    }   
                            }
                            else
                            {
                                echo '<script>alert("Contact number can only be of 10 digits!!")</script>';
                            }
                        }
                        else
                        {
                            echo '<script>alert("Enter valid contact number!!")</script>';
                        }
                    }
                    else
                    {
                        echo '<script>alert("Enter valid email Id!!")</script>';
                    }
                }
                else
                {
                    echo '<script>alert("Password doesnt mathc!!")</script>';
                }
            }
            else
            {
                echo '<script>alert("Enter data properly!!")</script>';
            }
        }
    }
    else
    {
        echo '<script>alert("Connection Error!!")</script>';
    }
    ?>
    <div class="container">
            <div class="signup-signup">
                <form class="sign-up-form" method="POST">
                    <h2 class="title">Sign up</h2>
                    <div class="perinfo">
                        <label>Personal Info</label></i>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="fName" placeholder="User-First-Name" <?php if(isset($_GET['id'])){echo "value=".$FName;}?> required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="lName" placeholder="User-Last-Name" <?php if(isset($_GET['id'])){echo "value=".$LName;}?> required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="email" name="emailId" placeholder="EmailId" <?php if(isset($_GET['id'])){echo "value=".$EmailId;}?> required>
                        </div>
                        <div class="input-field-textarea">
                            <i class="fas fa-map"></i>
                            <textarea name="address" id="adrs" rows="4" placeholder="Enter your clinic address with pincode" required><?php if(isset($_GET['id'])){echo $Address;}?></textarea>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-location"></i>
                            <input type="text" name="city" placeholder="Enter City" <?php if(isset($_GET['id'])){echo "value=".$city;}?> required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-phone"></i>
                            <input type="number" name="contact" placeholder="Contact" pattern="[0-9]{10}" <?php if(isset($_GET['id'])){echo "value=".$Contact;}?>>
                        </div>
                    </div>
                    <div class="edu">
                        <label>Education and Work experience:</label>
                        <div class="input-field">
                            <i class="fas fa-book"></i>
                            <input type="text" name="degreeName" placeholder="Degreename" <?php if(isset($_GET['id'])){echo "value=".$DegreeName;}?> required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-stethoscope"></i>
                            <input type="text" name="specialty" placeholder="Speciality" <?php if(isset($_GET['id'])){echo "value=".$Specialty;}?> required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-calendar"></i>
                            <select name="experience" id="exp" class="exp" <?php if(isset($_GET['id'])){echo "value=".$Exp;}?>>
                            <option value="1 year">1 year</option>
                            <option value="2 year">2 year</option>
                            <option value="3 year">3 year</option>
                            <option value="4 year">4 year</option>
                            <option value="5 year">5 year and More</option>
                            </select>
                        </div>
                    </div>
                    <?php if(!isset($_GET['id'])){?>
                    <div class="sec">
                        <label>Security:</label>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="pwd" placeholder="Password" required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="cpwd" placeholder="Confirm Password" required>
                        </div>
                    </div>
                    <?php  }  ?>
                    <div class="btn">
                        <input type="submit" class="btnsolid" value=<?php if(isset($_GET['id'])){ echo 'Update';}else{echo "sign up";}?> name="submit">
                    </div>
                </form>
                <div class="redlog">
                    <h3>Don't want to sign up than click here <a href="index.php">Click here</a></h3>
                </div>
            </div>
    </div>
</body>
</html>