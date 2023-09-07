import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh"
export default class extends Controller {
  connect() {
  }
  refresh() {
    location.reload()
  }
}
