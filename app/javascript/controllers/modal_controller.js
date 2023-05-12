import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from "el-transition";

export default class extends Controller {
    static targets = ['closeButton']
    connect() {
        document.getElementById(`modal-${this.element.dataset.modalTriggerId}-wrapper`).addEventListener('click', (event) => {
             this.closeModal(event, this.element.dataset.modalTriggerId);
        });
        this.closeButtonTarget.addEventListener('click',  () => {
            leave(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-wrapper`));
            leave(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-backdrop`));
            leave(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-panel`));
        })
    }

    closeModal(event) {
        const modalPanelClicked = document.getElementById(`modal-${this.element.dataset.modalTriggerId}-panel`).contains(event.target);

        if (!modalPanelClicked && event.target.id !== this.element.dataset.modalTriggerId)  {
            console.log('inside if state')
            leave(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-wrapper`));
            leave(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-backdrop`));
            leave(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-panel`));
        }
    }
    showModal() {
        enter(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-wrapper`));
        enter(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-backdrop`));
        enter(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-panel`));
    }

}
