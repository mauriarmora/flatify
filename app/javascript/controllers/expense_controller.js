import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['amount']

  connect() {
    console.log(this.amountTarget)
  }

  changeInputColor() {
    if (this.amountTarget.value && !this.amountTarget.classList.contains('no-opacity')) {
      this.amountTarget.classList.add('no-opacity')
    } else if (!this.amountTarget.value) {
      this.amountTarget.classList.remove('no-opacity')
    }
  }
}
