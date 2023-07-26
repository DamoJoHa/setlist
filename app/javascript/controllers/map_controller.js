import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"]
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/djhallengren/cljh6pwol00f301pa2vlo57h4"
    })

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  focus(event) {
    // Move map focus
    const lon = event.currentTarget.dataset.lon;
    const lat = event.currentTarget.dataset.lat;
    this.map.flyTo({center: {lon, lat}, duration: 3000, zoom: 16, curve: 1.42})
  }

  // PRIVATE METHODS

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker({color: '#D72638'})
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
