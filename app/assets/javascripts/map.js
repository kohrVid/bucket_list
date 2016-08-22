function Map() {
  //Constructor (like initialize in Ruby)
  this.map = new google.maps.Map(document.getElementById('map'), this.defaultOptions);
  this.markers = {};
  this.loadMarkers();
 // this.updateBounds();
  this.eventListener();
}


Map.prototype.defaultOptions = {
  center: { lat: 51.76000699999999, lng: -0.015042 },
  zoom: 8,
  backgroundColor: "#000"
};

Map.prototype.loadMarkers = function() {
  var _this = this;
  $.ajax({
    type: "GET",
    url: "/todo_items",
    contentType: "application/json",
    success: function(todoItems){
      for (var i = 0; i < todoItems.length; i++){
	var todoItem = todoItems[i];
	_this.addMarker(todoItem.name, todoItem.lat, todoItem.lng);
      }
    }
  });
};

Map.prototype.addMarker = function(name, lat, lng) {
  var marker = new google.maps.Marker({
    position: { lat: parseFloat(lat), 
		lng: parseFloat(lng) },
    map: this.map
  });
  this.markers[name] = marker;
  return objectValuesAsArray(this.markers);
};

Map.prototype.eventListener = function() {
  google.maps.event.addListener(this.map, "bounds_changed", this.update, 3000);
};

Map.prototype.update = function() {
  var bounds = this.getBounds();
  var newNorthEast = bounds.getNorthEast();
  var newCentre = bounds.getCenter();
  var newDistance = google.maps.geometry.spherical.computeDistanceBetween(newCentre, newNorthEast);
  if (this.timer) clearTimeout(this.timer);
  this.timer = setTimeout(function() {
    $.get({
      url: "/todo_items/within",
      contentType: "application/js",
      data: {
	centre: {
	  lat: newCentre.lat(),
	  lng: newCentre.lng()
	},
	distance: {
	  distance: newDistance
	}
      }
    });
  });
};

///*
Map.prototype.updateBounds = function() {
  var bounds = new google.maps.LatLngBounds();
  for (var i = 0; i < this.markers.length; i++) {
    var marker = this.markers[i];
    bounds.extend(marker.getPosition());
  }
  this.map.fitBounds(bounds);
};
//*/

var objectValuesAsArray = function(keyValuePair) {
  var newArray = [];
  for (var i in keyValuePair){
    newArray.push(keyValuePair[i]);
  };
  return newArray;
};

//Usage:
var map;
function initMap(){
  map = new Map();
  //$(".eventListener").bind('ajax:success', map.update);
}

