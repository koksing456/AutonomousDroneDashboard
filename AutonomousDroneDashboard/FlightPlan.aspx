<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlightPlan.aspx.cs" Inherits="AutonomousDroneDashboard.FlightPlan" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
          integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
          crossorigin="" />

<style>
        #mapid {
            height: 500px;
        }
    </style>

</head>

<body>
    
     
    <form id="form1" runat="server">
            <div id="mapid"></div>
         <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
            integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
            crossorigin=""></script>
        <asp:Label ID="lblRiverName" runat="server" Text="Label"></asp:Label>
    </form>
    <script src="FlightPlanScript.js"></script>

</body>
</html>
