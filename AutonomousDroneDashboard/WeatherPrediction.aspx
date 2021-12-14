<%@ Page Language="C#" Title="Weather" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WeatherPrediction.aspx.cs" Inherits="AutonomousDroneDashboard.WeatherPrediction" %>
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

     <link rel="stylesheet" href="css/weather.css">

    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <br><br><br>
    <center>
        <p id="inputContainer">City: <input type="text" id="cityInput"></p>
        <button type="button" onclick="GetInfo()">Forecast</button>        
        <h2 id="cityName">---Kuala Lumpur---</h2>
        <p class="error pink-text center-align" id="error" style="color:red;"></p>
    </center>
    
    
    <div id = "weatherContainer">
        <div id="iconsContainer">    
            <div class = "icons">
                <p class="weather" id="day1"></p>
                <div class="image"><img src="dots.png" class="imgClass" id="img1"></div>
                <p class="minValues" id="day1Min">Loading...</p>
                <p class="maxValues" id="day1Max">Loading...</p>
            </div>
            <div class = "icons">
                <p class="weather" id="day2"></p>
                <div class="image"><img src="dots.png" class="imgClass" id="img2"></div>
                <p class="minValues" id="day2Min">Loading...</p>
                <p class="maxValues" id="day2Max">Loading...</p>
            </div>
            <div class = "icons">
                <p class="weather" id="day3"></p>
                <div class="image"><img src="dots.png" class="imgClass" id="img3"></div>
                <p class="minValues" id="day3Min">Loading...</p>
                <p class="maxValues" id="day3Max">Loading...</p>
            </div>
            <div class = "icons">
                <p class="weather" id="day4"></p>
                <div class="image"><img src="dots.png" class="imgClass" id="img4"></div>
                <p class="minValues" id="day4Min">Loading...</p>
                <p class="maxValues" id="day4Max">Loading...</p>
            </div>
            <div class = "icons">
                <p class="weather" id="day5"></p>
                <div class="image"><img src="dots.png" class="imgClass" id="img5"></div>
                <p class="minValues" id="day5Min">Loading...</p>
                <p class="maxValues" id="day5Max">Loading...</p>
            </div>
        </div>
    </div>


<script>
    function GetInfo() {

        var newName = document.getElementById("cityInput");
        var cityName = document.getElementById("cityName");
        cityName.innerHTML = "--" + newName.value + "--";

        fetch('https://api.openweathermap.org/data/2.5/forecast?q=' + newName.value + '&appid=32ba0bfed592484379e51106cef3f204')
            .then(response => response.json())
            .then(data => {

                //Getting the min and max values for each day
                for (i = 0; i < 5; i++) {
                    document.getElementById("day" + (i + 1) + "Min").innerHTML = "Min: " + Number(data.list[i].main.temp_min - 273.15).toFixed(1) + "°";
                    //Number(1.3450001).toFixed(2); // 1.35
                }

                for (i = 0; i < 5; i++) {
                    document.getElementById("day" + (i + 1) + "Max").innerHTML = "Max: " + Number(data.list[i].main.temp_max - 273.15).toFixed(2) + "°";
                }
                //------------------------------------------------------------

                //Getting Weather Icons
                for (i = 0; i < 5; i++) {
                    document.getElementById("img" + (i + 1)).src = "http://openweathermap.org/img/wn/" +
                        data.list[i].weather[0].icon
                        + ".png";
                }
                //------------------------------------------------------------
                console.log(data)
                document.getElementById('error').innerHTML = ''

            })

            .catch(err => document.getElementById('error').innerHTML = 'City is invalid');
    }

    function DefaultScreen() {
        document.getElementById("cityInput").defaultValue = "Kuala Lumpur";
        GetInfo();
    }


    //Getting and displaying the text for the upcoming five days of the week
    var d = new Date();
    var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",];

    //Function to get the correct integer for the index of the days array
    function CheckDay(day) {
        if (day + d.getDay() > 6) {
            return day + d.getDay() - 7;
        }
        else {
            return day + d.getDay();
        }
    }

    for (i = 0; i < 5; i++) {
        document.getElementById("day" + (i + 1)).innerHTML = weekday[CheckDay(i)];
    }
</script>

</asp:Content>