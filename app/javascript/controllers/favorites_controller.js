import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    favorite() {
        if(this.element.dataset.favorited === 'true') {
            this.element.dataset.favorited = 'false'
            this.element.setAttribute('fill', 'white');
        } else {
            this.element.dataset.favorited = 'true'
            this.element.setAttribute('fill', 'red');
        }
    }
}
