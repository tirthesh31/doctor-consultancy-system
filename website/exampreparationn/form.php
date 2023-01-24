<?php
include 'C:\xampp\htdocs\website\exampreparationn\connect.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INPUT form</title>
    <link rel="stylesheet" href="form.css">
</head>

<?php

if(isset($_POST['submit'])){
    if(!empty($_POST['fName']) && !empty($_POST['lName'])
    && !empty($_POST['email']) && !empty($_POST['contact'])
    && !empty($_POST['bd']) && !empty($_POST['country'])
    && !empty($_POST['state']) && !empty($_POST['city'])
    && !empty($_POST['loc']) && !empty($_POST['pwd'])){
        if(is_numeric($_POST['contact'])){
            if(strlen($_POST['contact']) == 10){
                if(filter_var(($_POST['email']),FILTER_VALIDATE_EMAIL)){
                    $fName = $_post['fName'];
                    $lName = $_post['lName'];
                    $email = $_post['email'];
                    $contact = $_post['contact'];
                    $bd = $_post['bd'];
                    $co = $_post['country'];
                    $s = $_post['state'];
                    $c = $_post['city'];
                    $loc = $_post['loc'];
                    $pwd = $_post['pwd'];
                    
                }
            }else{
                echo("<script>alert('Enter your Contact details properly')</script>");
            }
        }else{
        echo("<script>alert('Enter your Contact details properly')</script>");
        }
    }else{
        echo("<script>alert('some of fields are empty')</script>");
    }
}
?>
<script src='ajaxform.js'>

</script>
<body>
    <form method="post">
        <div class="Main">
            <div class="basicDiv">
                <label>Basic info</label>
                <input type="text" name="fName" id="" placeholder="First Name">
                <input type="text" name="lName" id="" placeholder="Last Name">
                <input type="text" name="email" id="" placeholder="EMAIL ID">
                <input type="number" name="contact" id="" placeholder="Contact">
                <input type="date" name="bd" id="" placeholder="Birth date">
            </div>
            <div class="occupation">
                <label>Occupation</label>
                <select name="country" id="country" placeholder="Choose country">
                <?php
                $query = mysqli_query($conn,"SELECT * FROM `countrytbl`");
                while($result = mysqli_fetch_array($query)){
                ?>
                    <option value="<?php echo $result['cid'];?>"><?php echo $result['cName'];?></option>
                <?php
                }
                ?>
                </select>
                <select name="state" id="state" placeholder="Choose state">
                    <option value=""></option>
                </select>
                <select name="city" id="city" placeholder="Choose city">
                    <option value=""></option>
                </select>
                <input type="textarea" name="loc" id="" placeholder="street or else"> 
            </div>
            <div class="authentication">
                <label>Authentication</label>
                <input type="password" name="pwd" placeholder="Password">
                <input type="password" name="pwd" placeholder="Confirm Password">
            </div>
            <div class="btn">
                <input type="submit" value="submit" name="submit">
            </div>
        </div>
    </form>
</body>
</html>