import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="about-box"
export default class extends Controller {
  static targets = ["overlay"]

  connect() {
    console.log(this.overlayTarget)
  }

  show() {
    this.overlayTarget.classList.remove("hidden")
  }

  hide(event) {
    if (event.target == this.overlayTarget) {
      this.overlayTarget.classList.add("hidden")
    }
  }
}
