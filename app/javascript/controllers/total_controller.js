import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total"
export default class extends Controller {
  static targets = ["rentStartDate", "rentEndDate", "day", "price", "confirmation"]
  static values = {
    price: Number,
  }
  connect() {
    // console.log(this.rentStartDateTarget.value);
    // console.log(this.rentEndDateTarget.value);
  }

  calculate() {
    // console.log(this.rentEndDateTarget.value);
    const day1 = new Date(this.rentStartDateTarget.value).parse;
    const day2 = new Date(this.rentEndDateTarget.value).parse;

    const [jour, mois, annee] = this.rentStartDateTarget.value.split(".");
    const dateDeDebut = new Date(annee, mois - 1, jour);
    console.log(dateDeDebut);

    const [jour2, mois2, annee2] = this.rentEndDateTarget.value.split(".");
    const dateDeFin = new Date(annee2, mois2 - 1, jour2);
    console.log(dateDeDebut);

    const differenceEnMilliseconds = dateDeFin - dateDeDebut;

    const nombreDeJours = Math.floor(differenceEnMilliseconds / (1000 * 60 * 60 * 24));

    this.dayTarget.innerText = nombreDeJours;

    const total = this.priceValue * parseInt(nombreDeJours);
    this.priceTarget.innerText = total


  }

}
