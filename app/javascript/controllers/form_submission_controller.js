import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Automatically submit the form when a select value changes
  submit() {
    this.element.requestSubmit();
  }
}
