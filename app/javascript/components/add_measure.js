const addMeasureOnClick = () => {
  const button = document.querySelector('#add-measure');
  if (button) {
    button.addEventListener('click', (e) => {
      e.preventDefault();
      const newfield = `<div>
      <input placeholder="What you are measuring" name="project[measurements][][name]" type="text"> <input placeholder="1m width 50 cm length" name="project[measurements][][dimension]" type="text">
    </div>`;
      button.insertAdjacentHTML('beforebegin', newfield);
    })
  }
}


export { addMeasureOnClick };
