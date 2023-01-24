<html>
   
   <head>
      <title>Sending HTML email using PHP</title>
   </head>
   
   <body>
      
      <?php
         //ckpajapadxzeklqm my gmail app password
         $to = "tirtheshmotiwala@gmail.com";
         $subject = "This is subject";
         $body = "New request has been generated so kindly visit web to accept or reject it";
         $header = "From:appointmanage017058@gmail.com";
         
         $retval = mail ($to,$subject,$body,$header);
         
         if( $retval == true ) {
            echo "Message sent successfully...";
         }else {
            echo "Message could not be sent...";
         }
      ?>
      
   </body>
</html>