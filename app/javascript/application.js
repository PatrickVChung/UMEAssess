// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./turbo_spinner"  // not being used right now, db responses was too fast for it
import * as bootstrap from "bootstrap"
import "bootstrap-icons/font/bootstrap-icons.css"
window.bootstrap = bootstrap
// 2. Import your legacy CoffeeScript files
// import "./legacy/courses.coffee"
