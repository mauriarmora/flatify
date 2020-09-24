const initAvatarCheckboxes = () => {
  const AvatarCheckboxes = document.querySelectorAll(".mediu-avatar")
  AvatarCheckboxes.forEach((avatar) => {
    avatar.addEventListener("click", (e) => {
      avatar.classList.toggle("active")
    })
  })
}

export { initAvatarCheckboxes }
