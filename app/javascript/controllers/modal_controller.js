import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // 1. Ensure Bootstrap is available
    if (!window.bootstrap?.Modal) return this._ensureBootstrap()

    // 2. Initialize with unique instance check
    this.modal = new window.bootstrap.Modal(this.element)
    this.modal.show()

    // 3. Bind listeners correctly
    this.element.addEventListener("hidden.bs.modal", this._onHidden)
  }

  disconnect() {
    // IMPORTANT: If we just dispose(), the backdrop might stay if the
    // animation hasn't finished. We force hide, then dispose.
    if (this.modal) {
      this.modal.hide()
      // Use a timeout or check if shown to prevent "dispose while animating" errors
      setTimeout(() => {
        this.modal?.dispose()
      }, 300)
    }
    this.element.removeEventListener("hidden.bs.modal", this._onHidden)
  }

  close() {
    this.modal?.hide()
  }

  _onHidden = () => {
    // Clean up the body classes (important for Bootstrap 5.3)
    document.body.classList.remove('modal-open')
    const backdrop = document.querySelector('.modal-backdrop')
    if (backdrop) backdrop.remove()

    // Clear the container content but KEEP the container div itself
    const container = document.getElementById("modal-container")
    if (container) {
      container.innerHTML = ""
    }
  }

  submitEnd(event) {
    if (event.detail.success) {
      this.close()
      // OPTION A: Full page reload (simplest)
      window.location.reload()       
    }
  }

  _ensureBootstrap() {
    console.error("Bootstrap Modal not found. Check application.js imports.")
  }
}
