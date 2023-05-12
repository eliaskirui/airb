import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-modal"
export default class extends Controller {
  connect() {
    console.log("Hello form the share modal")
  }

  copyLink() {
    console.log("copy link clicked")
    navigator.clipboard.writeText(this.element.dataset.shareUrl);
      alert("Copied to clipboard");
    }
    shareWhatsapp() {

    }
    shareFacebook() {

    }
    shareTwitter() {

    }

  // copyLink() {
  //   const link = document.getElementById("share-link")
  //   link.select()
  //   document.execCommand("copy")
  // }
}
