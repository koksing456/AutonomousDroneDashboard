<%@ Page Language="C#" Title="Password Reset" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="AutonomousDroneDashboard.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="fonts/icomoon/style.css" />

    <link rel="stylesheet" href="css/owl.carousel.min.css" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Style -->
    <link rel="stylesheet" href="css/style.css" />

    <style>
        #resetPW {
            text-align: center;
        }

        #bottomPart {
            margin-left: 500px;
        }
    </style>

</head>
<body>

        <div id="resetPW">
            <div class="mb-4">
                <img src="img/forgotpassword.svg" alt="Image" class="img-fluid">
                <h3>Password Reset</h3>
                <p class="mb-4">Don't worry! Just enter your email and we'll send you a link to reset your password.</p>
            </div>
            <div id="bottomPart">
                <div class="resetPWContent">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 contents">
                                <form id="reset-form">
                                <div class="form-group first">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="resetemail"/>
                                </div>
                                <input type="submit" value="Reset Password" class="btn btn-block btn-primary" id="resetBtn" />
                                <p class="error pink-text center-align" style="color:red;"></p>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>

</body>

    <script src="authResetPassword.js" type="module"></script>
</html>
