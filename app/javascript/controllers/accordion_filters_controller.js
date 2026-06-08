import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "checkbox", "radio", "searchWord"]

  connect() {
    // 1. Run accordion state checks immediately on page load/render
    this.refreshAccordions()
  }

  // Connected to each individual input change event via data-action
  filterChanged(event) {
    const item = event.target.closest('[data-accordion-filters-target="item"]')
    this.updateSingleAccordion(item)
  }

  // Triggered by the "Clear All Checkboxes" button
  clearFilters(event) {
    event.preventDefault() // Prevent form submission

    this.checkboxTargets.forEach(cb => cb.checked = false)
    this.radioTargets.forEach(radio => radio.checked = false)

    // Re-evaluate all accordion states to remove headers highlight
    this.refreshAccordions()
  }

  // Triggered if clicking custom table rows is required
  openRow(event) {
    const url = event.currentTarget.dataset.href
    if (url) {
      window.open(url, '_blank')
    }
  }

  // Loops through all filters to match server-side state
  refreshAccordions() {
    this.itemTargets.forEach(item => this.updateSingleAccordion(item))
  }

  // Main logic worker
  updateSingleAccordion(item) {
    const collapseEl = item.querySelector('.accordion-collapse')
    const header = item.querySelector('.accordion-header')

    if (!collapseEl) return

    // Scan for checked elements inside this specific accordion item
    const hasCheckbox = item.querySelectorAll('input[type="checkbox"]:checked').length > 0
    const hasRadio = item.querySelectorAll('input[type="radio"]:checked').length > 0
    const hasChecked = hasCheckbox || hasRadio

    // Standard Bootstrap Collapse programmatic check
    // Rails 8 standard asset injection makes 'bootstrap' available globally
    const instance = bootstrap.Collapse.getOrCreateInstance(collapseEl, { toggle: false })

    if (hasChecked) {
      instance.show()
      header.classList.add('has-checked')
    } else {
      header.classList.remove('has-checked')
    }
  }
}
