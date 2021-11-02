﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlightPlan.aspx.cs" Inherits="AutonomousDroneDashboard.FlightPlan" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
          integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
          crossorigin="" />

    
    <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />

    <%--Drawing--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.4.2/leaflet.draw.css"/>
    


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


        <asp:Label ID="startLat" runat="server" Text="Starting Coordinate"></asp:Label>
        <asp:TextBox ID="startLatTXT" runat="server" Text="3.0865844"></asp:TextBox>
        <asp:TextBox ID="startLongTXT" runat="server" Text="101.6708223"></asp:TextBox>
            <br />
        <asp:Label ID="endLat" runat="server" Text="Ending Coordinate" ></asp:Label>
        <asp:TextBox ID="endLatTXT" runat="server" Text="3.0829738 "></asp:TextBox>
        <asp:TextBox ID="endLongTXT" runat="server" Text="101.6646802"></asp:TextBox>
        


            <br />
            <br />

        Mission Name: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="planFlightBtn" runat="server" Text="Plan Flight" OnClientClick="return false"/>
        <br />
        <asp:Label ID="coordinateDatalbl" runat="server" Text=""></asp:Label>
        
        
            
        
        
    </form>

    <script src="data/klang_river.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.4.2/leaflet.draw.js"></script>


    <script  type="text/javascript">
        var map = L.map('mapid', { drawControl: true }).setView([3.0853, 101.6719], 13);

        //OSM tile layer
        osm = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        });

        osm.addTo(map);

        //Google street map
        googleStreets = L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', {
            maxZoom: 20,
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
        });

        //googleStreets.addTo(map);

        googleHybrid = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}', {
            maxZoom: 20,
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
        });

        //googleHybrid.addTo(map);

        googleSat = L.tileLayer('http://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}', {
            maxZoom: 20,
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
        });

        //googleSat.addTo(map);

        googleTerrain = L.tileLayer('http://{s}.google.com/vt/lyrs=p&x={x}&y={y}&z={z}', {
            maxZoom: 20,
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3']
        });

        //googleTerrain.addTo(map);


        // need to change to user input
        var startLat = document.getElementById("startLatTXT").value;
        var startLong = document.getElementById("startLongTXT").value;
        var endLat = document.getElementById("endLatTXT").value;
        var endLong = document.getElementById("endLongTXT").value;

        //Maker icon
        var startingIcon = L.icon({
            iconUrl: 'img/icons8-drone-60.png',
            iconSize: [40, 40],
        });

        var endingIcon = L.icon({
            iconUrl: 'img/icons8-marker-100.png',
            iconSize: [40, 40],
        });


        //Add marker
        var startingMarker = L.marker([startLat, startLong], {
            icon: startingIcon,
            draggable: true,
            title: "Startttt!",
            autoPan: true
        }).addTo(map);

        var endingMarker = L.marker([endLat, endLong], {
            icon: endingIcon,
            draggable: true,
            title: "Endddd!",
            autoPan: true
        }).addTo(map);

        //coordinate after the marker is drag
        startingMarker.on('dragend', function (e) {
            document.getElementById('startLatTXT').value = startingMarker.getLatLng().lat;
            document.getElementById('startLongTXT').value = startingMarker.getLatLng().lng;
            startingMarker.bindPopup("<b>Hello!</b><br>This is starting point." + startingMarker.getLatLng()).openPopup();
        });

        endingMarker.on('dragend', function (e) {
            document.getElementById('endLatTXT').value = endingMarker.getLatLng().lat;
            document.getElementById('endLongTXT').value = endingMarker.getLatLng().lng;
            endingMarker.bindPopup("<b>Hello!</b><br>This is ending point." + endingMarker.getLatLng()).openPopup();
        });


        //Show popup on Marker when page is load
        startingMarker.bindPopup("<b>Hello!</b><br>This is starting point." + startingMarker.getLatLng()).openPopup();

        //Load GeoJson
        var riverLayout = L.geoJSON(riverLayoutJson).addTo(map);

        //Layer Control
        var baseMaps = {
            "Open Street Map": osm,
            "Google Streets": googleStreets,
            "Google Hybrid": googleHybrid,
            "Google Satellite": googleSat,
            "Google Terrain": googleTerrain
        };

        var overlayMaps = {
            "Starting Marker": startingMarker,
            "Ending Marker": endingMarker,
            "River Layout": riverLayout
        };

        L.control.layers(baseMaps, overlayMaps).addTo(map);

        //Search location
        L.Control.geocoder().addTo(map);

        ////Draw Control
        //// FeatureGroup is to store editable layers
        var drawnItems = new L.FeatureGroup();
        map.addLayer(drawnItems);
        var drawControl = new L.Control.Draw({
            draw: {
                polyline: false,
                polygon: false,
                marker: false,
                rectangle: false,
                circle: false,
                circlemarker: false
            },
            edit: {
                featureGroup: drawnItems
            }
        });
        map.addControl(drawControl);

        map.on('draw:created', function (event) {
            var layer = event.layer,
                feature = layer.feature = layer.feature || {};

            feature.type = feature.type || "Feature";
            var props = feature.properties = feature.properties || {};
            drawnItems.addLayer(layer);
        });



 

