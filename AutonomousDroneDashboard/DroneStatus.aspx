<%@ Page Language="C#" Title="Drone Status" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DroneStatus.aspx.cs" Inherits="AutonomousDroneDashboard.DroneStatus" %>
<%@ MasterType VirtualPath="~/Site1.Master" %> 

 <asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
         <style type="text/css">
             .auto-style1 {
                 height: 30px;
             }
             .auto-style2 {
                 width: 816px;
                 height: 390px;
             }
         </style>
    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <br /><br /><br /><br />
    <table style="margin-left:100px; border:dotted;" border="1" class="auto-style2">
        <tr>
            <td class="auto-style1">Drone Name: </td>
            <td class="auto-style1">KS DRONE</td>
        </tr>
        <tr></tr>
        <tr>
            <td>Battery: </td>
            <td>100%</td>
        </tr>
        <tr></tr>
        <tr>
            <td>Fly Distance: </td>
            <td>500KM</td>
        </tr>
        <tr></tr>
        <tr>
            <td>Flying Time: </td>
            <td>10 hours</td>
        </tr>
    </table>
</asp:Content>