import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "badge", "metMin", "grounded", "congrats", "notMet", "distrust", "workTowards", "noDecision", "makingProgress" ]

  updateForm(event) {
    const value = event.target.value

    // Reset or check based on logic
    if (value === 'Badge') { // Adjust these values to match your radio/checkbox values
      this.metMinTarget.checked = true
      this.groundedTarget.checked = true
      this.congratsTarget.checked = true
    } else if (value === 'Deny') {
      this.notMetTarget.checked = true
      this.distrustTarget.checked = true
      this.workTowardsTarget.checked = true
    } else if (value === 'Not Yet') {
      this.notMetTarget.checked = true
      this.noDecisionTarget.checked = true
      this.makingProgressTarget.checked = true
    }
  }
}
