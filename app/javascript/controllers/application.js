import { Application } from "@hotwired/stimulus"
import "bootstrap-icons/font/bootstrap-icons.css"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
