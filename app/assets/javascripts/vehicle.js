// Function to init a google maps in view with markers
function initMap(lat, lng, locations) {
    
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
        center: myCoords,
        zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);

    // Add a new marker by each gps_point
    for(var i = 0; i < locations.length; i++){
        new google.maps.Marker({
          position: { lat: locations[i].latitude, lng: locations[i].longitude },
          title: locations[i].vehicle_id.toString(),
          map: map
        });
    }
}