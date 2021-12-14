<%@ Page Language="C#" Title="Profile" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AutonomousDroneDashboard.Profile" %>
<%@ MasterType VirtualPath="~/Site1.Master" %> 

 <asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
 </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
            <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="img/profile.svg" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Profile</h3>
                                    <p class="mb-4"></p>
                                </div>
                                    <div class="form-group first">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" id="email">
                                    </div>
                                    <div class="form-group first">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password">
                                    </div>

                                    <div class="form-group last mb-4">
                                        <label for="password">Retype Password</label>
                                        <input type="password" class="form-control" id="retypePassword">
                                    </div>

                                    <input type="submit" value="Set" class="btn btn-block btn-primary" id="setBtn">
                                    <p class="error pink-text center-align" id="error" style="color:red;"></p>
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
        <script src="authProfile.js" type="module"></script>
</asp:Content>
