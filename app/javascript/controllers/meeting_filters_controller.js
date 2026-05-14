import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["advisorSelect"]

  loadAdvisors(event) {
    const advisorTypeId = event.target.value

    // Reset advisor dropdown
    this.advisorSelectTarget.innerHTML =
      '<option value="">All</option>'

    if (!advisorTypeId) return

    fetch(`/advisor_types/${advisorTypeId}/advisors.json`, {
      headers: { "Accept": "application/json" }
    })
      .then(res => res.json())
      .then(advisors => {
        console.log("Fetched advisors:", advisors)

        advisors.forEach(advisor => {
          const option = document.createElement("option")
          option.value = advisor.id
          option.textContent = advisor.name
          this.advisorSelectTarget.appendChild(option)
        })
      })
  }

}
