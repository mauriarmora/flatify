import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["submit", "name", "image", "flatmates"]

  connect() {
    this.initialState = {}
    this.saveInitialState()
  }

  saveInitialState() {
    this.initialState.name = this.nameTarget.value
    this.initialState.image = this.imageTarget.value
    this.initialState.flatmates = this.flatmatesTarget.innerHTML
  }

  updateButtonState() {
    if (this.nameHasChanged() || this.imageHasChanged() || this.flatmatesHasChanged()) {
      this.submitTarget.classList.remove("disabledbtn")
      this.submitTarget.classList.add("primarybtn")
      this.submitTarget.disabled = false
    } else {
      this.submitTarget.classList.add("disabledbtn")
      this.submitTarget.classList.remove("primarybtn")
      this.submitTarget.disabled = true
    }
  }

  nameHasChanged() {
    return this.nameTarget.value !== this.initialState.name
  }

  imageHasChanged() {
    return this.imageTarget.value !== this.initialState.image
  }

  flatmatesHasChanged() {
    return this.flatmatesTarget.innerHTML !== this.initialState.flatmates
  }

  fetchMate(){
    const emailInput = document.querySelector("#email-input")
    const rentInput = document.querySelector("#rent-input")
    const userContainer = document.querySelector("#user-container")
    if (rentInput.value == ""|| emailInput.value == "") {
      return
    }

    fetch(`/fetch_mate?email=${emailInput.value}`)
    .then(response => response.json())
    .then((data) => {
      emailInput.value = "";
      const htmlEl = `
      <div class="new-mate-card position-relative">
        <div class="mate-card-complete">
          <div class="add-mate-card">
            <div class="medium-avatar" style="background-image: url(${data.image_url})"></div>
              <p>${data.first_name || "New user"}</p>
            </div>
            <p>€ ${rentInput.value}  </p>
          </div>

          <i class="fas fa-trash-alt delete-flatmate-link" data-action="click->flat#removeMate"></i>
          <input  type="hidden" name="rent[]" value="${rentInput.value}" />
          <input type="hidden" name="flatmate_emails[]" value="${data.email}" />
        </div>`
        userContainer.insertAdjacentHTML("beforeend", htmlEl)
        rentInput.value = "";

        this.updateButtonState()
        // ad the card to the front end
      })
  }

  removeMate(e) {
    Swal.fire({
      title: 'Are you sure you want to delete?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#04AF88',
      cancelButtonColor: '#FF707A',
      confirmButtonText: 'Confirm',
      cancelButtonText: 'Cancel'
    }).then((result) => {
      if (result.isConfirmed) {
        e.target.parentElement.remove()
        this.updateButtonState()
      }
    })
  }
}
