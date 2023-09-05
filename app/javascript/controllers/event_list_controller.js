import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-list"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    // console.log("connected event list")
  }

  highlight(event) {
    // remove highlight from all items
    const listItems = Array.from(this.listTarget.children)
    // console.log(listItems);
    listItems.forEach(item => {
      item.classList.remove("focus-shadow")
    })

    //add highlight to clicked item
    // console.log("highlighting")
    event.currentTarget.classList.add("focus-shadow")
  }

  // this relies on a non-standard feature
  followmouse(event) {
    // console.log(event.layerX, event.layerY)
    event.currentTarget.style.background = `radial-gradient(1500px at ${event.layerX}px ${event.layerY}px, #E9E6FF, transparent)`
  }
}
