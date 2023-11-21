import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="formtoggle"


export default class extends Controller {
  static targets = ["togglableElement"]
  connect() {
    console.log('bien joué, envoyé depuis le controller')
  }
  fire () {
     this.togglableElementTarget.classList.toggle("d-none");

  }

}
