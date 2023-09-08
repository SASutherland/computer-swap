// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['Computing Power', 'Processor Speed', 'Screen Resolution', 'Operating System', 'Memory'],
      typeSpeed: 30,
      loop: true
    })
  }
}
