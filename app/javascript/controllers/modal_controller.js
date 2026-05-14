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

    console.log("Modal Controller connected!")
  }


  disconnect() {
    if (this.modal) {
      this.modal.dispose()
      this.modal = null
    }
    this.element.removeEventListener("hidden.bs.modal", this._onHidden)
  }


  close() {
    this.modal?.hide()
  }

  _onHidden = () => {
    // 1. Cleanup Bootstrap artifacts
    document.body.classList.remove('modal-open');
    document.body.style.overflow = '';
    document.body.style.paddingRight = '';

    document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());

    // 2. IMPORTANT: Remove the modal HTML so the container is empty for the next Turbo update
    this.element.remove();
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
