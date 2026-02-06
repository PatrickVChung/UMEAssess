import { Controller } from "@hotwired/stimulus"
import { Collapse } from "bootstrap"

export default class extends Controller {
  static targets = ["collapse", "header"]

  connect() {
    this.refresh()
  }

  // This runs on connect and can be called after changes
  refresh() {
    const hasChecked = this.collapseTarget.querySelectorAll('input[type="checkbox"]:checked').length > 0
    const bsCollapse = Collapse.getOrCreateInstance(this.collapseTarget, { toggle: false })

    if (hasChecked) {
      bsCollapse.show()
      this.headerTarget.classList.add("has-checked")
    } else {
      this.headerTarget.classList.remove("has-checked")
    }
  }
}
