<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AutonomousDroneDashboard.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="fonts/icomoon/style.css" />

    <link rel="stylesheet" href="css/owl.carousel.min.css" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css"/>

</head>
<body>
 <div class="content">
    <div class="container">
      <div class="row">
        
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Register</h3>
              <p class="mb-4">Get Started Now.</p>
            </div>
            <form id="signup-form">

                <div class="form-group first">
                <label for="username">Email</label>
                <input type="text" class="form-control" id="email" />
              </div>

              <div class="form-group first">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" />              
              </div>

                <div class="form-group last mb-4">
                <label for="password">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" />                
              </div>

              <input type="submit" value="Create My Account" class="btn btn-block btn-primary" />
                <p class="error pink-text center-align" style="color:red;"></p>
            </form>
            </div>
          </div>
          
        </div>
          <div class="col-md-6">
          <img src="img/signup.svg" alt="Image" class="img-fluid">
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>

    <script src="authSignup.js" type="module"></script>

</html>
