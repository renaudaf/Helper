const addMeasureOnClick = () => {
  const button = document.querySelector('#add-measure');
  if (button) {
    button.addEventListener('click', (e) => {
      e.preventDefault();
      const newfield = `<div class="mt-2">
      <input class="edit-measurement" placeholder="What you are measuring" name="project[measurements][][name]" type="text"> <input class="edit-measurement" placeholder="Width x Length x Height" name="project[measurements][][dimension]" type="text">
    </div>`;
      button.insertAdjacentHTML('beforebegin', newfield);
    })
  }
}


export { addMeasureOnClick };
