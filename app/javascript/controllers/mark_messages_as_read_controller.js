import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-messages-as-read"
export default class extends Controller {

  static targets = ["unread-chats"]
  connect() {
    console.log(this.element)
    console.log(this.unreadChatsTarget)
  }
}
