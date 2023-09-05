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