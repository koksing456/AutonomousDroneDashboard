var mymap = L.map('mapid').setView([3.0853, 101.6719], 13);

L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
}).addTo(mymap);

//Add marker
var startingMarker = L.marker([3.0853, 101.6719]).addTo(mymap);
var endingMarker = L.marker([3.0959, 101.772]).addTo(mymap);

startingMarker.bindPopup("<b>Hello!</b><br>This is starting point.").openPopup();
//endingMarker.bindPopup("<b>Hello!</b><br>This is ending point.").openPopup();

//standalone popup
var standalonePopup = L.popup()
    .setLatLng([3.0753, 101.6729])
    .setContent("I am a standalone popup.")
    .openOn(mymap);

var popup = L.popup();

function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(mymap);
}

mymap.on('click', onMapClick);