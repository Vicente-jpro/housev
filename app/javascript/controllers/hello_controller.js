import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"

    alert("Hello from stimulos")
    console.log("Hello from stimulos")
  }
}
