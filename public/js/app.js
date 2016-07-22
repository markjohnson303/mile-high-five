$( document ).ready(function() {
  console.log(document.getElementById('autocomplete'));
  $(".delete").click(function(){ var id = $(this).closest("tr").data("id"); $.get("/admin/event/" + id, {_method: "delete"}); });
  $(".delete").click(function(){ console.log("delete"); });
});

var navbarHeight = $('.navbar').height(); 

$(window).scroll(function() {
  var navbarColor = "255,255,255";//color attr for rgba
  var smallLogoHeight = $('.small-logo').height();
  var bigLogoHeight = $('.big-logo').height();
  
  
  var smallLogoEndPos = 0;
  var smallSpeed = (smallLogoHeight / bigLogoHeight);
  
  var ySmall = ($(window).scrollTop() * smallSpeed); 
  
  var smallPadding = navbarHeight - ySmall;
  if (smallPadding > navbarHeight) { smallPadding = navbarHeight; }
  if (smallPadding < smallLogoEndPos) { smallPadding = smallLogoEndPos; }
  if (smallPadding < 0) { smallPadding = 0; }
  
  $('.small-logo-container ').css({ "padding-top": smallPadding});
  
  var navOpacity = ySmall / smallLogoHeight; 
  if  (navOpacity > 1) { navOpacity = 1; }
  if (navOpacity < 0 ) { navOpacity = 0; }
  var navBackColor = 'rgba(' + navbarColor + ',' + navOpacity + ')';
  $('.navbar').css({"background-color": navBackColor});
  
  var shadowOpacity = navOpacity * 0.4;
  if ( ySmall > 1) {
    $('.navbar').css({"box-shadow": "0 2px 3px rgba(0,0,0," + shadowOpacity + ")"});
  } else {
    $('.navbar').css({"box-shadow": "none"});
  }
  
});

$('form').on('keyup keypress', function(e) {
  var keyCode = e.keyCode;
  if (keyCode === 13) { 
    e.preventDefault();
    return false;
  }
});

// This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name',
        lat: 'short_name',
      };


      function initAutocomplete() {
        $( document ).ready(function() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        console.log("hello");
        console.log(document.getElementById('autocomplete'));
        autocomplete = new google.maps.places.Autocomplete(
          /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
          {types: ['geocode', 'establishment']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      });
      }

      function fillInAddress() {
        console.log("fill in");
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();
        console.log(place);

        document.getElementById("lat").value = place.geometry.location.lat();
        document.getElementById("lng").value = place.geometry.location.lng();
        document.getElementById("placename").value = place.name;
        console.log(place.geometry.location.lat());

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.


      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        console.log("geolocate");
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }

