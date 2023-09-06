import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: 'l, F j, Y',
      minDate: "today",
      // dateFormat: "Y-m-d H:i"
      // // disable: this.datesValue,
    });
  }
}



  // 1. name the funnction eg. 'confirmdDate'
  // 2. go to html file && 'data: {action: 'click->datepicker#confirmdDate'}

  // need to connect stimulus

  const button = document.querySelector("#create-spark")
  button.addEventListener("click", (event) => {
    console.log(event);
    event.currentTarget.classList.remove("btn-primary");
    event.currentTarget.classList.add("btn-danger");
    event.currentTarget.innerText = "You have successfully created this event!";
  })