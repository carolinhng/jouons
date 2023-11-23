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
      if (target.innerText === "Activer mon jeu") {
        target.innerHTML = `<i class="fa-solid fa-bolt"></i>Desactiver mon jeu`;
        target.classList.remove("btn-danger");
        target.classList.add("btn-success")
      }
      else {
        target.innerHTML = `<i class="fa-solid fa-bolt"></i>Activer mon jeu`
        target.classList.remove("btn-success")
        target.classList.add("btn-danger")
      }
    });


      // this.buttonTarget.innerText = "Click me!";
      // this.buttonTarget.removeAttribute("disabled");
      // this.linkTarget.classList.add("d-none");

 }



  }
