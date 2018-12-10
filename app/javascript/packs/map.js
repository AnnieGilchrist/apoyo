import 'mapbox-gl/dist/mapbox-gl.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

const mapElement = document.getElementById('map');


if (mapElement) {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  const marker = JSON.parse(mapElement.dataset.marker);

  new mapboxgl.Marker()
  .setLngLat([marker.lng, marker.lat])
  .setPopup(new mapboxgl.Popup({ offset: 25 })
  .setHTML(marker.infoWindow.content))
  .addTo(map);

  map.setZoom(14);
  map.setCenter([marker.lng, marker.lat]);
}
