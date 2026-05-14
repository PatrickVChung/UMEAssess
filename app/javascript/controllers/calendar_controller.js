import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"
import dayGridPlugin from "@fullcalendar/daygrid"
import timeGridPlugin from "@fullcalendar/timegrid"
import interactionPlugin from "@fullcalendar/interaction"
import bootstrap5Plugin from "@fullcalendar/bootstrap5"

export default class extends Controller {
  static values = {
    eventsUrl: String
  }

  connect() {
    this.calendar = new Calendar(this.element, {
      themeSystem: "bootstrap5",
      timeZone: "America/Los_Angeles", // fix the 7 hour offset
      plugins: [
        dayGridPlugin,
        timeGridPlugin,
        interactionPlugin,
        bootstrap5Plugin
      ],
      initialView: "dayGridMonth",
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,timeGridDay"
      },
      events: this.eventsUrlValue,

        eventTimeFormat: {
          hour: "numeric",
          minute: "2-digit",
          meridiem: "short",
          hour12: true
        },

        displayEventEnd: true, // ✅ THIS IS THE KEY LINE


      selectable: true,
      editable: false


    })
    console.log("✅ calendar controller connected")
    this.calendar.render()
  }

  disconnect() {
    this.calendar.destroy()
  }
}
