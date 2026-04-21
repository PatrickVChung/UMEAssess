import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = [ "startInput", "endInput" ]
  connect() {
    // 1. Log to prove we are here
    console.log("Stimulus connecting to:", this.element.id)

    this.endPicker = flatpickr(this.endInputTarget, {
      enableTime: true,
      altInput: true,
      minTime: "07:00",
      maxTime: "20:00",
      altFormat: "F j, Y h:i K",
      dateFormat: "Y-m-d H:i K",
      allowInput: true,
    })

    this.startPicker = flatpickr(this.startInputTarget, {
      enableTime: true,
      altInput: true,
      minTime: "07:00",
      maxTime: "20:00",
      altFormat: "F j, Y h:i K",
      dateFormat: "Y-m-d H:i K",
      allowInput: true,
      onChange: (selectedDates) => {
        this.updateEnd(selectedDates[0])
      }
    })
  }
  updateEnd(startDate) {
    if (!startDate || !this.endPicker) return

    const endDate = new Date(startDate.getTime())
    endDate.setHours(endDate.getHours() + 5)

    this.endPicker.setDate(endDate)

    // Optional: Prevent picking a time before the start date
    this.endPicker.set("minDate", startDate)
  }
  disconnect() {
      // Clean up to prevent memory leaks
      if (this.startPicker) this.startPicker.destroy()
      if (this.endPicker) this.endPicker.destroy()
    }
}
