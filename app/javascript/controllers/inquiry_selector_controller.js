import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chat", "box", "list"]

  connect() {
    console.log(this.chatTarget)
    console.log(this.boxTarget)
    console.log(this.listTarget)
  }

  updateInquiry() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
