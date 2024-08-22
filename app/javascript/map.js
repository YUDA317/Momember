/*global google*/

document.addEventListener('turbolinks:load', function() {
  let map;
  let geocoder;
  const display = document.getElementById('display');

  function initMap(){
    geocoder = new google.maps.Geocoder();
    map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 35.6803997, lng: 139.7690174 },
      zoom: 10,
    });

    let marker = new google.maps.Marker({
      position:  {lat: 40.7828, lng:-73.9653},
      map: map
    });

    google.maps.event.addListener(map, 'click', mylistener);

    function mylistener(event){
      // let map_lat = document.getElementById('post_lat');
      // let map_lng = document.getElementById('post_lng');
      marker.setPosition(new google.maps.LatLng(event.latLng.lat(), event.latLng.lng()));
      marker.setMap(map);
      // map_lat.value = event.latLng.lat();
      // map_lng.value = event.latLng.lng();
    }
  }

  function codeAddress(){
    let inputAddress = document.getElementById('address').value;

    geocoder.geocode( { 'address': inputAddress}, function(results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
        display.textContent = "検索結果：" + results[ 0 ].geometry.location;
      } else {
        alert('該当する結果がありませんでした：' + status);
      }
    });
  }

  initMap(); // initMap関数を呼び出す
});