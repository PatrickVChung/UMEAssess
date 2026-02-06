import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  submit(event) {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.querySelector("form").requestSubmit()
    }, 250)
  }
}
