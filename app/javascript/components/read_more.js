export const initReadMore = () => {
  document.querySelectorAll(".read-more").forEach((readMoreLink) => {
    readMoreLink.addEventListener('click', (event) => {
      event.preventDefault();
      readMoreLink.parentNode.innerText = readMoreLink.dataset.fullPitch
    });
  });
}
