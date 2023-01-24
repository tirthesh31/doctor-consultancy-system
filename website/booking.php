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
    <link rel="stylesheet" href="css/booking.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
    <?php
    if($conn)
    {
        if(isset($_POST['submit']))
        {
            if(!empty($_POST['fName']) && !empty($_POST['LName'])
             && !empty($_POST['emailId']) && !empty($_POST['address']) 
             && !empty($_POST['contact']) && !empty($_POST['gender'])
             && !empty($_POST['bldgrp']) && !empty($_POST['height'])
             && !empty($_POST['weight']))
            {
                    if(filter_var($_POST['emailId'], FILTER_VALIDATE_EMAIL))
                    {
                        if(is_numeric($_POST['contact']))
                        {
                            if(strlen($_POST['contact']) == 10)
                            {
                                $fName = strtoupper($_POST['fName']);
                                $lName = strtoupper($_POST['LName']);
                                $emailId = $_POST['emailId'];
                                $adrs = strtoupper($_POST['address']);
                                $city = strtoupper($_POST['City']);
                                $gender = strtoupper($_POST['gender']);
                                $bldgrp = strtoupper($_POST['bldgrp']);
                                $con = $_POST['contact'];
                                $height = ($_POST['height']);
                                $weight = ($_POST['weight']);

                                $query = "insert into patient_tbl(pFname,pLname,pEmailId,pAddress,pContact,
                                pGender,pBloodGrp,pHeight,pWeight,city) values ('$fName','$lName','$emailId',
                                '$adrs','$con','$gender','$bldgrp','$height','$weight','$city')";

                                $query2="SELECT * FROM `patient_tbl` where pEmailId='$emailId'";
                                if($result2 = mysqli_query($conn,$query2))
                                {
                                    $rowcount=mysqli_num_rows($result2);
                                    if($rowcount==0){
                                        if($result = mysqli_query($conn, $query))
                                        {
                                            $_SESSION['newPatientEmailId'] = $emailId;
                                            header('location: mail.php');
                                        }
                                        else
                                        {
                                            echo '<script>alert("Insertion Error!!")</script>';
                                        }
                                    }else{    
                                        echo '<script>alert("Following Email Id is already been taken!!")</script>';
                                    }
                                }
                            }
                            else
                            {
                                echo '<script>alert("Contact number can only be of 10 digit!!")</script>';
                            }
                        }
                        else
                        {
                            echo '<script>alert("Enter valid contact number!!")</script>';
                        }
                    }
                    else
                    {
                        echo '<script>alert("Enter valid email address!!")</script>';
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
        echo "Connection Error";
    }
    ?>
    <div class="container">
            <div class="signup-signup">
                <form class="sign-up-form" method="POST">
                    <h2 class="title">Appointment Registration Form</h2>
                    <div class="perinfo">
                        <label>Personal Info</label></i>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="User-First-Name" name="fName" required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="User-Last-Name" name="LName" required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="email" placeholder="EmailId" name="emailId" required>
                        </div>
                        <div class="input-field-textarea">
                            <i class="fas fa-map"></i>
                            <textarea name="address" id="adrs" rows="4" name="address" placeholder="Enter the your address" required></textarea>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-location"></i>
                            <input type="text" placeholder="Enter City" name="City">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-phone"></i>
                            <input type="number" placeholder="Contact" name="contact" pattern="[0-9]{10}">
                        </div>
                    </div>
                        <div class="operinfo">
                            <label>Other Personal Info</label></i>
                            <div class="input-field-radio">
                                <label>GENDER</label><br>
                                <input name="gender" type="radio" value="male" required>
                                <i class="fas fa-male"></i>
                                <label>Male</label>
                                <br>
                                <input name="gender" type="radio" value="female" required>
                                <i class="fas fa-female"></i>
                                <label>Female</label>
                                <br>
                                <input name="gender" type="radio" value="other" required>
                                <i class="fas fa-male"></i>
                                <label>Others</label>
                            </div>
                            <div class="if">
                            <div class="input-field">
                                <i class="fas fa-blood"></i>
                                <select name="bldgrp" id="bgrp" class="bgrp">
                                <option value="none" selected disabled hidden>Select an Option</option>    
                                <option value="A+">A+</option>
                                <option value="B+">B+</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                                <option value="A-">A-</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                </select>
                            </div>
                            <div class="input-field">
                                <i class="fa-solid fa-highlighter"></i>
                                <input type="text" name="height" placeholder="Height" required>
                            </div>
                            <div class="input-field">
                                <i class="fa-solid fa-weight"></i>
                                <input type="text" name="weight" placeholder="Weight" required>
                            </div>
                            </div>
                    </div>
                    <div class="btn">
                        <input type="submit" class="btnsolid" value="Sign-up" name="submit">
                    </div>
                </form>
                <div class="redlog">
                    <h3>Don't want to sign up than click here <a href="index.php">Click here</a></h3>
                </div>
            </div>
    </div>
</body>
</html>