const initAvatarCheckboxes = () => {
  const AvatarCheckboxes = document.querySelectorAll(".add-mate-card")
  AvatarCheckboxes.forEach((avatar) => {
    avatar.addEventListener("click", (e) => {
      avatar.classList.toggle("active")
    })
  })
}

export { initAvatarCheckboxes }
