<?php include 'admin.php'; 
session_start();
if(!isset($_SESSION['uEmailId'])){
    echo "<script>location.href='signinpage.php'</script>";
}
?>
<div class="data">
<div class="indata">
        <label for="ID">ID:</label><input type="number" name="ID"><button>FIND</button>
    </div>
<div class="tbl">
        <table>
        <tr>
            <th>Sr.NO</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Emai-Id</th>
            <th>Contact</th>
            <th>Gender</th>
            <th>Password</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Maria</td>
            <td>Anders</td>
            <td>Maria@gmail.com</td>
            <td>8989087888</td>
            <td>Female</td>
            <td>uabicus</td>
            <td><i class="fas fa-pen"></i></td>
            <td><i class="fas fa-delete"></i></td>
        </tr>
        </table>
    </div>
</div>
</body>
</html>