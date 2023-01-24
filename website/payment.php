<?php
include 'backendFile\Connection.php';
session_start();

if(isset($_POST['submit'])){
  if(!empty($_POST['cardNumber']) && !empty($_POST['dateNumber']) &&
   !empty($_POST['cvvNumber']) && !empty($_POST['cardName'])){
    $id = $_SESSION['fileId'];
    $dId = $_SESSION['forAppDocId'];
    $date = $_SESSION['forAppDocDate'];
    $time = $_SESSION['forAppDocTime'];
    
    $query1 = mysqli_query($conn,"INSERT INTO `appointment_tbl`(`pId`, `dId`, `date`, `time`) 
    VALUES ('$id','$dId','$date','$time')");
    if($query1){
      $query = mysqli_query($conn,"select * from patient_tbl where pId = '$id'");
      if($result = mysqli_fetch_array($query)){
          $emailId = $result['pEmailId'];
          $rowcount=mysqli_num_rows($query);
          if($rowcount==1){
          $to = $emailId;
          $subject = "Payment done Successful";
          $header = "From:appointmanage017058@gmail.com";
          $body = "Greeting you, Payment successfully done and your appointment on ".$date." at ".$time."has been booked";

          $retval = mail ($emailId,$subject,$body,$header);
                                              
          if( $retval == true ) {
              echo "<script> window.location.href = 'index.php'; </script>";
              //header('location: otp.php');
          }else {
              echo '<script>alert("Message couldnt be send!!")</script>';
              }
          }
      }
    }
  }
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width,
               initial-scale=1.0"/>
    <link rel="stylesheet" href="css\style.css" 
          class="css" />
  </head>
  <body>
    <div class="container">
      <div class="main-content">
        <p class="text">PaymentGateway</p>
      </div>
  
      <div class="centre-content">
        <h1 class="price">399<span>/-</span></h1>
        <p class="course">
           Book your Appointment Now!
        </p>
      </div>
  
      <div class="card-details">
        <p>Pay using Credit or Debit card</p>
      <form method="post">
        <div class="card-number">
          <label> Card Number </label>
          <input
            type="text"
            class="card-number-field" name="cardNumber"
            placeholder="###-###-###"/>
        </div>

        <div class="date-number">
          <label> Expiry Date </label>
          <input type="text" class="date-number-field" name="dateNumber"
                 placeholder="DD-MM-YY" />
        </div>
  
        <div class="cvv-number">
          <label> CVV number </label>
          <input type="text" class="cvv-number-field" name="cvvNumber"
                 placeholder="xxx" />
        </div>
        <div class="nameholder-number">
          <label> Card Holder name </label>
          <input
            type="text"
            class="card-name-field" name="cardName"
            placeholder="Enter your Name"/>
        </div>
        <button type="submit" 
                class="submit-now-btn" name="submit">
          submit
        </button>
      </form>
      </div>
    </div>
  </body>
</html>