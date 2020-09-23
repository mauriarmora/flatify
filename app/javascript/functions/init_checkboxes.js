const initCheckboxes = () => {
  const checkboxes = document.querySelectorAll(".category-choice")
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("click", (e) => {
      checkboxes.forEach((all_checkboxes) => {
        all_checkboxes.style.background = "white"
        all_checkboxes.classList.remove("active")
      })

      checkbox.classList.add("active")
      checkbox.style.background = checkbox.dataset.color
    })
  })
}

export { initCheckboxes }
