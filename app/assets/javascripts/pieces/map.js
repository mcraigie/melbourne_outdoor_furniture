document.addEventListener("turbolinks:load", function() {
  if (document.getElementById("piece_map")) {
    if (typeof window.map !== "undefined") {
      window.map.remove();
    }

    window.map = L.map("piece_map").setView([window.lat, window.long], 13);
    L.marker([window.lat, window.long]).addTo(window.map);

    L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
      attribution:
        'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18,
      id: "mapbox.streets",
      accessToken:
        "pk.eyJ1IjoibWNyYWlnaWUiLCJhIjoiY2pjYjhzMHowMTJvMTJ3bzV4c2p3c25uaiJ9.GEFrD6AP_2HC4uv4hUmtkQ",
    }).addTo(window.map);
  }
});
