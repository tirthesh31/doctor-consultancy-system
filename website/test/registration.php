<?php
$servername = "localhost:3307";
$username = "root";
$password = "";
$database = "beginner";
// Create connection
$conn = mysqli_connect($servername, $username, $password,$database);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
session_start();
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.phptutorial.net/app/css/style.css">
    <title>Register</title>
</head>
<?php
    if(isset($_POST["submit"])){
        $userName = $_POST["username"];
        $emailId = $_POST["email"];
        $password = $_POST["password"];

        if(!isset($_GET["id"])){
            $sql = "INSERT INTO registration (userName,userEmailId,password) values ('$userName','$emailId','$password')";
        }else{
            $id = $_GET["id"];
            $sql = "UPDATE `registration` SET `userName`='$userName',`userEmailId`='$emailId',`password`='$password' WHERE `userId`= '$id'"; 
            header("location:dud.php");
        }
        if($result = mysqli_query($conn,$sql)){
            echo "Successful";
        }else{
            echo "Failed";
        }


    }
?>
<body>
<main>
    <form method="post">
        <h1>Sign Up</h1>
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username">
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email">
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password">
        </div>
        <div>
            <label for="password2">Password Again:</label>
            <input type="password" name="password2" id="password2">
        </div>
        <div>
            <label for="agree">
                <input type="checkbox" name="agree" id="agree" value="yes"/> I agree
                with the
                <a href="#" title="term of services">term of services</a>
            </label>
        </div>
        <button type="submit" name="submit">Register</button>
        <footer>Already a member? <a href="login.php">Login here</a></footer>
    </form>
</main>
</body>
</html>