import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="formtoggle"


export default class extends Controller {
  static targets = ["togglableElement"]

  open () {
     this.togglableElementTarget.classList.toggle("d-none");
  }

}
