const initAvatarCheckboxes = () => {
  const AvatarCheckboxes = document.querySelectorAll(".new-expense-user")
  AvatarCheckboxes.forEach((avatar) => {
    avatar.addEventListener("click", (e) => {
      avatar.classList.toggle("active")
    })
  })
}

export { initAvatarCheckboxes }
