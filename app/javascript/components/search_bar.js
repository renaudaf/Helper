import algoliasearch from "algoliasearch";


const algoliaSearch = () => {
  const allResults = document.querySelector('.grid-index');
  const inputField = document.querySelector("#search-input");
  const allCards = document.querySelectorAll('.project-link')

  if (inputField) {
    const appId = document.querySelector("meta[name='algolia-app-id']").content;
    const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

    const client = algoliasearch(appId, searchOnlyApiKey);
    const index = client.initIndex('Project');

    inputField.addEventListener("input", () => {
      index.search(inputField.value).then((content) => {
        console.log(content);
        const resultIds = content.hits.map(hit => hit.objectID);
        allCards.forEach(card => {
          if (resultIds.includes(card.dataset.projectId)) {
            card.style.display = "block"
          } else {
            card.style.display = "none"
          }
        });
      })
    });
  }
}

export { algoliaSearch };

