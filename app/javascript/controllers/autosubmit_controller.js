import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    debounce: { type: Number, default: 150 }
  }

  connect() {
    this._submit = this._debounce(this._doSubmit.bind(this), this.debounceValue)
  }

  submit(event) {
    // If you want to prevent the default browser behavior immediately
    // event?.preventDefault()
    this._submit()
  }

  _doSubmit() {
    if (!this.element) return

    // Ensure the request specifically asks for Turbo Stream
    // This helps if the form_with 'turbo_stream: true' is being finicky
    const requestOptions = {
      responseKind: "turbo-stream"
    }

    if (typeof this.element.requestSubmit === "function") {
      this.element.requestSubmit()
    } else {
      // Fallback for older browsers, though Rails 8 targets modern ones
      this.element.submit()
    }
  }

  _debounce(fn, wait) {
    let t
    return (...args) => {
      clearTimeout(t)
      t = setTimeout(() => fn.apply(this, args), wait)
    }
  }
}
