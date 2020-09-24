const initAvatarCheckboxes = () => {
  const AvatarCheckboxes = document.querySelectorAll(".medium-avatar")
  AvatarCheckboxes.forEach((avatar) => {
    avatar.addEventListener("click", (e) => {
      avatar.classList.toggle("active")
    })
  })
}

export { initAvatarCheckboxes }
