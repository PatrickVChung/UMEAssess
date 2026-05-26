// app/javascript/controllers/nested_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "template"]

  connect() {
    console.log("Nested Form Controller connected successfully!")
  }

  add(event) {
    event.preventDefault()

    // Safely get the HTML content out of the HTML template wrapper
    const templateContent = this.templateTarget.innerHTML

    // Replace the placeholder index with a unique timestamp string
    const content = templateContent.replace(/NEW_RECORD/g, new Date().getTime())

    // Insert the new fields into your UI
    this.containerTarget.insertAdjacentHTML("beforeend", content)
  }

  remove(event) {
    event.preventDefault()

    let wrapper = event.target.closest(".nested-fields")
    if (wrapper) {
      let destroyInput = wrapper.querySelector("input[name*='[_destroy]']")
      if (destroyInput) {
        destroyInput.value = "1"
        wrapper.style.display = "none"
      } else {
        wrapper.remove()
      }
    }
  }
}
