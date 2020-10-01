import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['amount', 'user']

  connect() {
    this.initCheckboxes()
  }

  initCheckboxes() {
    const AvatarCheckboxes = this.userTargets

    AvatarCheckboxes.forEach((avatar) => {
      avatar.addEventListener("click", (e) => {
        avatar.classList.toggle("active")
      })
    })
  }

  changeInputColor() {
    if (this.amountTarget.value && !this.amountTarget.classList.contains('no-opacity')) {
      this.amountTarget.classList.add('no-opacity')
    } else if (!this.amountTarget.value) {
      this.amountTarget.classList.remove('no-opacity')
    }
  }
}
