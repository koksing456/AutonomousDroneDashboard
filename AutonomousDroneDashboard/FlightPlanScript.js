var map = L.map('mapid').setView([3.0853, 101.6719], 13);

L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

//search location
L.Control.geocoder().addTo(map);


// need to change to user input
var startLat = document.getElementById("startLat").textContent;
var startLong = document.getElementById("startLong").textContent;
var endLat = document.getElementById("endLat").textContent;
var endLong = document.getElementById("endLong").textContent;

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
var startingMarker = L.marker([startLat, startLong], { icon: startingIcon, draggable: true, title: "Startttt!", autoPan: true }).addTo(map);
var endingMarker = L.marker([endLat, endLong], { icon: endingIcon, draggable: true, title: "Endddd!", autoPan: true}).addTo(map);

//coordinate after the marker is drag
marker.on('dragend', function (e) {
    document.getElementById('latitude').value = marker.getLatLng().lat;
    document.getElementById('longitude').value = marker.getLatLng().lng;
});


//Show popup on Marker
startingMarker.bindPopup("<b>Hello!</b><br>This is starting point." + startingMarker.getLatLng()).openPopup();
//endingMarker.bindPopup("<b>Hello!</b><br>This is ending point.").openPopup();

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

function drawPath() {
    //alert("Hello! I am an alert box!");

    var latlngs = [];

    //Get latlng from first marker
    latlngs.push([startLat, startLong]);

    //Get latlng from first marker
    latlngs.push([endLat, endLong]);

    //for loop here to retrieve coordinate and push each coordinate into the array to draw


    //You can just keep adding markers

    //From documentation http://leafletjs.com/reference.html#polyline
    // create a red polyline from an arrays of LatLng points
    var polyline = L.polyline(latlngs, { color: 'red' }).addTo(map);

    // zoom the map to the polyline
    map.fitBounds(polyline.getBounds());
}


