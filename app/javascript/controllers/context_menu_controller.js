import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "metadata"]
  // CRITICAL: This must be uncommented for this.epaValue to work!
  static values = { epa: String }


  connect() {
    this.epaDataStore = {}

    if (!this.hasMenuTarget) {
      console.warn("Context Menu: menu target missing")
      return
    }

    this.buildMenu()
    this.menuTarget.style.display = "none"

    console.log("Inside contex_menu_controller.js file ==> connect!!")

    this.clickOutsideHandler = (e) => this.closeMenu(e)
    document.addEventListener("click", this.clickOutsideHandler)
  }

  get menuItems() {
    return [
      { label: "EPA1A - History", key: "EPA1A" },
      { label: "EPA1B - Physical", key: "EPA1B" },
      { divider: true },
      { label: "EPA2 - DDx", key: "EPA2" },
      { label: "EPA3 - Tests", key: "EPA3" },
      { label: "EPA4 - Orders", key: "EPA4" },
      { label: "EPA5 - Document", key: "EPA5" },
      { label: "EPA6 - Present", key: "EPA6" },
      { label: "EPA7 - EBDM", key: "EPA7" },
      { label: "EPA8 - Handover", key: "EPA8" },
      { label: "EPA9 - Collaboration", key: "EPA9" },
      { label: "EPA10 - Urgent", key: "EPA10" },
      { label: "EPA11 - SDM", key: "EPA11" }
    ]
  }

  buildMenu() {
    if (!this.hasMenuTarget) return;

    this.menuTarget.innerHTML = this.menuItems.map(item => {
      if (item.divider) return '<div class="dropdown-divider"></div>'
      return `
        <button type="button"
                class="dropdown-item"
                data-key="${item.key}"
                data-action="mousedown->context-menu#copyAndPaste">
          <i class='bi bi-copy' style='color:#E1191C'></i> ${item.label}
        </button>`
    }).join("")
  }

  show(event) {
    event.preventDefault()
    event.stopPropagation()

    if (!this.hasMenuTarget) return

    // Teleport safely at runtime
    if (!document.body.contains(this.menuTarget)) {
      document.body.appendChild(this.menuTarget)
    }

    this.savedSelection = window.getSelection().toString().trim()
    const { clientX: x, clientY: y } = event

    Object.assign(this.menuTarget.style, {
      display: "block",
      position: "fixed",
      top: `${y}px`,
      left: `${x}px`,
      zIndex: "99999"
    })
  }


  copyAndPaste(event) {
    const key = event.currentTarget.dataset.key
    const textToPaste = this.savedSelection

    if (!textToPaste) return alert("Please highlight some text first!")

    this.epaDataStore[key] = textToPaste
    this.syncMetadata()

    // Safety check for epaValue
    const currentEpa = this.hasEpaValue ? this.epaValue : null

    if (currentEpa === key) {
      const commentsField = document.getElementById("epa_review_general_comments2") ||
                           document.getElementById("epa_review_general_comments1")
      if (commentsField) {
        const formattedEntry = `[${key}]: ${textToPaste}`
        commentsField.value = commentsField.value
          ? `${commentsField.value}\n${formattedEntry}`
          : formattedEntry

        commentsField.dispatchEvent(new Event('input'))
        commentsField.focus()
      }
    }
    this.closeMenu()
  }

  syncMetadata() {
    if (this.hasMetadataTarget) {
      this.metadataTarget.value = JSON.stringify(this.epaDataStore)
    }
  }

  closeMenu(event) {
    if (!this.hasMenuTarget) return;
    if (!event || !this.menuTarget.contains(event.target)) {
      this.menuTarget.style.display = 'none'
    }
  }


  disconnect() {
    if (this.menuTarget) {
      this.menuTarget.remove()
    }
    document.removeEventListener("click", this.clickOutsideHandler)
  }

}
