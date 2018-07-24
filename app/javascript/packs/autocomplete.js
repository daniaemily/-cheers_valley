function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let wineryAddress = document.getElementById('winery_address');

    if (wineryAddress) {
      let autocomplete = new google.maps.places.Autocomplete(wineryAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(wineryAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
