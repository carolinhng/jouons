import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="formtoggle"


export default class extends Controller {
  static targets = ["togglableElement"]
  static values = {
    url: String
  }
  connect() {
  }
  open () {
     this.togglableElementTarget.classList.toggle("d-none");
  }
  fire () {
    fetch(this.urlValue, {
    method: 'PATCH',
    headers: { "Accept": "text/plain"} })
      .then(response => response.text())
      .then((data) => {
      })

    this.togglableElementTargets.forEach(target => {
      target.classList.toggle("d-none");
    });
 }
  }
