import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["studentSelect", "subcategorySelect"]

  connect() {
    console.log("artifact-form controller connected")
  }

  loadStudents(event) {
    console.log("loadStudents fired!")

    const cohortId = event.target.value

    if (!cohortId) {
      this.studentSelectTarget.innerHTML = `<option value="">Please Select a Student</option>`
      return
    }

    fetch(`/cohorts/${cohortId}/students`, {
      headers: { Accept: "application/json" }
    })
      .then(r => r.json())
      .then(data => {
        this.studentSelectTarget.innerHTML =
          `<option value="">Please Select a Student</option>` +
          data.map(s => `<option value="${s.id}">${s.full_name}</option>`).join("")
      })
  }

  // app/javascript/controllers/artifact_form_controller.js
  loadSubcategories(event) {
    const categoryId = event.target.value

    if (!categoryId) {
      this.subcategorySelectTarget.innerHTML = `<option value="">---</option>`
      return
    }

    fetch(`/categories/${categoryId}/subcategories`, {
      headers: { "Accept": "application/json" }
    })
      .then(response => {
        // Catch bad server responses before trying to parse JSON
        if (!response.ok) {
          throw new Error(`Server returned status code: ${response.status}`)
        }
        return response.json()
      })
      .then(data => {
        this.subcategorySelectTarget.innerHTML =
          `<option value="">---</option>` +
          data.map(s => `<option value="${s.id}">${s.name}</option>`).join("")
      })
      .catch(error => {
        console.error("Failed to load subcategories:", error)
        this.subcategorySelectTarget.innerHTML = `<option value="">Error loading subcategories</option>`
      })
  }
}
