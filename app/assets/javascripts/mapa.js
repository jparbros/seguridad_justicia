window.mapas = {
  initialize: function(options) {
    this.map = new google.maps.Map(document.getElementById('map'));
    this.loadState(options['state']);
    this.setOptions();
    this.fitBbox();
    this.paintChildren();
    this.polygonzo();
  },
  
  myLatlng: function() {
    new google.maps.LatLng(this.center[1], this.center[0])
  },
  
  loadState: function(state) {
    this.state = window.states[state];
    this.center = this.state.district.centerLL;
    this.bbox = this.state.district.bboxLL;
    this.geo = this.state.district;
  },
  
  setOptions: function() {
    this.map.setCenter(this.myLatlng());
    this.map.setOptions(this.defaults);
  },
  
  fitBbox: function() {
    latLng1 = new google.maps.LatLng(this.bbox[1], this.bbox[0])
    latLng2 = new google.maps.LatLng(this.bbox[3], this.bbox[2])
    LatLngBounds = new google.maps.LatLngBounds(latLng1, latLng2)
    this.map.fitBounds(LatLngBounds);
  },
  
  paintChildren: function() {
    klass = this;
    $.each(this.geo.features, function(index, feature) {
      console.log(feature);
      feature.fillColor = klass.colors[index]
      feature.fillOpacity = '0.4';
      feature.strokeColor = '#666666';
      feature.strokeOpacity = 1;
      feature.strokeWidth = 1;
      feature.distric = klass.district
      if(klass.district)
        feature.distric_id = feature.id;
    });
  },

  polygonzo: function() {
    klass = this
    this.gonzo = new PolyGonzo.PgOverlay({map: this.map, geo: this.geo, events: {
                                            mousemove: function( event, where ) {
                                              feature = where && where.feature
                                              klass.map.setOptions({ draggableCursor: feature ? 'pointer' : null });
                                            },
                                            click: function(event, where) {
                                              window.location = "/distritos/" + where.feature.id;
                                            }
                                    }});
    this.gonzo.setMap(this.map);
  },
  
  colors: ['#e9c5b4','#fdac87','#f69abe','#bf8dbb','#FFC230','#cccccc','#f869a6','#A00059',
           '#e9c5b4','#fdac87','#f69abe','#bf8dbb','#FFC230','#cccccc','#f869a6','#A00059',
           '#e9c5b4','#fdac87','#f69abe','#bf8dbb','#FFC230','#cccccc','#f869a6','#A00059',
           '#e9c5b4','#fdac87','#f69abe','#bf8dbb','#FFC230','#cccccc','#f869a6','#A00059'],

  defaults: {
    zoom: 5,
    panControl: false,
    zoomControl: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.SMALL
    },
    scaleControl: false,
    mapTypeControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false,
    styles: [
      {
        "featureType":"administrative",
        "elementType":"labels",
        "stylers":[
          {
            "visibility":"off"
          }
        ]
      },
      {
        "featureType":"road",
        "stylers":[
          {
            "visibility":"off"
          }
        ]
      },
      {
        "featureType":"poi",
        "stylers":[
          {
            "visibility":"off"
          }
        ]
      },
      {
        "featureType":"water",
        "elementType":"labels",
        "stylers":[
          {
            "visibility":"off"
          }
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
          { "visibility": "on" },
          { "color": "#ffffff" }
        ]
      }
    ]
  }
}