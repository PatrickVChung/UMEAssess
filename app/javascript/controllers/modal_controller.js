import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["dialog"]

  connect() {
    this._ensureBootstrap()
    // Initialize Bootstrap Modal on root element
    this.modal = new window.bootstrap.Modal(this.element, {
      backdrop: "static",  // optional: prevent accidental click-away close
      keyboard: true
    })

    // Show immediately when inserted via Turbo Stream
    this.modal.show()

    // Ensure proper lifecycle with Turbo caching
    document.addEventListener("turbo:before-cache", this._beforeCache)
    this.element.addEventListener("hidden.bs.modal", this._onHidden)
  }

  disconnect() {
    document.removeEventListener("turbo:before-cache", this._beforeCache)
    this.element.removeEventListener("hidden.bs.modal", this._onHidden)
    try { this.modal?.dispose() } catch(e) {}
  }

  // Close programmatically from actions or stream invokes
  close() {
    try { this.modal?.hide() } catch(e) {}
  }

  // Private
  _beforeCache = () => {
    try { this.modal?.hide() } catch(e) {}
  }

  _onHidden = () => {
    // Optional: let the server also remove the container via stream
    // but we also defensively clear client-side
    const container = document.getElementById("modal-container")
    if (container) container.innerHTML = ""
  }

  _ensureBootstrap() {
    if (!window.bootstrap?.Modal) {
      console.error("Bootstrap Modal not found. Did you import bootstrap in application.js?")
    }
  }
  // High-value: Hide modal when a Turbo submit is successful
  submitEnd(event) {
    if (event.detail.success) {
      this.close()
    }
  }
}
