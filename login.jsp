
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- ===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <!-- ===== CSS ===== -->
    <link rel="stylesheet" href="css/loginstyle.css">
         
    <title>Login & Registration Form</title>
    </head>
    <body>
       
    <div class="container">
        <div class="forms">
            <div class="form login">
                <%@include file="components/message.jsp" %>
                <span class="title">Login</span>

                <form action="LoginServlet" method="post">
                    <div class="input-field">
                        <input name="email" type="text" placeholder="Enter your email" required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input name="password" type="password" class="password" placeholder="Enter your password" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>

                    

                    <div class="input-field button">
                        <input type="submit" value="Login Now">
                    </div>
                </form>

                <div class="login-signup">
                    <span class="text">Not a member?
                        <a href="#" class="text signup-link">Signup now</a>
                    </span>
                </div>
            </div>

            <!-- Registration Form -->
            <div class="form signup">
                <span class="title">Registration</span>

                <form action=RegisterServlet method="post">
                    <div class="input-field">
                        <input name="user_name" type="text" id="id" placeholder="Enter your name" required>
                        <i class="uil uil-user"></i>
                    </div>
                    <div class="input-field">
                        <input name="user_email" type="text" id="email" placeholder="Enter your email" required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input name="user_password" type="password" class="password" id="password" placeholder="Create a password" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>
                    <div class="input-field">
                        <input name="user_phone" type="tel"  id="phone" placeholder="Enter your phone no" required>
                        <i class="uil uil-phone icon"></i>
                    </div>
                    <div class="input-field">
                        <input name="user_address" type="textarea" id="address" placeholder="Enter your Address" required>
                        <i class="uil uil-home icon"></i>
                    </div>

                    

                    <div class="input-field button">
                        <input type="submit" value="Register">
                    </div>
                </form>

                    <div class="login-signup">
                    <span class="text">Already a member?
                        <a href="#" class="text login-link">Login now</a>
                    </span>
                </div>
            
            </div>
        </div>
    </div>

    <script src="loginscript.js"></script>

    </body>
</html>
