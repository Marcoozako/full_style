// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// import "flatpickr"
import { initFlatpickr } from "./plugins/init_flatpickr.js";

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
})
