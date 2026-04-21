import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  static values = { options: Object }

  connect() {
    this.select = new TomSelect(this.element, {
      ...this.optionsValue,
      dropdown_header: 'Student Name',
      // We listen for the 'change' event inside Tom Select
      onChange: (value) => {
        this.submitForm()
      }
// Add any default configurations here
    })
  }

  submitForm() {
    // requestSubmit() is better than submit() because it works with Turbo
    this.element.form.requestSubmit()
  }

  disconnect() {
    if (this.select) {
      this.select.destroy()
    }
  }
}
