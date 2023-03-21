import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "icon", "searchBtn"]

  connect() {

}
clicked() {
  this.iconTarget.classList.toggle("searchbtnActive");
  this.formTarget.classList.toggle("active");
}
}
