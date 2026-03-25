// 1. MUST BE FIRST: Load the global jQuery wrapper
import "../jquery_global"

import { Application } from "@hotwired/stimulus"
import "bootstrap-icons/font/bootstrap-icons.css"

import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

import "jquery-contextmenu/dist/jquery.contextMenu"
import "jquery-contextmenu/dist/jquery.ui.position"
// ----- jQuery UI (position is included in the dist bundle) -----
import "jquery-ui-dist/jquery-ui.js";

// ----- jquery-contextMenu (JS + CSS) -----
import "jquery-contextmenu/dist/jquery.contextMenu.min.js";
// import "jquery-contextmenu/dist/jquery.contextMenu.min.css";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Make jQuery available for plugins that expect window.$ / window.jQuery


document.addEventListener("turbo:load", function() {
  const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
  const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
})
export { application }
