import { Controller } from "@hotwired/stimulus"
import { Offcanvas } from "bootstrap"

export default class extends Controller {
  static targets = ["frame"]

  connect() {
    console.log("Side Panel Controller connected to the DOM!")
    // Target the specific ID of the offcanvas div
    const el = document.getElementById('side_panel')
    if (el) {
      this.offcanvas = new Offcanvas(el)
    }
    // Close when a successful turbo-stream update happens
    document.addEventListener("turbo:before-stream-render", (event) => {
        this.close()
      })
  }

  open(event) {
    event.preventDefault()
    const url = event.currentTarget.href
    const el = document.getElementById('side_panel')

    console.log("Opening side panel for:", url)

    // 1. Set the frame source immediately
    this.frameTarget.src = url

    // 2. Show the offcanvas
    this.offcanvas.show()
  }

  // Add this method to your existing controller
  close() {
    this.offcanvas.hide()
  }
}
