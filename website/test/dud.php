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
$result = mysqli_query($conn,"SELECT * FROM registration"); 
session_start();
 ?>
<!DOCTYPE html>
<html>
        <style>
        table, th, td {
        border: 1px solid;
        }
        table{
            text-align: center;
            justify-content: center;
            margin-left: 30%;
        }
        </style>
<body>
<table>
    <tr>
    <th>Id</th>
    <th>Name</th>
    <th>email Id</th>
    <th>Password</th>
    <th colspan="2">operation</th>
    </tr>
    <?php
    while($row = mysqli_fetch_array($result)){
        ?>
    <tr>
        <td> <?php echo $row['userId']?></td>
        <td><?php echo $row['userName']?></td>
        <td><?php echo $row['userEmailId']?></td>
        <td><?php echo $row['password']?></td>
        <td><a href="registration.php?id=<?php echo $row['userId'];?>">Edit</a></td>
        <td><a href="dud.php?del=<?php echo $row['userId']; ?>">Delete</a></td>
    </tr>
    <?php
    }
    ?>
    <?php
    if(isset($_GET["id"])){
        $id = $_GET["id"];
        $_SESSION["id"] = $id;
        header("location:registration.php");
    }else{
        echo "error";
    }

    if(isset($_GET["del"])){
        $id = $_GET["del"];
        $sql = "delete from registration where userId = '$id'";
        mysqli_query($conn,$sql);
        header("location:dud.php");
    }
    ?>
</table>
</form>
</body>
</html>