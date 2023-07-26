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
      item.classList.remove("green-shadow")
    })

    //add highlight to clicked item
    console.log("highlighting")
    event.currentTarget.classList.add("green-shadow")
  }
}
