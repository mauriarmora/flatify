const initCheckboxes = () => {
  const checkboxes = document.querySelectorAll(".category-choice")
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("click", (e) => {
      checkboxes.forEach((checkbox2) => {
        checkbox2.classList.remove("active")
      })
      checkbox.classList.add("active")
    })
  })
}

export { initCheckboxes }
