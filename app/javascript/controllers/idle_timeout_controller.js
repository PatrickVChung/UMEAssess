// app/javascript/controllers/idle_timeout_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    // 15 minutes in milliseconds (15 * 60 * 1000)
    timeout: { type: Number, default: 900000 },
    logoutUrl: String
  }

  connect() {
    console.log("idle_timeout_controller connected!")  
    if (!this.hasLogoutUrlValue) {
      console.warn("IdleTimeoutController: Missing data-idle-timeout-logout-url-value")
      return
    }

    this.events = ["mousemove", "keydown", "scroll", "click"]
    this.boundResetTimer = this.resetTimer.bind(this)

    this.startTracking()
    this.startTimer()

  }

  disconnect() {
    this.stopTracking()
    this.clearTimer()
  }

  startTracking() {
    this.events.forEach(event => {
      window.addEventListener(event, this.boundResetTimer, { passive: true })
    })
  }

  stopTracking() {
    this.events.forEach(event => {
      window.removeEventListener(event, this.boundResetTimer)
    })
  }

  startTimer() {
    this.timeoutId = setTimeout(() => {
      this.logoutUser()
    }, this.timeoutValue)
  }

  resetTimer() {
    this.clearTimer()
    this.startTimer()
  }

  clearTimer() {
    if (this.timeoutId) {
      clearTimeout(this.timeoutId)
    }
  }

  logoutUser() {
    this.stopTracking()
    // Redirect the user to the login or logout page
    window.location.href = this.logoutUrlValue
  }
}
