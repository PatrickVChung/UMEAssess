import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["handle"]

  connect() {
    this.isDragging = false
    this.startX = 0
    this.startY = 0

    // The modal-dialog is what we actually move
    this.dragElement = this.element.querySelector(".modal-dialog")

    // Ensure the header looks clickable
    if (this.hasHandleTarget) {
      this.handleTarget.style.cursor = "move"
    }
  }

  startDrag(e) {
    this.isDragging = true

    // Get current position
    const rect = this.dragElement.getBoundingClientRect()

    // Calculate offset between mouse and top-left of modal
    this.startX = e.clientX - rect.left
    this.startY = e.clientY - rect.top

    // Add global listeners so dragging continues if mouse leaves the header
    document.addEventListener("mousemove", this.drag)
    document.addEventListener("mouseup", this.stopDrag)
  }

  drag = (e) => {
    if (!this.isDragging) return

    // Calculate new position
    let x = e.clientX - this.startX
    let y = e.clientY - this.startY

    // Apply styles to the modal-dialog
    this.dragElement.style.margin = "0" // Override Bootstrap default margin
    this.dragElement.style.position = "absolute"
    this.dragElement.style.left = `${x}px`
    this.dragElement.style.top = `${y}px`
  }

  stopDrag = () => {
    this.isDragging = false
    document.removeEventListener("mousemove", this.drag)
    document.removeEventListener("mouseup", this.stopDrag)
  }
}
