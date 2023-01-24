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
    <title>Doctor Suggestion System</title>
    <!--Font link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <!--custom css link-->
    <link rel="stylesheet" href="css/homepage.css">
</head>
<body>
    <!--header section starts-->
    <header class="header">
        <a href="" class="logo"><i class="fas fa-heartbeat"></i>medcare</a>
        <nav class="navbar">
            <div class="link">
            <a href="#home">home</a>
                <a href="#services">services</a>
                <a href="#about">about</a>
                <a href="#doctors">doctor</a>
                <a href="#book">book</a>
                <a href="#review">review</a>
                <a href="#blog">blog</a>
                <a href="#contact us">contact us</a>
            </div>
            <div class="login">
                <a href="signinpage.php">login/Sign up</a>
            </div>
        </nav>

        <div id="menu-btn" class="fas fa-bars"></div> 
    </header>
    <!--header section ends-->
    <!--home section starts-->
    <section class="home" id="home">
        <div class="image">
            <img src="image/home-img.svg" alt="">
        </div>
        <div class="content">
            <h3>stay safe , stay healthy</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sapiente veritatis dolor architecto maiores ipsum enim perferendis 
                earum aperiam laborum minima ex ullam est eaque, provident rerum a debitis cum!</p>
        </div>
    </section>
    <!--home section ends-->
    <!--icon section starts-->
    <section class="icon-container">
        <div class="icons">
            <i class="fas fa-user-md"></i>
            <h3>140+</h3>
            <p>Doctors at work</p>
        </div>
        <div class="icons">
            <i class="fas fa-users"></i>
            <h3>1040+</h3>
            <p>Satisfied patients</p>
        </div>
        <div class="icons">
            <i class="fas fa-procedures"></i>
            <h3>500+</h3>
            <p>bed facilities</p>
        </div>
        <div class="icons">
            <i class="fas fa-hospital"></i>
            <h3>80+</h3>
            <p>avialable hospitals</p>
        </div>
    </section>
    <!--icon section ends-->
    <!--service section starts-->
    <section class="services" id="services">
        <h1 class="heading">our <span>services</span></h1>
        <div class="box-container">
            <div class="box">
                <i class="fas fa-notes-medical"></i>
                <h3>free checkups</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab des</p>
                
            </div>
            <div class="box">
                <i class="fas fa-ambulance"></i>
                <h3>24/7 ambulance</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab des</p>
                
            </div>
            <div class="box">
                <i class="fas fa-user-md"></i>
                <h3>expert doctors</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab des</p>
            </div>
            <div class="box">
                <i class="fas fa-pills"></i>
                <h3>medicines</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab des</p>
            </div>
            <div class="box">
                <i class="fas fa-procedures"></i>
                <h3>bed facility</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab des</p>
                
            </div>
            <div class="box">
                <i class="fas fa-heartbeat"></i>
                <h3>total cares</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ab des</p>
                
            </div>
        </div>
    </section>
    <!--service section ends-->
    <!--about section starts-->
    <section class="about" id="about">
        <h1 class="heading"><span>about</span>us</h1>
        <div class="row">
            <div class="image">
                <img src="image/about-img.svg" alt="">
            </div>
            <div class="content">
                <h3>We take care of your life</h3>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. At enim, voluptates nihil quis quia adipisci, sint ea tempore maiores exercitationem fugit nam? Neque, sint? Alias repellat unde error quibusdam molestias?</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore, minus facere est modi suscipit quaerat odit magni placeat necessitatibus ipsam aliquid sunt laborum excepturi non dolore praesentium, consequatur ipsum ex!</p>
                <a href="#" class="btn">Learn more<span class="fas fa-chevron-right"></span></a>
            </div>
        </div>
    </section>
    <!--about section ends-->
    <!--doctors section starts-->
    <section class="doctors" id="doctors">
        <h1 class="heading"> our <span>doctors</span></h1>
        <div class="box-container">
            <div class="box">
                <img src="image/doc-1.jpg" alt="">
                <h3>john deo</h3>
                <span>expert doctor</span>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>
            <div class="box">
                <img src="image/doc-2.jpg" alt="">
                <h3>john deo</h3>
                <span>expert doctor</span>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>
            <div class="box">
                <img src="image/doc-3.jpg" alt="">
                <h3>john deo</h3>
                <span>expert doctor</span>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>
            <div class="box">
                <img src="image/doc-4.jpg" alt="">
                <h3>john deo</h3>
                <span>expert doctor</span>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>
            <div class="box">
                <img src="image/doc-5.jpg" alt="">
                <h3>john deo</h3>
                <span>expert doctor</span>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>
            <div class="box">
                <img src="image/doc-6.jpg" alt="">
                <h3>john deo</h3>
                <span>expert doctor</span>
                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>
        </div>
    </section>
    <!--doctors section ends-->
    <!--booking section starts-->
    <?php
    if(isset($_POST['submit'])){
        if(!empty($_POST['fileid']) && !empty($_POST['city'])
         && !empty($_POST['doc']) && !empty($_POST['date'])
         && !empty($_POST['time'])){
            
            $id = $_POST['fileid'];
            $city = $_POST['city'];
            $dId = $_POST['doc'];
            $date = $_POST['date'];
            $time = $_POST['time'];
            $otp = rand(1111,9999);

            $query = mysqli_query($conn,"select * from patient_tbl where pId = '$id'");
            if($result = mysqli_fetch_array($query)){
                $emailId = $result['pEmailId'];
                $rowcount=mysqli_num_rows($query);
                if($rowcount==1){
                $_SESSION['fileId'] = $id;
                $_SESSION['forAppDocId'] = $dId;
                $_SESSION['forAppDocDate'] = $date;
                $_SESSION['forAppDocTime'] = $time;
                $_SESSION['paymentotp'] = $otp;  

                $to = $emailId;
                $subject = "OTP is Here";
                $header = "From:appointmanage017058@gmail.com";
                $body = "Greeting you, Please enter OTP for verification which was send to ypur repected mail: $otp";

                $retval = mail ($emailId,$subject,$body,$header);
                                                    
                if( $retval == true ) {
                    echo "<script> window.location.href = 'otp.php'; </script>";
                    //header('location: otp.php');
                }else {
                    echo '<script>alert("Message couldnt be send!!")</script>';
                    }
                }
            }
        }else{
            echo '<script>alert("Enter Proper Details.")</script>';
        }
    }
    ?>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="jquery.js">
        
    </script>
    <section class="book" id="book">
        <h1 class="heading"><SPAN>book</SPAN>now</h1>
        <div class="row">
            <div class="image">
                <img src="image/book-img.svg" alt="">
            </div>
            <div class="btnsec">
                <form method="POST">
                    <div class="info">
                        <div class="input_field">
                            <i class="fas fa-book"></i>
                            <input type="text" name="fileid" placeholder="File ID">
                        </div>
                        <?php
                            $Query = mysqli_query($conn,"SELECT DISTINCT dSpeciality FROM `doctor_tbl`");
                        ?>
                        <div class="input_field">
                            <i class="fas fa-stethoscope"></i>
                            <select name="stethoscope" id="stethoscope" >
                            <?php    
                            while($result = mysqli_fetch_array($Query)){?>
                                <option value="<?php echo $result['dSpeciality']?>"><?php echo $result['dSpeciality']?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="input_field">
                            <i class="fas fa-location"></i>
                            <input type="text" name="city" placeholder="City" id='city'>
                        </div>
                        <div class="input_field">
                            <i class="fas fa-stethoscope"></i>
                            <select name="doc" id="doc" >
                                <option value="">Select Doctor</option>
                            </select>
                        </div>
                        <div class="input_field">
                            <i class="fas fa-calendar"></i>
                            <select name="date" id="date">
                                <option value="">Select Date</option>
                            </select>
                        </div>
                        <div class="input_field">
                            <i class="fas fa-clock"></i>
                            <select name="time" id="time">
                                <option value="">Select Time</option>
                            </select>
                        </div>
                    </div>
                    <div class="btn">
                        <input type="submit" value="BOOK" name="submit">
                    </div>
                    <div class="btn">
                        <button ><a href="booking.php">REGISTER</a></button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--booking section ends-->
    <!--review section starts-->
    <section class="review" id="review">
        <h1 class="heading">client's <span>review</span></h1>
        <div class="box-container">
            <div class="box">
                <img src="image/pic-1.png" alt="">
                <h3>john deo</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <div class="text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error neque est voluptas tempora saepe. Deserunt explicabo asperiores debitis rerum accusamus repellat sapiente earum quia voluptates aliquid minima eum, repudiandae aperiam?</div>
            </div>
            <div class="box">
                <img src="image/pic-2.png" alt="">
                <h3>john deo</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <div class="text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error neque est voluptas tempora saepe. Deserunt explicabo asperiores debitis rerum accusamus repellat sapiente earum quia voluptates aliquid minima eum, repudiandae aperiam?</div>
            </div>
            <div class="box">
                <img src="image/pic-3.png" alt="">
                <h3>john deo</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <div class="text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error neque est voluptas tempora saepe. Deserunt explicabo asperiores debitis rerum accusamus repellat sapiente earum quia voluptates aliquid minima eum, repudiandae aperiam?</div>
            </div>
        </div>
    </section>
    <!--review section ends-->
    <!--blog section starts-->
    <section class="blog" id="blog">
        <h1 class="heading">our<span>blogs</span></h1>
        <div class="box-container">
            <div class="box">
                <div class="image">
                    <img src="image/blog-1.jpg" alt="">
                </div>
                <div class="content">
                    <div class="icon">
                        <a href="#"><i class="fas fa-calendar"></i>1st may,2021</a>
                        <a href="#"><i class="fas fa-user"></i>by, admin</a>
                    </div>
                    <h3>blog title goes here</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias fuga nesciunt vel temporibus quam ducimus eum a debitis. Enim dolorum repudiandae numquam aliquam quidem, nostrum cum deserunt incidunt earum reiciendis?</p>
                    <a href="#" class="btn">learn more <span class="fas fa-chevron-right"></span></a>
                </div>
            </div>
            <div class="box">
                <div class="image">
                    <img src="image/blog-2.jpg" alt="">
                </div>
                <div class="content">
                    <div class="icon">
                        <a href="#"><i class="fas fa-calendar"></i>1st may,2021</a>
                        <a href="#"><i class="fas fa-user"></i>by, admin</a>
                    </div>
                    <h3>blog title goes here</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias fuga nesciunt vel temporibus quam ducimus eum a debitis. Enim dolorum repudiandae numquam aliquam quidem, nostrum cum deserunt incidunt earum reiciendis?</p>
                    <a href="#" class="btn">learn more <span class="fas fa-chevron-right"></span></a>
                </div>
            </div>
            <div class="box">
                <div class="image">
                    <img src="image/blog-3.jpg" alt="">
                </div>
                <div class="content">
                    <div class="icon">
                        <a href="#"><i class="fas fa-calendar"></i>1st may,2021</a>
                        <a href="#"><i class="fas fa-user"></i>by, admin</a>
                    </div>
                    <h3>blog title goes here</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias fuga nesciunt vel temporibus quam ducimus eum a debitis. Enim dolorum repudiandae numquam aliquam quidem, nostrum cum deserunt incidunt earum reiciendis?</p>
                    <a href="#" class="btn">learn more <span class="fas fa-chevron-right"></span></a>
                </div>
            </div>
        </div>
    </section>g
    <!--blog section ends-->
    <!--footer section starts-->

    <!--footer section ends-->
    <section class="footer" id="contact us">
        <div class="box-container">
            <div class="box">
                <h3>quick links</h3>
                    <a href="#"><i class="fas fa-chevron-right"></i>home</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>services</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>about</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>doctors</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>book</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>review</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>blogs</a>
            </div>
            <div class="box">
                <h3>our services</h3>
                    <a href="#"><i class="fas fa-chevron-right"></i>dental care</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>message therapy</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>cardioloty</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>diagnosis</a>
                    <a href="#"><i class="fas fa-chevron-right"></i>ambulance service</a>
            </div>
            <div class="box">
                <h3>contact info</h3>
                    <a href="#"><i class="fas fa-phone"></i>+123-456</a>
                    <a href="#"><i class="fas fa-phone"></i>+999-456</a>
                    <a href="#"><i class="fas fa-envelope"></i>tirthmotiwala@gmail.com</a>
                    <a href="#"><i class="fas fa-envelope"></i>khushinakum@gmail.com</a>
                    <a href="#"><i class="fas fa-map-marker-alt"></i>mumbai, india -400104</a>
            </div>
            
            <div class="box">
                <h3>follow us</h3>
                    <a href="#"><i class="fab fa-facebook"></i>facebook</a>
                    <a href="#"><i class="fab fa-twitter"></i>twiiter</a>
                    <a href="#"><i class="fab fa-instagram"></i>instagram</a>
                    <a href="#"><i class="fab fa-linkedin"></i>linkedin</a>
                    <a href="#"><i class="fab fa-pinterest"></i>pinterest</a>
            </div>
        </div>
        <div class="credit">created by <span>Tirthesh Motiwala</span></div>
    </section>
    <!--custom js file -->
    <script src="js/script.js"></script>
</body>
</html>