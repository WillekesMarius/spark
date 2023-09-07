import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

const flatpickr = require("flatpickr");

export default class extends Controller {
  static targets = ["button"]
  connect() {
    flatpickr(thielement, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
  });
  }
}
//   }

//   confirm() {
//     this.date-button.element.innerText = "Confirmed Date!" ;
//     this.date-button.element.setAttribute("confirm", "");

// }



  // 1. name the funnction eg. 'confirmdDate'
  // 2. go to html file && 'data: {action: 'click->datepicker#confirmdDate'}

  // need to connect stimulus

//   const button = document.querySelector("#create-spark")
//   button.addEventListener("click", (event) => {
//     console.log(event);
//     event.currentTarget.classList.remove("btn-primary");
//     event.currentTarget.classList.add("btn-danger");
//     event.currentTarget.innerText = "You have successfully created this event!";
//   })
// }