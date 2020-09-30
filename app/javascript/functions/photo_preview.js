const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      if (document.querySelector('.flats_edit')) {
        displayFlatPreview(input)
      } else {
        displayExpensePreview(input);
      }
    })
  }
}

const displayFlatPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('banner').style.backgroundImage = `linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.4)), url(${event.currentTarget.result})`;
    }
    reader.readAsDataURL(input.files[0])
  }
}
const displayExpensePreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };

