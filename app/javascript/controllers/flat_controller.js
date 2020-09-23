import { Controller } from "stimulus";

export default class extends Controller {
  fetchMate(){
    const emailInput = document.querySelector("#email-input")
    const rentInput = document.querySelector("#rent-input")
    const userContainer = document.querySelector("#user-container")
    fetch(`/fetch_mate?email=${emailInput.value}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      const htmlEl = `<div>
        <h5>${data.first_name}</h5>
         <input type="hidden" name="flatmate_ids[]" value="${data.id}" />
         <input type="hidden" name="rent[]" value="${rentInput.value}" />
      </div>`
      userContainer.insertAdjacentHTML("beforeend", htmlEl)
      // ad the card to the front end
    })
  }
}