//standalone popup
//var standalonePopup = L.popup()
//    .setLatLng([3.0753, 101.6729])
//    .setContent("I am a standalone popup.")
//    .openOn(map);

//var popup = L.popup();
//var startingMarker = L.marker();
//var endingMarker = L.marker();
//const markers = [];

//function onMapClick(e) {
//    //popup
//    //    .setLatLng(e.latlng)
//    //    .setContent("You clicked the map at " + e.latlng.toString())
//    //    .openOn(map);
//    //    markers[0] = L.marker().setLatLng(e.latlng).addTo(map).bindPopup('This is your ' + ' point!').openPopup();

//}

//map.on('click', onMapClick);

//function drawPath() {
//    var pathArray = [];

//    ////Get latlng from first marker
//    //pathArray.push([startingMarker.getLatLng().lat, startingMarker.getLatLng().lng]);

//    //////Get latlng from first marker
//    //pathArray.push([endingMarker.getLatLng().lat, endingMarker.getLatLng().lng]);

//    //for (let i = 0; i < 10; i++) {
//    //    pathArray.push([riverLayoutJson.features[0].geometry.coordinates[i][1], riverLayoutJson.features[0].geometry.coordinates[i][0]]);
//    //}

//    //FIND A ALGORITHM TO FIND VALUE BETWEEN
//    //for (let i = 0; i < riverlayoutjson.features.length; i++){
//    var length = riverLayoutJson.features[0].geometry.coordinates.length;
//    for (let j = 0; j < length; j++) {
//        if (riverLayoutJson.features[0].geometry.coordinates[j][1] >= startingMarker.getLatLng().lat) {
//            if (riverLayoutJson.features[0].geometry.coordinates[j][0] >= startingMarker.getLatLng().lng) {
//                if (riverLayoutJson.features[0].geometry.coordinates[j][1] <= endingMarker.getLatLng().lat) {
//                    if (riverLayoutJson.features[0].geometry.coordinates[j][0] <= endingMarker.getLatLng().lng) {
//                            //var lat = riverlayoutjson.features[i].geometry.coordinates[j][1];
//                            //var long = riverlayoutjson.features[i].geometry.coordinates[j][0];
//                        patharray.push([riverLayoutJson.features[0].geometry.coordinates[j][1], riverLayoutJson.features[0].geometry.coordinates[j][0]]);
//                        }
//                    }
//                }
//            }
//        }    
//    //}

//    //for loop here to retrieve coordinate and push each coordinate into the array to draw


//    //You can just keep adding markers

//    //From documentation http://leafletjs.com/reference.html#polyline
//    // create a red polyline from an arrays of LatLng points
//    var polyline = L.polyline(pathArray, { color: 'red' }).addTo(map);

//    // zoom the map to the polyline
//    map.fitBounds(polyline.getBounds());

//    //alert ("Your path is set and you are ready to go!");
//}


    </script>
    
<%--Firebase--%>
    <script type="module">
        // Import the functions you need from the SDKs you need
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js";
        import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-analytics.js";
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries

        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        const firebaseConfig = {
            apiKey: "AIzaSyCC-D6wt3d2F06w3BuGM2WGd0EDVZMS_vE",
            authDomain: "drone-project-f9a08.firebaseapp.com",
            databaseURL: "https://drone-project-f9a08-default-rtdb.asia-southeast1.firebasedatabase.app",
            projectId: "drone-project-f9a08",
            storageBucket: "drone-project-f9a08.appspot.com",
            messagingSenderId: "563164922782",
            appId: "1:563164922782:web:bb2424cb956aa6dfa60c8f",
            measurementId: "G-9T34FLVDMH"
        };

        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const analytics = getAnalytics(app);

        import { getDatabase, ref, set, child, update, remove } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-database.js";

        const db = getDatabase();

        function InsertData() {
            $('#coordinateDatalbl').html(JSON.stringify(drawnItems.toGeoJSON()));
            var answer = document.getElementById("coordinateDatalbl").textContent;

            if (answer == '{"type":"FeatureCollection","features":[]}') {
                alert("You have not plan the flight yet.")
            } else {
                //insert to firebase
                var id = document.getElementById("TextBox1").value;
                set(ref(db, "MissionsTesting/" + id), {
                    Coordinate: answer
                })
                    .then(() => {
                        alert("Data stored Successfully!");
                    })
                    .catch("Unsuccessful");
            }

            
        }

        document.getElementById("planFlightBtn").addEventListener('click', InsertData);
    </script>

</body>
</html>

    