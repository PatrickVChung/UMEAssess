// app/javascript/controllers/meeting_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  loadAdvisors(event) {
    const advisorTypeId = event.target.value

    if (!advisorTypeId) return

    Turbo.visit(
      `/advisor_types/${advisorTypeId}/advisors`,
      { frame: "advisors_frame" }
    )

    Turbo.visit(
      `/advisor_types/${advisorTypeId}/primary_reasons`,
      { frame: "primary_reasons_frame" }
    )

  }

  loadAvailability(event) {
    const advisorId = event.target.value

    if (!advisorId) return

    Turbo.visit(
      `/advisors/${advisorId}/availabilities`,
      { frame: "availability_frame" }
    )
  }
}
