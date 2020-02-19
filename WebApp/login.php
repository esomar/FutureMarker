<?php

session_start();

// Check if the user is already logged in, if yes then redirect him to welcome page
if (isset($_SESSION["user_email"])) {
    header("location: Home.php");
    exit;
}

?>

<!DOCTYPE html>
<html>

<head>
    <title>Login For Future Marker Account </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="CSS/style.css">
    <script type="text/javascript" src="JS/index.js"></script>
</head>

<body>

    <!-- Navigation -->
    <div class="signupheader ">
        <nav class="navbar navbar-expand-sm navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="index.php">
                    <img class="navbar-brand" src="images/logo.png">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-xl-9 mx-auto">
                <div class="card card-signin flex-row my-5">
                    <div class="card-img-left d-none d-md-flex" style=" background-image: url('images/signup.jpg');">
                        <!-- Background image for card set in CSS! -->
                    </div>
                    <div class="card-body">
                        <h5 class="card-title text-center">Log In</h5>
                        <form class="form-signin" method="post" action="checkUser.php">


                            <div class="form-label-group">
                                <input type="email" id="inputEmail" name="user_email" class="form-control" placeholder="Email address" required>
                                <label for="inputEmail">Email address</label>
                            </div>

                            <hr>

                            <div class="form-label-group">
                                <input type="password" id="inputPassword" name="user_password" class="form-control" placeholder="Password" required>
                                <label for="inputPassword">Password</label>
                            </div>
                            <div class="form-label-group">
                                <select name="myList" class="form-control">
                                    <option value="1">instructor</option>
                                    <option value="2">student</option>

                                </select>
                            </div>
                            <button class="btn btn-lg btn-primary btn-block " type="submit">Log In</button>
                            <a class="d-block text-center mt-2 small" href="#">Forget Password ?</a>
                            <hr class="my-4">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>