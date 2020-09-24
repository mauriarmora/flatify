import { Controller } from "stimulus";

export default class extends Controller {
  fetchMate(){

    const emailInput = document.querySelector("#email-input")
    const rentInput = document.querySelector("#rent-input")
    const userContainer = document.querySelector("#user-container")
    fetch(`/fetch_mate?email=${emailInput.value}`)
    .then(response => response.json())
    .then((data) => {
      emailInput.innerText = "";
      console.log(data)
      const htmlEl = `<div class="new-mate-card">
        <div class="add-mate-card">
          <img src="${data.image_url}" width="50">
          <h5>${data.first_name}</h5>
        </div>
        <p>€${rentInput.value}</p>

         <input type="hidden" name="flatmate_ids[]" value="${data.id}" />
         <input type="hidden" name="rent[]" value="${rentInput.value}" />
      </div>`
      userContainer.insertAdjacentHTML("beforeend", htmlEl)
      rentInput.innerHTML = "";

      // ad the card to the front end
    })
  }
}
