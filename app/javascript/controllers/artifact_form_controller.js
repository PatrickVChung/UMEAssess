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

  loadSubcategories(event) {
    const categoryId = event.target.value

    if (!categoryId) {
      this.subcategorySelectTarget.innerHTML = `<option value="">---</option>`
      return
    }

    fetch(`/categories/${categoryId}/subcategories`, {
      headers: { Accept: "application/json" }
    })
      .then(r => r.json())
      .then(data => {
        this.subcategorySelectTarget.innerHTML =
          `<option value="">---</option>` +
          data.map(s => `<option value="${s.id}">${s.name}</option>`).join("")
      })
  }
}
