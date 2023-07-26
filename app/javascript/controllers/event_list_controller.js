import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-list"
export default class extends Controller {
  static targets = ["list"]

  connect() {
  }

  highlight(event) {
    // remove highlight from all items

    //add highlight to clicked item
    console.log("highlighting")
    event.currentTarget.classList.add("green-shadow")
  }
}
