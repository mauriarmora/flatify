import { Controller } from "stimulus";

export default class extends Controller {
  fetchMate(){

    const emailInput = document.querySelector("#email-input")
    const rentInput = document.querySelector("#rent-input")
    const userContainer = document.querySelector("#user-container")
    fetch(`/fetch_mate?email=${emailInput.value}`)
    .then(response => response.json())
    .then((data) => {
      emailInput.value = "";
      console.log(data)
      const htmlEl = `<div class="new-mate-card">
        <div class="mate-card-complete">
          <div class="add-mate-card">
            <img src="${data.image_url}" width="50">
            <h5>${data.first_name || "Flatifyer"}</h5>
          </div>
          <p>€${rentInput.value}</p>
        </div>

         <input type="hidden" name="flatmate_emails[]" value="${data.email}" />
         <input type="hidden" name="rent[]" value="${rentInput.value}" />
      </div>`
      userContainer.insertAdjacentHTML("beforeend", htmlEl)
      rentInput.value = "";

      // ad the card to the front end
    })
  }
}
